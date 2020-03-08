%option noyywrap

%{
  #include <stdio.h>

  typedef enum {
    TOKEN_EOF = 0,
    TOKEN_TRUE,
    TOKEN_FALSE,
    TOKEN_NULL,
    TOKEN_LBRACE,
    TOKEN_RBRACE,
    TOKEN_COMMA,
    TOKEN_COLON,
    TOKEN_LBRACKET,
    TOKEN_RBRACKET,
    TOKEN_STRING,
    TOKEN_NUMBER,
    TOKEN_ERROR
  } token_t;

  static char* NAMES[] = { 
    "<EOF>",
    "TOKEN_TRUE",
    "TOKEN_FALSE",
    "TOKEN_NULL",
    "TOKEN_LBRACE",
    "TOKEN_RBRACE",
    "TOKEN_COMMA",
    "TOKEN_COLON",
    "TOKEN_LBRACKET",
    "TOKEN_RBRACKET",
    "TOKEN_STRING",
    "TOKEN_NUMBER",
    "TOKEN_ERROR",
  };

  void yyerror(const char*, ...);
%}

%%

[ \r\t\n]+                             { /* ignore */ }
"{"                                    { return TOKEN_LBRACE; }
"}"                                    { return TOKEN_RBRACE; }
":"                                    { return TOKEN_COLON; }
","                                    { return TOKEN_COMMA; }
"["                                    { return TOKEN_LBRACKET; }
"]"                                    { return TOKEN_RBRACKET; }
"\""[^"]*"\""                          { return TOKEN_STRING; }
"true"                                 { return TOKEN_TRUE; }
"false"                                { return TOKEN_FALSE; }
"null"                                 { return TOKEN_NULL; }
[-+]?[0-9]+\.?[0-9]*((e|E)[-+]?[0-9]+)? { return TOKEN_NUMBER; }
.                                      { fprintf(stderr, "error: unknown character '%s'\n", yytext); }

%%

int main(int argc, char** argv) {
  if(argc < 2) {
    fprintf(stderr, "need filename\n");
    return 1;
  }

  yyin = fopen(argv[1], "r");
  if(!yyin) {
    fprintf(stderr, "unable to open file: %s\n", argv[1]);
    return 1;
  }

  token_t t;
  while((t = yylex()) != TOKEN_EOF) {
    printf("token: %s text: %s\n", NAMES[t], yytext);
  }

  return 0;
}
