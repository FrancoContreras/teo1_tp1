package analizador;

public class Token {
    private String tokenTipo;
    private String lexema;

    public Token(String tokenTipo, String lexema) {
        this.tokenTipo = tokenTipo;
        this.lexema = lexema;
    }

    public String getTokenTipo() {
        return tokenTipo;
    }

    public String getLexema() {
        return lexema;
    }

    @Override
    public String toString() {
        return "Token{" +
                "tokenTipo=" + tokenTipo +
                ", lexema='" + lexema + '\'' +
                '}';
    }
}
