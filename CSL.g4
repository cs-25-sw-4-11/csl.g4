grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER '=' expr ';' ;
//TODO: RANK THEM
expr
    : '(' expr ')'                           # ParenExpr
    | expr THILDE expr                          # TildeOp
    | <assoc=right> COMPLEMENT expr        # ComplementOp
    | expr PLUSPLUS expr                         # DoublePlusOp
    | expr PLUS expr                          # AddOp
    | expr MINUS expr                          # SubtractOp
    | expr IN expr                         # InOp
    | expr SBEFORE expr                         # StrictlyBeforeOp
    | expr SAFTER expr                         # StrictlyAfterOp
    | expr BEFORE expr                          # BeforeOp
    | expr AFTER expr                          # AfterOp
    | expr MUL expr                          # MultiplyOp
    | expr INTERSECTION expr                  # IntersectOp
    | expr UNION expr                      # UnionOp
    | literal                                # LiteralExpr
    | IDENTIFIER                             # IdentifierExpr
    ;

THILDE: '~';
COMPLEMENT: 'Complement' ;
PLUSPLUS: '++';
PLUS: '+';
MINUS: '-';
IN: 'in';
SBEFORE: '<<';
SAFTER: '>>';
BEFORE: '<';
AFTER: '>';
MUL: '*';
INTERSECTION: 'Intersect';
UNION: 'Union';

literal : daysofweek | subject | description | date | datetime | clock | duration ;

subject  : '\'' ~[\\']+ '\'' ; // start and ends with ' and can contain every char except \ and '

description : '"' ~[\\"]+ '"' ; // start and ends with " and can contain every char except \ and "

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