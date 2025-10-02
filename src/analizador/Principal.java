package analizador;

import java.io.File;

public class Principal {
    public static void main(String[] args) {
        String ruta = "src/jflex/lexer.flex";
        generarLexico(ruta);
    }

    public static void generarLexico(String ruta) {
        File f = new File(ruta);
        System.out.println("Working dir = " + System.getProperty("user.dir"));
        System.out.println("Path absolute = " + f.getAbsolutePath());
        System.out.println("Existe? " + f.exists());
        jflex.Main.main(new String[]{ ruta });
    }
}