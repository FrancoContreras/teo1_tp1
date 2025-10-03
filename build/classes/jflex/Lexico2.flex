package analizador;
import analizador.Token;
import java.util.*;




%%

%public
%class Lexico
%type Token
%line
%column

%{

    ArrayList<Token> tokens = new ArrayList<Token>();
    public ArrayList<Token> getTokens() { return tokens; }
    
    Set<Token> ts = new HashSet<Token>();
    
    public Set<Token> getTs() { return ts; }
/*
    public boolean validarStr(Token) {
        if (Token.getValor().length() <= 30) return true; 
        else return false;
    }

    public boolean validarInt(Token) {
        //32768
        if (Token.getValor() <= 32768) return true;
        else return false;
    }
*/
%}

/* alfabetos */

    ALFABETICO = [a-zA-Z]
    DIGITO = [0-9]
    ALFANUM = ({ALFABETICO}|{DIGITO})+
    ESPECIAL = [”#$°%&/\()¿?’{}[]:;_]
    ESPACIO = [ \t\r\n]
    ARITMETICO = [-+*/]
    LOGICO = [<>=!]

/* constantes */

    INT = {DIGITO}+
    FLT = {DIGITO}+("."){DIGITO}+
    STR = ("\"")({DIGITO}|{ALFABETICO}|{ESPECIAL}|{ARITMETICO}|{LOGICO}|{ESPACIO})*("\"")
    HEX = 0h({DIGITO}|A|B|C|D|E|F)+

/*  */

    ID = {ALFABETICO}({DIGITO}|{ALFABETICO})*   
    COMENTARIOS = ("$*")({ALFANUM}|{ESPACIO}|{ESPECIAL})*("*$")


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


    {STR}   {   
                Token token = new Token("CTE_STR", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());
                tokens.add(token);
                ts.add(token);

                return token;
            }
    {HEX}   {   
                Token token = new Token("CTE_HEX", yytext(), yycolumn, yyline);
                tokens.add(token);
                ts.add(token);

                return token;
            }
    {FLT}   {   
                Token token = new Token("CTE_FLT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());
                tokens.add(token);
                ts.add(token);
                
                return token;
            }
    {INT}   {   
                Token token = new Token("CTE_INT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());
                tokens.add(token);
                ts.add(token);
                
                return token;
            }
    {ID}    {   
                Token token = new Token("ID", yytext(), yycolumn, yyline, "-", "-", yytext());
                tokens.add(token);
                ts.add(token);
                
                return token;
            }
    
    {COMENTARIOS}   {/*Ignorar*/}
    {ESPACIO}+      {/*Ignorar*/}
}

[^]     {tokens.add(new Token("ERROR", yytext(), yycolumn, yyline));}

