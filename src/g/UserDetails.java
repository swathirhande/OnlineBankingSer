package g;

//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;

public class UserDetails {
	// private static final Logger _log = LogManager.getLogger(UserDetails.class);
	public String username;
	public String password;
	public int accNo;

	public UserDetails(String username, String password, int accNo) {
		this.username = username;
		this.password = password;
		this.accNo = accNo;
	}

	public UserDetails() {
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAccNo() {
		return accNo;
	}

	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}

	@Override
	public String toString() {
		return "UserDetails [username=" + username + ", password=" + password + ", accNo=" + accNo + "]";
	}

}
