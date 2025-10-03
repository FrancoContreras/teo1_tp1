package analizador;
import analizador.Token;
import analizador.tokenConstante;
import java.util;

%%

%public
%class Lexico
%type Token
%line
%column


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

/*
%eofval{
    return new Token(TokenConstant.EOF, null);
%eofval}
*/

%%

<YYINITIAL> {

/* OPERADORES */
    ":"     {return new Token("OP_DCL", yytext(), yycolumn, yyline);}
    "="     {return new Token("OP_ASIG", yytext(), yycolumn, yyline);}
    "+"     {return new Token("OP_ADC", yytext(), yycolumn, yyline);}
    "-"     {return new Token("OP_SUS", yytext(), yycolumn, yyline);}
    "/"     {return new Token("OP_DIV", yytext(), yycolumn, yyline);}
    "*"     {return new Token("OP_PTO", yytext(), yycolumn, yyline);}

/* COMPARADORES */
    "=="    {return new Token("CMP_IGUAL", yytext(), yycolumn, yyline);}
    "!="    {return new Token("CMP_DTO", yytext(), yycolumn, yyline);}
    "<="    {return new Token("CMP_MEI", yytext(), yycolumn, yyline);}
    ">="    {return new Token("CMP_MAI", yytext(), yycolumn, yyline);}
    "||"    {return new Token("CMP_DYN", yytext(), yycolumn, yyline);}
    "&&"    {return new Token("CMP_CJN", yytext(), yycolumn, yyline);}
    "<"     {return new Token("CMP_MENOR", yytext(), yycolumn, yyline);}
    ">"     {return new Token("CMP_MAYOR", yytext(), yycolumn, yyline);}

/* PALABRAS RESERVADAS */
    "REPEAT"                {return new Token("REPEAT", yytext(), yycolumn, yyline);}
    "IF"                    {return new Token("IF", yytext(), yycolumn, yyline);}
    "THEN"                  {return new Token("THEN", yytext(), yycolumn, yyline);}
    "ENDIF"                 {return new Token("ENDIF", yytext(), yycolumn, yyline);}
    "ELSE"                  {return new Token("ELSE", yytext(), yycolumn, yyline);}
    "SHOW"                  {return new Token("SHOW", yytext(), yycolumn, yyline);}
    "DECVAR"                {return new Token("INICIO_VAR", yytext(), yycolumn, yyline);}
    "ENDDECVAR"             {return new Token("FIN_VAR", yytext(), yycolumn, yyline);}
    "FLOAT"                 {return new Token("FLT_DCL", yytext(), yycolumn, yyline);}
    "INT"                   {return new Token("INT_DCL", yytext(), yycolumn, yyline);}
    "STRING"                {return new Token("STR", yytext(), yycolumn, yyline);}
    "PROGRAM.SECTION"       {return new Token("INICIO_PROG", yytext(), yycolumn, yyline);}
    "ENDPROGRAM.SECTION"    {return new Token("FIN_PROG", yytext(), yycolumn, yyline);}
    "ALLEQUAL"              {return new Token("EQUAL", yytext(), yycolumn, yyline);}

/* VARIOS */
    "("     {return new Token("INICIO_A", yytext(), yycolumn, yyline);}
    ")"     {return new Token("FIN_A", yytext(), yycolumn, yyline);}
    "["     {return new Token("INICIO_E", yytext(), yycolumn, yyline);}
    "]"     {return new Token("FIN_E", yytext(), yycolumn, yyline);}
    ","     {return new Token("SEP_A", yytext(), yycolumn, yyline);}


    {STR}   {return new Token("CTE_STR", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());}
    {HEX}   {return new Token("CTE_HEX", yytext(), yycolumn, yyline);}
    {FLT}   {return new Token("CTE_FLT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());}
    {INT}   {return new Token("CTE_INT", yytext(), yycolumn, yyline, "-", yytext(), "_" + yytext());}
    {ID}    {return new Token("ID", yytext(), yycolumn, yyline, "-", "-", yytext());}
    
    {COMENTARIOS}   {/*Ignorar*/}
    {ESPACIO}+      {/*Ignorar*/}
}
[^]     {return new Token("ERROR", yytext(), yycolumn, yyline);}

