package analizador;

public class Token {
    private String token;
    private String lexema;
    private int columna;
    private int linea;
    private String tipo;
    private String valor;
    private String nombre;
    private boolean ts;

    public Token(String token, String lexema, int columna, int linea) {
        this.token = token;
        this.lexema = lexema;
        this.columna = columna;
        this.linea = linea;
        this.ts = false;
    }
    
    public Token(String token, String lexema, int columna, int linea, String tipo, String valor, String nombre) {
        this.token = token;
        this.lexema = lexema;
        this.columna = columna;
        this.linea = linea;
        this.tipo = tipo;
        this.valor = valor;
        this.nombre = nombre;
        this.ts = true;
    }

    public String getToken() { return token; }

    public String getLexema() { return lexema; }
    
    public int getColumna() { return columna; }
    
    public int getLinea() { return linea; }
    
    public String getTipo() { return tipo; }
    
    public String getValor() { return valor; }
    
    public String getNombre() { return nombre; }
    
    public boolean getTs() { return ts;}

    @Override
    public String toString() {
        return "Token{" +
                "tokenTipo=" + token +
                ", lexema='" + lexema + '\'' +
                '}';
    }
}
