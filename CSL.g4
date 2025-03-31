grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER '=' expr ';' ;
//TODO: RANK THEM
expr
    : '(' expr ')'                           # ParenExpr
    | expr '~' expr                          # TildeOp
    | <assoc=right> 'Complement' expr        # ComplementOp
    | expr '++' expr                         # DoublePlusOp
    | expr '+' expr                          # AddOp
    | expr '-' expr                          # SubtractOp
    | expr 'in' expr                         # InOp
    | expr '<<' expr                         # StrictlyBeforeOp
    | expr '>>' expr                         # StrictlyAfterOp
    | expr '<' expr                          # BeforeOp
    | expr '>' expr                          # AfterOp
    | expr '*' expr                          # MultiplyOp
    | expr 'Intersect' expr                  # IntersectOp
    | expr 'Union' expr                      # UnionOp
    | literal                                # LiteralExpr
    | IDENTIFIER                             # IdentifierExpr
    ;


literal : DAYSOFWEEK | SUBJECT | DESCRIPTION | date | datetime | clock | duration;

SUBJECT  : '\'' ~[\\']+ '\'' ; // start and ends with ' and can contain every char except \ and '

DESCRIPTION : '"' ~[\\"]+ '"' ; // start and ends with " and can contain every char except \ and "

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

daysofweek : ('Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday') ;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]+ ;

WS : [ \t\r\n]+ -> skip ;
