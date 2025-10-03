package analizador;
import analizador.Token;
import java.util.ArrayList;




%%

%public
%class Lexico
%type Token
%line
%column

%{
    ArrayList<Token> tokens = new ArrayList<Token>();
    public ArrayList<Token> getTokens() { return tokens; }

    public boolean validarStr(Token) {
        if (Token.getValor().length() <= 30) return true; 
        else return false;
    }

    public boolean validarInt(Token) {
        //32768
        if (Token.getValor() <= 32768) return true;
        else return false;
    }

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
    ":"     {tokens.add(new Token("OP_DCL", yytext(), yycolumn, yyline));}
    "="     {tokens.add(new Token("OP_ASIG", yytext(), yycolumn, yyline));}
    "+"     {tokens(new Token("OP_ADC", yytext(), yycolumn, yyline));}
    "-"     {tokens.add(return new Token("OP_SUS", yytext(), yycolumn, yyline));}
    "/"     {tokens(new Token("OP_DIV", yytext(), yycolumn, yyline));}
    "*"     {tokens(new Token("OP_PTO", yytext(), yycolumn, yyline);}

/* COMPARADORES */
    "=="    {tokens.add(new Token("CMP_IGUAL", yytext(), yycolumn, yyline));}
    "!="    {tokens.add(new Token("CMP_DTO", yytext(), yycolumn, yyline));}
    "<="    {tokens.add(new Token("CMP_MEI", yytext(), yycolumn, yyline));}
    ">="    {tokens.add(new Token("CMP_MAI", yytext(), yycolumn, yyline));}
    "||"    {tokens.add(new Token("CMP_DYN", yytext(), yycolumn, yyline));}
    "&&"    {tokens.add(new Token("CMP_CJN", yytext(), yycolumn, yyline));}
    "<"     {tokens.add(new Token("CMP_MENOR", yytext(), yycolumn, yyline));}
    ">"     {tokens.add(return new Token("CMP_MAYOR", yytext(), yycolumn, yyline)));}

/* PALABRAS RESERVADAS */
    "REPEAT"                {tokens.add(new Token("REPEAT", yytext(), yycolumn, yyline));}
    "IF"                    {tokens.add(new Token("IF", yytext(), yycolumn, yyline));}
    "THEN"                  {tokens.add(new Token("THEN", yytext(), yycolumn, yyline));}
    "ENDIF"                 {tokens.add(new Token("ENDIF", yytext(), yycolumn, yyline));}
    "ELSE"                  {tokens.add(new Token("ELSE", yytext(), yycolumn, yyline));}
    "SHOW"                  {tokens.add(new Token("SHOW", yytext(), yycolumn, yyline));}
    "DECVAR"                {tokens.add(new Token("INICIO_VAR", yytext(), yycolumn, yyline));}
    "ENDDECVAR"             {tokens.add(new Token("FIN_VAR", yytext(), yycolumn, yyline));}
    "FLOAT"                 {tokens.add(new Token("FLT_DCL", yytext(), yycolumn, yyline));}
    "INT"                   {tokens.add(new Token("INT_DCL", yytext(), yycolumn, yyline));}
    "STRING"                {tokens.add(new Token("STR", yytext(), yycolumn, yyline));}
    "PROGRAM.SECTION"       {tokens.add(new Token("INICIO_PROG", yytext(), yycolumn, yyline));}
    "ENDPROGRAM.SECTION"    {tokens.add(new Token("FIN_PROG", yytext(), yycolumn, yyline));}
    "ALLEQUAL"              {tokens.add(new Token("EQUAL", yytext(), yycolumn, yyline));}

/* VARIOS */
    "("     {tokens.add(new Token("INICIO_A", yytext(), yycolumn, yyline));}
    ")"     {tokens.add(new Token("FIN_A", yytext(), yycolumn, yyline));}
    "["     {tokens.add(new Token("INICIO_E", yytext(), yycolumn, yyline));}
    "]"     {tokens.add(new Token("FIN_E", yytext(), yycolumn, yyline));}
    ","     {tokens.add(new Token("SEP_A", yytext(), yycolumn, yyline));}


    {STR}   {tokens.add(new Token("CTE_STR", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext()));}
    {HEX}   {tokens.add(new Token("CTE_HEX", yytext(), yycolumn, yyline));}
    {FLT}   {tokens.add(new Token("CTE_FLT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext()));}
    {INT}   {tokens.add(new Token("CTE_INT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext()));}
    {ID}    {tokens.add(new Token("ID", yytext(), yycolumn, yyline, "-", "-", yytext()));}
    
    {COMENTARIOS}   {/*Ignorar*/}
    {ESPACIO}+      {/*Ignorar*/}
}

[^]     {tokens.add(new Token("ERROR", yytext(), yycolumn, yyline));}

