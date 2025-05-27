grammar CSL;

prog: (stat | expr)* ;
stat: IDENTIFIER EQUAL expr SEMICOLON ;

EQUAL : '=' ;
SEMICOLON : ';' ;

expr
    : '(' expr ')'                          # ParenExpr
    | '[' expr ']'                          # HideExpr
    | expr TILDE expr                      # TildeOp
    | expr PLUS expr                        # AddOp
    | expr MINUS expr                       # SubtractOp
    | expr PLUSPLUS expr                    # DoublePlusOp
    | expr SBEFORE expr                     # StrictlyBeforeOp
    | expr SAFTER expr                      # StrictlyAfterOp
    | expr STAR expr                        # RecurrenceOp
    | expr SPLIT expr                       # SplitOp
    | expr SETDIFF expr                     # SetdiffOp
    | expr UNION expr                       # UnionOp
    | literal                               # LiteralExpr
    | IDENTIFIER                            # IdentifierExpr
    ;

TILDE: '~';
PLUSPLUS: '++';
PLUS: '+';
MINUS: '-';
SBEFORE: '<<';
SAFTER: '>>';
STAR: '*';
UNION: '||';
SETDIFF: '\\';
SPLIT : '/' ;

literal
    : subject
    | description
    | date
    | clock
    | duration
    ;

// start and ends with ' and can contain every char except \ and '
subject : SUBJECT ;
SUBJECT  : '\'' ~[\\']+ '\'' ;

description : DESCRIPTION ;
DESCRIPTION : '"' ~[\\"]+ '"' ; // start and ends with " and can contain every char except \ and "

duration : INT TIMEUNITS ;
TIMEUNITS: 'min'
    | 'h'
    | 'd'
    | 'w'
    | 'mth'
    | 'y'
    ;

clock : INT COLON INT ;
COLON : ':';

date : DATE ;
DATE : INT '/' INT '/' INT ;

INT : [0-9]+;

IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]* ;

LINE_COMMENT : '//' ~[\r\n]* -> skip ;
BLOCK_COMMENT : '/*' .*? '*/' -> skip ;
WS : [ \t\r\n]+ -> skip ;