%option noyywrap nodefault yylineno

%x COMMENT

%{
  #include <stdio.h>

  #include "token.h"

  char* curfilename;
%}

%%


"//".*\n      /* C++ comment */

"/*"          { BEGIN(COMMENT); } /* comments */
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|.
<COMMENT><<EOF>> { printf("%s:%d: Unterminated comment\n", 
                    curfilename, yylineno); return 0; }

/* keywords */


%%