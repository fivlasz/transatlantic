package tools;

public class AntlrTool {

	public static void main(String[] args) {
		AntlrTool antlrTool = new AntlrTool();
		antlrTool.startAntlrTool(args);
	}

	public void startAntlrTool(String[] args) {
		org.antlr.Tool.main(args);
	}
}
