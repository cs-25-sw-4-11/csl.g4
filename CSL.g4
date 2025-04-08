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
    | expr STAR expr                          # RecursiveOp
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
STAR: '*';
INTERSECTION: 'Intersect';
UNION: 'Union';

literal : DAYSOFWEEK | SUBJECT | DESCRIPTION | DATE | datetime | clock | duration ;


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

datetime : DATE clock ;
clock : HOUR ':' MINUTES ;
HOUR : INT ;
MINUTES : INT ;
DATE : INT '/' INT '/' INT ;


DAYSOFWEEK : 'Monday'|'Tuesday'|'Wednesday'|'Thursday'|'Friday'|'Saturday'|'Sunday' ;




INT : [0-9]+;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]+ ;

WS : [ \t\r\n]+ -> skip ;