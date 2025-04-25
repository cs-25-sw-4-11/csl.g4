grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER EQUAL expr SEMICOLON ;

EQUAL : '=' ;
SEMICOLON : ';' ;

expr
    : '(' expr ')'                          # ParenExpr
    | '[' expr ']'                          # HideExpr
    | expr THILDE expr                      # TildeOp
    | <assoc=right> COMPLEMENT expr         # ComplementOp
    | expr PLUSPLUS expr                    # DoublePlusOp
    | expr PLUS expr                        # AddOp
    | expr MINUS expr                       # SubtractOp
    | expr SBEFORE expr                     # StrictlyBeforeOp
    | expr SAFTER expr                      # StrictlyAfterOp
    | expr STAR expr                        # RecursiveOp
    | expr INTERSECTION expr                # IntersectOp
    | expr UNION expr                       # UnionOp
    | literal                               # LiteralExpr
    | IDENTIFIER                            # IdentifierExpr
    ;

THILDE: '~';
COMPLEMENT: '!' ;
PLUSPLUS: '++';
PLUS: '+';
MINUS: '-';
SBEFORE: '<<';
SAFTER: '>>';
STAR: '*';
INTERSECTION: '&&';
UNION: '||';

literal : SUBJECT | DESCRIPTION | DATE | datetime | clock | duration ;


SUBJECT  : '\'' ~[\\']+ '\'' ; // start and ends with ' and can contain every char except \ and '

DESCRIPTION : '"' ~[\\"]+ '"' ; // start and ends with " and can contain every char except \ and "

duration : INT TIMEUNITS ;
TIMEUNITS: 'min'
    | 'h'
    | 'w'
    | 'mth'
    | 'y'
    ;

datetime : DATE clock ;
clock : INT COLON INT ;
COLON : ':';
DATE : INT '/' INT '/' INT ;

INT : [0-9]+;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]* ;

LINE_COMMENT : '//' ~[\r\n]* -> skip ;
BLOCK_COMMENT : '/*' .*? '*/' -> skip ;
WS : [ \t\r\n]+ -> skip ;