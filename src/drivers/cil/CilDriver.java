package drivers.cil;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.TokenStreamRewriter;

import parsing.cil.antlr4.CILLexer;
import parsing.cil.antlr4.CILParser;
import parsing.cil.antlr4.CILParser.StartContext;

import drivers.Driver;

/**
 * Main driver.
 */
public class CilDriver implements Driver {

	/* (non-Javadoc)
	 * @see drivers.Driver#process(java.io.InputStream, java.io.OutputStream)
	 */
	@Override
	public void process(InputStream input, OutputStream output)
			throws IOException {
		PrintWriter writer = new PrintWriter(output);
		ANTLRInputStream inputStream = new ANTLRInputStream(input);
		CILLexer lexer = new CILLexer(inputStream);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		CILParser parser = new CILParser(tokens);
		StartContext tree = parser.start();
		TokenStreamRewriter rewriter = new TokenStreamRewriter(tokens);
		
		writer.write(rewriter.getText());
		writer.flush();
		
		tree.inspect(parser);
	}
}
