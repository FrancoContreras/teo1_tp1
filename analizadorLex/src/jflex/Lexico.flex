package analizador;
import analizador.Token;
import analizador.tokenConstante;


%%

%public
%class Lexico
%type Token

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
    ":"     {return new Token("OP_DCL", yytext());}
    "="     {return new Token("OP_ASIG", yytext());}
    "+"     {return new Token("OP_ADC", yytext());}
    "-"     {return new Token("OP_SUS", yytext());}
    "/"     {return new Token("OP_DIV", yytext());}
    "*"     {return new Token("OP_PTO", yytext());}

/* COMPARADORES */
    "=="    {return new Token("CMP_IGUAL", yytext());}
    "!="    {return new Token("CMP_DTO", yytext());}
    "<="    {return new Token("CMP_MEI", yytext());}
    ">="    {return new Token("CMP_MAI", yytext());}
    "||"    {return new Token("CMP_DYN", yytext());}
    "&&"    {return new Token("CMP_CJN", yytext());}
    "<"     {return new Token("CMP_MENOR", yytext());}
    ">"     {return new Token("CMP_MAYOR", yytext());}

/* PALABRAS RESERVADAS */
    "REPEAT"                {return new Token("REPEAT", yytext());}
    "IF"                    {return new Token("IF", yytext());}
    "THEN"                  {return new Token("THEN", yytext());}
    "ENDIF"                 {return new Token("ENDIF", yytext());}
    "ELSE"                  {return new Token("ELSE", yytext());}
    "SHOW"                  {return new Token("SHOW", yytext());}
    "DECVAR"                {return new Token("INICIO_VAR", yytext());}
    "ENDDECVAR"             {return new Token("FIN_VAR", yytext());}
    "FLOAT"                 {return new Token("FLT", yytext());}
    "INT"                   {return new Token("INT", yytext());}
    "STRING"                {return new Token("STR", yytext());}
    "PROGRAM.SECTION"       {return new Token("INICIO_PROG", yytext());}
    "ENDPROGRAM.SECTION"    {return new Token("FIN_PROG", yytext());}
    "ALLEQUAL"              {return new Token("EQUAL", yytext());}

/* VARIOS */
    "("     {return new Token("INICIO_A", yytext());}
    ")"     {return new Token("FIN_A", yytext());}
    "["     {return new Token("INICIO_E", yytext());}
    "]"     {return new Token("FIN_E", yytext());}
    ","     {return new Token("SEP_A", yytext());}


    {STR}   {return new Token("CTE_STR", yytext());}
    {HEX}   {return new Token("CTE_HEX", yytext());}
    {FLT}   {return new Token("CTE_FLT", yytext());}
    {INT}   {return new Token("CTE_INT", yytext());}
    {ID}    {return new Token("ID", yytext());}
    
    {COMENTARIOS}   {/*Ignorar*/}
    {ESPACIO}+      {/*Ignorar*/}
}
[^]     {return new Token("ERROR", yytext());}

