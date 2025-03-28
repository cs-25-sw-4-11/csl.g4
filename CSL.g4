grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER '=' expr ';' ;
//TODO: RANK THEM
expr: expr ('+'|'-'|'Union'|'Intersect'|'in'|'<<'|'>>'|'<'|'>'|'*'|'~' | '++') expr
    | 'Complement' expr
    | '(' expr ')'
    | literal
    | IDENTIFIER
    ;

literal : DAYSOFWEEK | SUBJECT | DESCRIPTION | date | datetime | clock | duration;
//SPLIT INTO STRING
SUBJECT  : '\'' ~[\\']+ '\'' ;
//SPLIT INTO STRING
DESCRIPTION : '"' ~[\\"]+ '"' ;

duration : INT TIMEUNITS ;
TIMEUNITS: 'sec'
    | 'min'
    | 'h'
    | 'w'
    | 'mth'
    | 'y'
    ;

datetime : date clock ;
clock : hour ':' minutes ;
hour : INT ;
minutes : INT ;
date : dd '/' mm '/' yyyy ;
dd : INT ;
mm : INT ;
yyyy : INT ;

INT : [0-9]+;

DAYSOFWEEK : ('Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday') ;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]+ ;

WS : [ \t\r\n]+ -> skip ;