package drivers;

import java.io.IOException;

import drivers.cil.CilV3Driver;

public class Main {

	public static void main(String[] args) throws Exception {
		Driver driver = new CilV3Driver();
		try {
			driver.process(System.in, System.out);
		} catch (IOException e) {
			System.err.println(e);
		}
	}
}
