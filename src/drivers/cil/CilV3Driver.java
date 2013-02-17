package drivers.cil;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.antlr.runtime.ANTLRInputStream;
import org.antlr.runtime.CommonTokenStream;
import org.antlr.runtime.RecognitionException;
import org.antlr.runtime.tree.CommonTree;
import org.antlr.runtime.tree.CommonTreeNodeStream;

import parsing.cil.antlr3.CILLexer;
import parsing.cil.antlr3.CILParser;
import transformation.cil.antlr3.CILTransformer;
import drivers.Driver;

public class CilV3Driver implements Driver {

	@Override
	public void process(InputStream input, OutputStream output)
			throws IOException, RecognitionException {
		PrintWriter writer = new PrintWriter(output);

		ANTLRInputStream inputStream = new ANTLRInputStream(input);
		// lexer
		CILLexer lexer = new CILLexer(inputStream);
		// parser
		CommonTokenStream tokenStream = new CommonTokenStream(lexer);
		CILParser parser = new CILParser(tokenStream);
		// tree
		CILParser.start_return startNode = parser.start();
		CommonTree tree = startNode.getTree();

		writer.write(tree.toStringTree());
		writer.println();
		writer.println();

		// tree transformation
		CommonTreeNodeStream treeNodes = new CommonTreeNodeStream(tree);
		CILTransformer transformation = new CILTransformer(treeNodes);
		CommonTree rewrittenTree = (CommonTree) transformation.top().getTree(); //downup(tree);

		writer.write(rewrittenTree.toStringTree());
		writer.close();
	}

}
