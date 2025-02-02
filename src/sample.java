import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class sample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		String f = "C:/Temp1/log2.txt";
		Scanner y = new Scanner(new File(f), StandardCharsets.UTF_8.name());
		// y.useDelimiter(",");
		System.out.println("Inside try");
		while (y.hasNextLine()) {
			System.out.println("INSIDE TRY");
			String ID = y.next();
			System.out.println(ID);
			String t = y.next();
			System.out.println(t);
		}
		String t = "1582784249";
		String e = "1582783977";
	}
}