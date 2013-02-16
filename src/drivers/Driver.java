package drivers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public interface Driver {

	/**
	 * Process input.
	 * 
	 * @param input
	 *            input stream
	 * @param output
	 *            output stream
	 * @throws IOException
	 *             thrown in case of an IO exception
	 */
	public void process(InputStream input, OutputStream output)
			throws IOException, Exception;

}