#ifndef bmin_token_h
#define bmin_token_h

typedef enum {
  TOKEN_EOF = 0,

  TOKEN_IDENT,
  TOKEN_INT_LIT,
  TOKEN_CHAR_LIT,
  TOKEN_STRING_LIT,

  // punctuation
  TOKEN_LBRACE,
  TOKEN_RBRACE,
  TOKEN_LBRACKET,
  TOKEN_RBRACKET,
  TOKEN_COMMA,
  TOKEN_SEMICOLON,
  TOKEN_LPAREN,
  TOKEN_RPAREN,

  // keywords
  TOKEN_ARRAY,
  TOKEN_BOOLEAN,
  TOKEN_CHAR,
  TOKEN_ELSE,
  TOKEN_FALSE,
  TOKEN_FOR,
  TOKEN_FUNCTION,
  TOKEN_IF,
  TOKEN_INTEGER,
  TOKEN_PRINT,
  TOKEN_RETURN,
  TOKEN_STRING,
  TOKEN_TRUE,
  TOKEN_VOID,
  TOKEN_WHILE,

  // operators
  TOKEN_EQUAL,

  TOKEN_ERROR
} TokenType;

#endif