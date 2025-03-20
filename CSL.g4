grammar CSL;

prog: (expr NEWLINE)* ;
expr: expr ('*'|'/') expr
    | '(' expr ')'
    ;


NEWLINE : [\r\n]+ ;

DATE : DD MM YYYY ;
DD : [0-2][0-9]|[3][0-1] ;
MM : '/' [0][1-9]|[1][0-2] '/' ;
YYYY : [0-9][0-9][0-9][0-9] ;
TIME : ([0-1][0-9]|[2][0-3]) ':' [0-5][0-9] ;

DAYSOFWEEK : ('Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday') ;
SUBJECT  : '\'' [a-zA-Z] '\'' ;
DESCRIPTION : '"' [a-zA-Z] '"' ;
DURATION : [0-9]+(h|m|d|w|y) ;
IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]* ;
