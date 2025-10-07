package analizador;
import analizador.Token;
import java.util.*;
import gui.Interfaz;



%%

%public
%class Lexico
%type Object // no devuelve dato primitivo
%line
%column

%{

    ArrayList<Token> tokens = new ArrayList<Token>();
    public ArrayList<Token> getTokens() { return tokens; }
    
    Set<Token> ts = new HashSet<Token>();
    public Set<Token> getTs() { return ts; }

    public boolean validarStr(String valor) {
        if (valor.length() <= 30) return true; 
        else return false;
    }

    public boolean validarInt(int valor) {
        //32768
        if (valor <= 32768) return true;
        else return false;
    }

    public boolean validarFlt(float valor) {
        if (valor < Float.MAX_VALUE) return true;
        else return false;
    }

%}

/* ALFABETOS */

    ALFABETICO = [a-zA-Z]
    DIGITO = [0-9]
    ALFANUM = ({ALFABETICO}|{DIGITO})+   
    ESPECIAL = [”#$°%&/\()¿?’{}[]:;_]
    ESPACIO = [ \t\r\n]
    ARITMETICO = [-+*/]
    LOGICO = [<>=!]

/* CONSTANTES */

    INT = {DIGITO}+
    FLT = {DIGITO}*("."){DIGITO}*
    STR = ("\"")({DIGITO}|{ALFABETICO}|{ESPECIAL}|{ARITMETICO}|{LOGICO}|{ESPACIO})*("\"")
    HEX = 0h({DIGITO}|A|B|C|D|E|F)+

/*  */

    ID = {ALFABETICO}({DIGITO}|{ALFABETICO})*   
    COMENTARIOS = ("$*")({DIGITO}|{ALFABETICO}|{ESPECIAL}|{ARITMETICO}|{LOGICO}|{ESPACIO})*("*$")


%%

<YYINITIAL> {

    

/* OPERADORES */
    ":"     {
                Token token = new Token("OP_DCL", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    "="     {
                Token token = new Token("OP_ASIG", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    "+"     {
                Token token = new Token("OP_ADC", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    "-"     {
                Token token = new Token("OP_SUS", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    "/"     {
                Token token = new Token("OP_DIV", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    "*"     {
                Token token = new Token("OP_PTO", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }

/* COMPARADORES */
    "=="    {
                Token token = new Token("CMP_IGUAL", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    "!="    {
                Token token = new Token("CMP_DTO", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    "<="    {
                Token token = new Token("CMP_MEI", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    ">="    {
                Token token = new Token("CMP_MAI", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    "||"    {
                Token token = new Token("CMP_DYN", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    "&&"    {
                Token token = new Token("CMP_CJN", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    "<"     {
                Token token = new Token("CMP_MENOR", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    ">"     {
                Token token = new Token("CMP_MAYOR", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }

/* PALABRAS RESERVADAS */
    "REPEAT"                {
                                Token token = new Token("REPEAT", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "IF"                    {
                                Token token = new Token("IF", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "THEN"                  {
                                Token token = new Token("THEN", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "ENDIF"                 {
                                Token token = new Token("ENDIF", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "ELSE"                  {
                                Token token = new Token("ELSE", yytext(), yycolumn, yyline);
                                tokens.add(token);
                                return token;
                            }
    "SHOW"                  {
                                Token token = new Token("SHOW", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "DECVAR"                {
                                Token token = new Token("INICIO_VAR", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "ENDDECVAR"             {
                                Token token = new Token("FIN_VAR", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "FLOAT"                 {
                                Token token = new Token("FLT_DCL", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "INT"                   {
                                Token token = new Token("INT_DCL", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "STRING"                {
                                Token token = new Token("STR", yytext(), yycolumn, yyline);
                                tokens.add(token);
                                return token;
                            }
    "PROGRAM.SECTION"       {
                                Token token = new Token("INICIO_PROG", yytext(), yycolumn, yyline); 
                                tokens.add(token);
                                return token;
                            }
    "ENDPROGRAM.SECTION"    {
                                Token token = new Token("FIN_PROG", yytext(), yycolumn, yyline);
                                tokens.add(token);
                                return token;
                            }
    "ALLEQUAL"              {
                                Token token = new Token("EQUAL", yytext(), yycolumn, yyline);
                                tokens.add(token);
                                return token;
                            }

/* VARIOS */
    "("     {
                Token token = new Token("INICIO_A", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    ")"     {
                Token token = new Token("FIN_A", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token; 
            }
    "["     {
                Token token = new Token("INICIO_E", yytext(), yycolumn, yyline);
                tokens.add(token);
                return token;
            }
    "]"     {
                Token token = new Token("FIN_E", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }
    ","     {
                Token token = new Token("SEP_A", yytext(), yycolumn, yyline); 
                tokens.add(token);
                return token;
            }


/* CONSTANTES */
    {STR}   {   
                String valor = yytext().substring(1, yytext().length()-1);
                if (!validarStr(valor)) {
                    String error = "ERROR : CTE_STR Fuera de rango\n";
                    return error;
                }
                else {
                    Token token = new Token("CTE_STR", yytext(), yycolumn, yyline, "-", valor, "_" + valor);
                    tokens.add(token);
                    ts.add(token);

                    return token;
                }
                
            }
    {HEX}   {   
                try {
                    int valorInt = Integer.parseInt(yytext().substring(2), 16);
                    String valorStr = String.valueOf(valorInt);

                    Token token = new Token("CTE_HEX", yytext(), yycolumn, yyline, "-", valorStr, yytext());
                    tokens.add(token);
                    ts.add(token);

                    return token;
                    
                } catch (NumberFormatException nfe) {
                    String error = "ERROR : CTE_HEX Fuera de rango\n";
                    return error;
                }
            }
    {FLT}   {   
                try { // REVISAR
                    float valor = Float.parseFloat(yytext());
                    if (!validarFlt(valor)) {
                        String error = "ERROR : CTE_FLT Fuera de rango\n";
                        return error;   
                    }
                    else {
                        Token token = new Token("CTE_FLT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());
                        tokens.add(token);
                        ts.add(token);
                        return token;
                    }
                } catch (NumberFormatException nfe) {
                    String error = "ERROR : CTE_FLT Fuera de rango\n";
                    return error;
                }
            }
    {INT}   {   
                try {
                    int valor = Integer.parseInt(yytext());
                    if (!validarInt(valor)) {
                        String error = "ERROR : CTE_INT Fuera de rango\n";
                        return error;
                    }
                    else {
                        Token token = new Token("CTE_INT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());
                        tokens.add(token);
                        ts.add(token);

                        return token;
                    }
                } catch(NumberFormatException nfe) {
                    String error = "ERROR : CTE_INT Fuera de rango\n";
                    return error;    
                }
            }
    {ID}    {   
                Token token = new Token("ID", yytext(), yycolumn, yyline, "-", "-", yytext());
                tokens.add(token);
                ts.add(token);
                
                return token;
            }
    
    {ESPACIO}+      {/*Ignorar*/}
    {COMENTARIOS}   {/*Ignorar*/}
}

[^]     { return new Token("ERROR", yytext(), yycolumn, yyline); }

