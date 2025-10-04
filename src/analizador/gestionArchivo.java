
package analizador;
import java.io.*;
import java.util.*;

public class gestionArchivo {
    FileInputStream entrada;
    FileOutputStream salida;
    File archivo;
    
    public String abrirArchivo(File archivo) {
        String contenido = "";
        try {
            entrada = new FileInputStream(archivo);
            int ascii;
            while ((ascii = entrada.read()) != -1) {
                char caracter = (char)ascii;
                contenido += caracter;
            }
        } catch (Exception e) {}
        return contenido;
    }
    
    public void guardarArchivo(File archivo, String contenido) {
        try {
            salida = new FileOutputStream(archivo);
            byte[] bytesTxt = contenido.getBytes();
            salida.write(bytesTxt);
        } catch (Exception e) {}
    }
    
    /*
    public void crearTablaSimbolos(Set<Token> HashSetDetokens){
            try {
                FileWriter archivo = new FileWriter("TablaSimbolos.txt");
                archivo.write("NOMBRE\tTOKEN\tTIPO\tVALOR\tLONGITUD\n");
                for (Token token : HashSetDetokens) {
                    if(token.getToken().equals("CTE_STR")){
                        archivo.write(token.getNombre() + "\t" + token.getToken() + "\t"
                                + token.getValor() + "\t" + token.getValor().length());
                    }
                    else{
                        archivo.write(token.getNombre() + "\t" + token.getToken() + "\t"
                                + token.getValor() + "\t");
                    }
                    archivo.write("\n");
                }
                archivo.close();

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
    }
    */
    
    public void crearTablaSimbolos(Set<Token> HashSetDetokens){
        try {
            FileWriter archivo = new FileWriter("ts.txt");
            archivo.write(String.format("%-32s %-15s %-15s %-32s %-15s\n", "NOMBRE", "TOKEN", "TIPO", "VALOR", "LONGITUD"));
            for (Token token : HashSetDetokens) {
                if(token.getToken().equals("CTE_STR")){
                    archivo.write(String.format("%-32s %-15s %-15s %-32s %-15s", token.getNombre(), token.getToken(), token.getTipo(), token.getValor(), token.getValor().length()));
                }
                else if (token.getToken().equals("CTE_HEX") || token.getToken().equals("CTE_INT") || token.getToken().equals("CTE_FLT")){
                    archivo.write(String.format("%-32s %-15s %-15s %-32s %-15s", token.getNombre(), token.getToken(), token.getTipo(), token.getValor(), "-"));
                }
                else {
                    archivo.write(String.format("%-32s %-15s %-15s %-32s %-15s", token.getNombre(), token.getToken(), token.getTipo(), "-", "-"));
                }
                archivo.write("\n");
            }
            archivo.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    
}
