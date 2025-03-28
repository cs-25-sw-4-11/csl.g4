grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER '=' expr ';' ;
expr: expr ('+'|'-'|'Union'|'Intersect'|'in'|'<<'|'>>'|'<'|'>'|'*'|'~') expr
    | 'Complement' expr
    | '(' expr ')'
    | literal
    | IDENTIFIER
    ;

literal : DAYSOFWEEK | SUBJECT | DESCRIPTION | DATE | DATETIME | CLOCK;
SUBJECT  : '\'' ~[\\']+ '\'' ;

DESCRIPTION : '"' ~[\\"]+ '"' ;

DURATION : [0-9]+('sec'|'min'|'h'|'d'|'w'|'mth'|'y') ;

DATETIME : DATE CLOCK ;
CLOCK : (('0' | '1' | )[0-9]|[2][0-3]) ':' [0-5][0-9] ;
DATE : DD MM YYYY ;
DD : [0-2][0-9]|[3][0-1] ;
MM : ('/' '0' [1-9] '/') | ('/' '1' [0-2] '/') ;
YYYY : [0-9][0-9][0-9][0-9] ;

DAYSOFWEEK : ('Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday') ;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]+ ;

WS : [ \t\r\n]+ -> skip ;