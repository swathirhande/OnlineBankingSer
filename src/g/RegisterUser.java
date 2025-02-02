package g;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class RegisterUser {
	static int status = 0;
	private static final Logger _log = LogManager.getLogger(RegisterUser.class);

	public static int register(String username, String password, String repassword, double amount, String adderess,
			double phone) {

		Connection con = GetCon.getCon();
		if (con == null) {
			System.out.println("con is NULL");
		}

		PreparedStatement ps;
		try {
			_log.info("Initiating Login for user : " + username);
			ps = con.prepareStatement("INSERT INTO `nmit`.`newaccount` "
					+ "(`ACCOUNTNO`, `USERNAME`, `PASSWORD`, `REPASSWORD`, `AMOUNT`, `ADDRESS`, `PHONE`)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?)");

			ps.setInt(1, 0);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setString(4, repassword);
			ps.setDouble(5, amount);
			ps.setString(6, adderess);
			ps.setDouble(7, phone);

			status = ps.executeUpdate();

			System.out.println("Status checked");
			_log.info(String.format("Creation %s of user : %s", status > 0 ? "Successfully" : "Not Successful",
					username));

		} catch (Exception e) {
			_log.error("Error while creation user: " + username);
			_log.error(e);
		}
		return status;

	}
}
