package g;

import static javax.swing.JOptionPane.showMessageDialog;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Scanner;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class verifyLogin1 {
	private static Scanner y;
	String f = "C:/Temp1/log2.txt";
	private static final Logger _log = LogManager.getLogger(verifyLogin1.class);

	public static int readRecord(int accountno, String f, long d) {
		int m = 0;
		String acno = Integer.toString(accountno);
		String ds = Long.toString(d);
		boolean found = false;
		String ID;
		String t;
		try {

			Date date1 = new Date();
			y = new Scanner(new File(f), StandardCharsets.UTF_8.name());
			// y.useDelimiter(",");
			System.out.println("Inside try");
			while (y.hasNextLine()) {
				System.out.println("INSIDE TRY");
				ID = y.next();
				t = y.next();

				long s;

				System.out.println("INSIDE TRY-1");

				if (ID.equals(acno)) {
					if (Integer.parseInt(t) - d < 30) {
						m = 1;

					} else {
						m = 0;
					}
				} else {
					m = 0;
					System.out.println("INSIDE TRY-2");
				}

			}

		} catch (Exception e) {
			e.getStackTrace();
			e.getMessage();
		}
		System.out.println("Value of m is" + m);
		return m;
	}

	public static boolean checkLogin(int accountno, String username, String password) {

		boolean status = false;
		Connection con = GetCon.getCon();
		try {
			// to check the user has logged before 60 seconds
			File file = new File("C:/Temp1/log2.txt");

			BufferedReader br = new BufferedReader(new FileReader(file));
			Date date = new Date();
			long seconds = date.getTime() / 1000L;
			System.out.println("The seconds is :" + seconds);
			int o = 0;
			String f1 = "C:/Temp1/log22.csv";
			o = readRecord(accountno, f1, seconds);

			if (o == 1) {
				showMessageDialog(null, "Can't login");

			} else {

				_log.info("Initiating Login for user : " + username);
				PreparedStatement ps = con.prepareStatement(
						"Select * from NEWACCOUNT where accountno=? and username = ? and password =?");
				ps.setInt(1, accountno);
				ps.setString(2, username);
				ps.setString(3, password);

				ResultSet rs = ps.executeQuery();
				status = rs.next();
				_log.info(String.format("Login %s for user : %s", status ? "Successful" : "not successful", username));

				// Date today = new Date();

				// time = today.getHours() + ":" + today.getMinutes() + ":" +
				// today.getSeconds();
				String file1 = "C:/Temp1/log2.txt";
				String file21 = "C:/Temp1/logtime1.txt";
				String file22 = "C:/Temp1/log22.csv";
				FileWriter fw = new FileWriter(file1, true);
				BufferedWriter bw = new BufferedWriter(fw);
				PrintWriter pw = new PrintWriter(bw);
				pw.append(accountno + "," + seconds);
				pw.append("\n");
				FileWriter fw1 = new FileWriter(file22, true);
				BufferedWriter bw1 = new BufferedWriter(fw1);
				PrintWriter pw1 = new PrintWriter(bw1);
				pw1.append(accountno + "," + seconds);
				pw1.append("\n");
				FileWriter fw21 = new FileWriter(file21, true);
				BufferedWriter bw21 = new BufferedWriter(fw21);
				PrintWriter pw21 = new PrintWriter(bw21);
				String sec = Long.toString(seconds);
				pw21.append(sec);
				pw21.append("\n");
				/*
				 * FileWriter fw1 = new FileWriter(file, true); BufferedWriter bw1 = new
				 * BufferedWriter(fw1); PrintWriter pw1 = new PrintWriter(bw1);
				 * pw1.append(accountno + "," + username + "," + seconds);
				 */
				String input;
				int count = 0;
				while ((input = br.readLine()) != null) {
					count++;
				}

				pw.close();
				pw1.close();
				pw21.close();
				// JOptionPane.showMessageDialog(null, "Record Saved");

			}
		} catch (Exception e) {
			_log.error(e);
			// JOptionPane.showMessageDialog(null, "Record not Saved");
		}

		return status;
	}

}

/*
 * private static Scanner x; String filename="C:/Temp2/log2.csv"; public static
 * int readRecord(int accountno,String filename) throws FileNotFoundException,
 * IOException { boolean found=false; BufferedReader br = new BufferedReader(new
 * FileReader("C:/Temp2/log2.csv")); StringTokenizer st; String line; while (
 * (line = br.readLine()) != null ) { String[] values = line.split("/");
 * if(values[searchColumnIndex].equals(searchString)) { resultRow = line; break;
 * } } br.close(); return resultRow;
 *
 *
 * //if(accountno==" " && ) //{ //
 * alert("User cant be logged in as he has logged before 60 sec"); //} return 1;
 * }
 *
 * }
 */