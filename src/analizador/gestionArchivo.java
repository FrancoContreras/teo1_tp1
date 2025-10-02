
package analizador;
import java.io.*;

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
    
}
