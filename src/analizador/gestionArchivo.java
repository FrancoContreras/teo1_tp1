
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
    
public void crearTablaSimbolos(Set<Token> HashSetDetokens){
        try {
            FileWriter archivo = new FileWriter("TablaSimbolos.txt");
            archivo.write("NOMBRE\tTOKEN\tTIPO\tVALOR\tLONGITUD\n");
            for (Token token : HashSetDetokens) {
                if(token.getTs() == true){
                    archivo.write("  " + token.getNombre() + "\t" + token.getToken() + "\t"
                            + token.getValor() + "\t" + token.getValor().length());
                    archivo.write("\n");
                }
            }
            archivo.close();

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    
}
