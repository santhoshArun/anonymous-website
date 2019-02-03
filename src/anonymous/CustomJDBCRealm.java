package anonymous;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.JdbcUtils;
import org.apache.shiro.util.SimpleByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author kiranchowdhary
 * 
 *         Application specific JDBC realm. If required override methods of {@link JdbcRealm} to load users, roles and
 *         permissions from database.
 * 
 *         Do not override configuration in code if it can be done via shiro.ini file.
 */
public class CustomJDBCRealm extends JdbcRealm {

    private static final Logger log = LoggerFactory.getLogger(JdbcRealm.class);

    public CustomJDBCRealm() {
        super();
        setSaltStyle(SaltStyle.COLUMN);
    }

    /**
     * overriding the method which is in JdbcRealm. If SaltStyle is COLUMN, then gets String salt value from database
     * and forms salt byte array of type {@link ByteSource} with decoded string salt value and sets it to salt value of
     * AuthenticationInfo.
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();

        // Null username is invalid
        if (username == null) {
            throw new AccountException("Null usernames are not allowed by this realm.");
        }

        Connection conn = null;
        SimpleAuthenticationInfo info = null;
        try {
            conn = dataSource.getConnection();

            String password = null;
            String salt = null;
            switch (saltStyle) {
            case NO_SALT:
            case CRYPT:
            case EXTERNAL:
                return super.doGetAuthenticationInfo(token);
            case COLUMN:
                String[] queryResults = getPasswordForUser(conn, username);
                password = queryResults[0];
                salt = queryResults[1];
                break;
            }

            if (password == null) {
                throw new UnknownAccountException("No account found for user [" + username + "]");
            }

            info = new SimpleAuthenticationInfo(username, password.toCharArray(), getName());

            if (salt != null) {
                info.setCredentialsSalt(new SimpleByteSource(Base64.decode(salt)));
            }

        } catch (SQLException e) {
            final String message = "There was a SQL error while authenticating user [" + username + "]";
            if (log.isErrorEnabled()) {
                log.error(message, e);
            }

            // Rethrow any SQL errors as an authentication exception
            throw new AuthenticationException(message, e);
        } finally {
            JdbcUtils.closeConnection(conn);
        }

        return info;
    }

    private String[] getPasswordForUser(Connection conn, String username) throws SQLException {

        String[] result;
        boolean returningSeparatedSalt = false;
        switch (saltStyle) {
        case NO_SALT:
        case CRYPT:
        case EXTERNAL:
            result = new String[1];
            break;
        default:
            result = new String[2];
            returningSeparatedSalt = true;
        }

        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(authenticationQuery);
            ps.setString(1, username);

            // Execute query
            rs = ps.executeQuery();

            // Loop over results - although we are only expecting one result,
            // since usernames should be unique
            boolean foundResult = false;
            while (rs.next()) {

                // Check to ensure only one row is processed
                if (foundResult) {
                    throw new AuthenticationException("More than one user row found for user [" + username
                            + "]. Usernames must be unique.");
                }

                result[0] = rs.getString(1);
                if (returningSeparatedSalt) {
                    result[1] = rs.getString(2);
                }

                foundResult = true;
            }
        } finally {
            JdbcUtils.closeResultSet(rs);
            JdbcUtils.closeStatement(ps);
        }

        return result;
    }
}