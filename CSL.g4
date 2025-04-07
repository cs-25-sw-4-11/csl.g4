grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER '=' expr ';' ;

expr
    : '(' expr ')'                           # ParenExpr
    | '[' expr ']'                          # HideExpr
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
    | expr MUL expr                          # RecursiveOp
    | expr INTERSECTION expr                  # IntersectOp
    | expr UNION expr                      # UnionOp
    | LITERAL                                # LiteralExpr
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



SUBJECT  : '\'' ~[\\']+ '\'' ; // start and ends with ' and can contain every char except \ and '

DESCRIPTION : '"' ~[\\"]+ '"' ; // start and ends with " and can contain every char except \ and "

DURATION : INT TIMEUNITS ;
TIMEUNITS: 'sec'
    | 'min'
    | 'h'
    | 'w'
    | 'mth'
    | 'y'
    ;

DATETIME : DATE CLOCK ;
CLOCK : HOUR ':' MINUTES ;
HOUR : INT ;
MINUTES : INT ;
DATE : DD '/' MM '/' YYYY ;
DD : INT ;
MM : INT ;
YYYY : INT ;

INT : [0-9]+;

DAYSOFWEEK : ('Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday') ;

LITERAL : DAYSOFWEEK | SUBJECT | DESCRIPTION | DATE | DATETIME | CLOCK | DURATION ;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]+ ;

WS : [ \t\r\n]+ -> skip ;