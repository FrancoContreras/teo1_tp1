package analizador;

import java.util.Objects;

public class Token {
    private String token = "-";
    private String lexema = "-";
    private int columna;
    private int linea;
    private String tipo = "-";
    private String valor = "-";
    private String nombre = "-";


    public Token(String token, String lexema, int columna, int linea) {
        this.token = token;
        this.lexema = lexema;
        this.columna = columna;
        this.linea = linea;
    }
    
    public Token(String token, String lexema, int columna, int linea, String tipo, String valor, String nombre) {
        this.token = token;
        this.lexema = lexema;
        this.columna = columna;
        this.linea = linea;
        this.tipo = tipo;
        this.valor = valor;
        this.nombre = nombre;
    }

    public String getToken() { return token; }

    public String getLexema() { return lexema; }
    
    public int getColumna() { return columna; }
    
    public int getLinea() { return linea; }
    
    public String getTipo() { return tipo; }
    
    public String getValor() { return valor; }
    
    public String getNombre() { return nombre; }
    
    
    public boolean equals(Object o) {
        if (this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;
        Token token = (Token)o;
        return Objects.equals(valor, token.valor) && Objects.equals(nombre, token.nombre);    
    }
    
    public int hashCode() {
        return Objects.hash(valor);
    }

}
