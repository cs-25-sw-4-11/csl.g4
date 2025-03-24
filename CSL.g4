grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER '=' expr ';' | IDENTIFIER '=' stat ';' ;
expr: expr ('+'|'-'|'Union'|'Intersect'|'in'|'<<'|'>>'|'<'|'>') expr
    | 'Complent' expr
    | '(' expr ')'
    | li
    | stat
    | IDENTIFIER
    ;



li : DAYSOFWEEK | SUBJECT | DESCRIPTION | DATE | TIME;
DATE : DD MM YYYY ;
DD : [0-2][0-9]|[3][0-1] ;
MM : ('/' '0' [1-9] '/') | ('/' '1' [0-2] '/') ;
YYYY : [0-9][0-9][0-9][0-9] ;
TIME : (CLOCK | '?') '-' (CLOCK | '?') ;
CLOCK : ([0-1][0-9]|[2][0-3]) ':' [0-5][0-9] ;
DAYSOFWEEK : ('Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday') ;
SUBJECT  : '\'' ~[\\']+ '\'' ;
DESCRIPTION : '"' ~[\\"]+ '"' ;
DURATION : [0-9]+('h'|'m'|'d'|'w'|'y') ;
IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]+ ;

WS : [ \t\r\n]+ -> skip ;