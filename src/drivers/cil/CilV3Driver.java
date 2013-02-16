package drivers.cil;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.antlr.runtime.ANTLRInputStream;
import org.antlr.runtime.CommonTokenStream;
import org.antlr.runtime.RecognitionException;

import parsing.cil.antlr3.CILLexer;
import parsing.cil.antlr3.CILParser;

import drivers.Driver;

public class CilV3Driver implements Driver {

	@Override
	public void process(InputStream input, OutputStream output)
			throws IOException, RecognitionException {
		ANTLRInputStream inputStream = new ANTLRInputStream(input);
		// lexer
		CILLexer lexer = new CILLexer(inputStream);
		// parser
		CommonTokenStream tokenStream = new CommonTokenStream(lexer);
		CILParser parser = new CILParser(tokenStream);
		// tree
		CILParser.start_return startNode = parser.start();
		PrintWriter writer = new PrintWriter(output);
		writer.write(startNode.getTree().toStringTree());
		writer.close();
	}

}
