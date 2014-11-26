%{

int line_num = 1;	//counter for current line
int col_num = 0;	//counter for current column
%}

%%
									/*WhiteSpaces*/
[ \t]+								{col_num += strlen(yytext); printf("");}

									/*Comments*/
"/*"(.|\n)*"*/"						{printf("{COMMENT,\"%s\"}\n", yytext);}
"//".*								{printf("{COMMENT,\"%s\"}\n", yytext);}

									/*Statement Terminator*/
\n									{line_num++; col_num = 0; printf("");}

									/*Constant values*/
[Tt][Rr][Uu][Ee]					{printf("{BOOLEAN,\"%s\"}\n", yytext);}
[Ff][Aa][Ll][Ss][Ee]				{printf("{BOOLEAN,\"%s\"}\n", yytext);}
'[^"\"""\']'						{printf("{CHARACTER,\"%s\"}\n", yytext);}
'\\[ntra\\"\"""\'"]'				{printf("{CHARACTER,\"%s\"}\n", yytext);}
"\""([^"\""]|"\\\"")*"\""			{printf("{STRING,\"%s\"}\n", yytext);}
-?[0-9]+							{printf("{INTEGERNUM,\"%s\"}\n", yytext);}
-?[0-9]+("."[0-9]+)?				{printf("{FLOATNUM,\"%s\"}\n", yytext);}
[Nn][Uu][Ll][Ll]					{printf("{NULL,\"%s\"}\n", yytext);}

									/*Data types*/
[Bb][Oo][Oo][Ll][Ea][Aa][Nn]		{printf("{BOOLEAN, \"%s\"}\n", yytext);}
[Cc][Hh][Aa][Rr]					{printf("{CHAR, \"%s\"}\n", yytext);}
[Ii][Nn][Tt]						{printf("{INT, \"%s\"}\n", yytext);}
[Ff][Ll][Oo][Aa][Tt]				{printf("{FLOAT, \"%s\"}\n", yytext);}
[Dd][Oo][Uu][Bb][Ll][Ee]			{printf("{DOUBLE, \"%s\"}\n", yytext);}
[Rr][Ee][Cc][Oo][Rr][Dd]			{printf("{RECORD, \"%s\"}\n", yytext);}
[Cc][Ll][Aa][Ss][Ss]				{printf("{CLASS, \"%s\"}\n", yytext);}
[Ee][Nn][Uu][Mm]					{printf("{ENUM, \"%s\"}\n", yytext);}

									/*Operators*/
"+"		{printf("{ADD, \"%s\"}\n", yytext);}
"-"		{printf("{SUB, \"%s\"}\n", yytext);}
"*"		{printf("{MUL, \"%s\"}\n", yytext);}
"/"		{printf("{DIV, \"%s\"}\n", yytext);}
"%"		{printf("{MOD, \"%s\"}\n", yytext);}

">"		{printf("{GREATERTHAN, \"%s\"}\n", yytext);}
"<"		{printf("{LESSTHAN, \"%s\"}\n", yytext);}
">="	{printf("{GREATEREQUAL, \"%s\"}\n", yytext);}
"<="	{printf("{LESSEQUAL, \"%s\"}\n", yytext);}

"=="	{printf("{EQUALTO, \"%s\"}\n", yytext);}
"!="	{printf("{NOTEQUAL, \"%s\"}\n", yytext);}

[Aa][Nn][Dd]	{printf("{AND, \"%s\"}\n", yytext);}
[Oo][Rr]		{printf("{OR, \"%s\"}\n", yytext);}
[Nn][Oo][Tt]	{printf("{NOT, \"%s\"}\n", yytext);}

"@"		{printf("{ATSIGN, \"%s\"}\n", yytext);}
"#"		{printf("{NUMBERSIGN, \"%s\"}\n", yytext);}

"="		{printf("{ASSIGNMENT, \"%s\"}\n", yytext);}
"+="	{printf("{ADDASS, \"%s\"}\n", yytext);}
"-="	{printf("{SUBASS, \"%s\"}\n", yytext);}
"*="	{printf("{MULASS, \"%s\"}\n", yytext);}
"/="	{printf("{DIVASS, \"%s\"}\n", yytext);}
"%="	{printf("{MODASS, \"%s\"}\n", yytext);}

"["		{printf("{LEFTBRACKET, \"%s\"}\n", yytext);}
"]"		{printf("{RIGHTBRACKET, \"%s\"}\n", yytext);}
"{"		{printf("{LEFTBRACE, \"%s\"}\n", yytext);}
"}"		{printf("{RIGHTBRACE, \"%s\"}\n", yytext);}
"("		{printf("{LEFTPAREN, \"%s\"}\n", yytext);}
")"		{printf("{RIGHTPAREN, \"%s\"}\n", yytext);}

","		{printf("{COMMA, \"%s\"}\n", yytext);}
"."		{printf("{DOT, \"%s\"}\n", yytext);}
":"		{printf("{COLON, \"%s\"}\n", yytext);}
"->"	{printf("{ARROW, \"%s\"}\n", yytext);}


									/*Keywords*/
[Ee][Nn][Dd]						{printf("{END, \"%s\"}\n", yytext);}
[Vv][Oo][Ii][Dd]					{printf("{VOID, \"%s\"}\n", yytext);}
[Nn][Ee][Ww]						{printf("{NEW, \"%s\"}\n", yytext);}
[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn]	{printf("{FUNCTION, \"%s\"}\n", yytext);}
[Aa][Ss]							{printf("{AS, \"%s\"}\n", yytext);}
[Pp][Uu][Bb][Ll][Ii][Cc]			{printf("{PUBLIC, \"%s\"}\n", yytext);}
[Pp][Rr][Ii][Vv][Aa][Tt][Ee]		{printf("{PRIVATE, \"%s\"}\n", yytext);}
[Ii][Ff]							{printf("{IF, \"%s\"}\n", yytext);}
[Tt][Hh][Ee][Nn]					{printf("{THEN, \"%s\"}\n", yytext);}
[Ee][Ll][Ss][Ee]					{printf("{ELSE, \"%s\"}\n", yytext);}
[Ee][Ll][Ss][Ee][Ii][Ff]			{printf("{ELSEIF, \"%s\"}\n", yytext);}
[Ss][Ww][Ii][Tt][Cc][Hh]			{printf("{SWITCH, \"%s\"}\n", yytext);}
[Cc][Aa][Ss][Ee]					{printf("{CASE, \"%s\"}\n", yytext);}
[Dd][Ee][Ff][Aa][Uu][Ll][Tt]		{printf("{DEFAULT, \"%s\"}\n", yytext);}
[Bb][Rr][Ee][Aa][Kk]				{printf("{BREAK, \"%s\"}\n", yytext);}
[Cc][Oo][Nn][Tt][Ii][Nn][Uu][Ee]	{printf("{CONTINUE, \"%s\"}\n", yytext);}
[Dd][Oo]							{printf("{DO, \"%s\"}\n", yytext);}
[Ww][Hh][Ii][Ll][Ee]				{printf("{WHILE, \"%s\"}\n", yytext);}
[Ff][Oo][Rr]						{printf("{FOR, \"%s\"}\n", yytext);}
[Tt][Oo]							{printf("{TO, \"%s\"}\n", yytext);}
[Nn][Ee][Xx][Tt]					{printf("{NEXT, \"%s\"}\n", yytext);}
[Tt][Hh][Ii][Ss]					{printf("{THIS, \"%s\"}\n", yytext);}
[Rr][Ee][Tt][Uu][Rr][Nn]			{printf("{RETURN, \"%s\"}\n", yytext);}
[Pp][Aa][Rr][Ee][Nn][Tt]			{printf("{PARENT, \"%s\"}\n", yytext);}
[Ee][Xx][Tt][Ee][Nn][Dd][Ss]		{printf("{EXTENDS, \"%s\"}\n", yytext);}
[Cc][Oo][Nn][Ss][Tt]				{printf("{CONST, \"%s\"}\n", yytext);}
[Ll][Ii][Nn][Kk]					{printf("{LINK, \"%s\"}\n", yytext);}
[Dd][Ee][Ff][Ii][Nn][Ee]			{printf("{DEFINE, \"%s\"}\n", yytext);}
[Aa][Ll][Ii][Aa][Ss]				{printf("{ALIAS, \"%s\"}\n", yytext);}

									/*NEW ENTRIES*/
"++"								{printf("{UNARYINCREMENT, \"%s\"}\n", yytext);}
"--"								{printf("{UNARYDECREMENT, \"%s\"}\n", yytext);}
"_"									{printf("{UNDERSCORE, \"%s\"}\n", yytext);}
"~"									{printf("{TILDE, \"%s\"}\n", yytext);}
[Ss][Ii][Zz][Ee][Oo][Ff]								{printf("{SIZEOF, \"%s\"}\n", yytext);}
[Tt][Rr][Yy] 											{printf("{TRY, \"%s\"}\n", yytext);}
[Cc][Aa][Tt][Cc][Hh]									{printf("{CATCH, \"%s\"}\n", yytext);}
[Tt][Hh][Rr][Oo][Ww]									{printf("{THROW, \"%s\"}\n", yytext);}
[Ee][Nn][Dd][Ii][Ff]									{printf("{ENDIF, \"%s\"}\n", yytext);}
[Ss][Tt][Aa][Tt][Ii][Cc]								{printf("{STATIC, \"%s\"}\n", yytext);}

[A-Za-z][A-Za-z0-9_]{0,30}				{printf("{IDENTIFIER, \"%s\"}\n", yytext);}

%%

int main(argc, argv)
int argc;
char **argv;
{
	if(argc > 1) {
		if(!(yyin = fopen(argv[1], "r"))) {
			perror(argv[1]);
			return (1);
		}
	}
	yylex();
	printf("Lines: %d\n", line_num);
}