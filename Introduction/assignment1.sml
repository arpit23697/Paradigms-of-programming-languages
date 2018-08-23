(*

Assignment 1. Due on 30th Aug Thursday by 12:00 noon.

Name: Arpit singh
Rollno: 111601031

*)
datatype binop = PLUS  | MINUS | MUL | DIV
datatype uniop = UPLUS | UMINUS

datatype expr  = C of real
	       | B of binop * expr * expr
	       | U of uniop * expr

(*defining the binopdenote*)
(*Note that all these are going to take the real values*)
fun binopDenote PLUS (x , y) = x+y
    | binopDenote MINUS (x , y) = x-y
    | binopDenote MUL (x , y) = x*y
    | binopDenote DIV (x ,y) = x/y

fun uniopDenote UPLUS x = x+1.0
    | uniopDenote UMINUS x = x-1.0

fun exprDenote (C (x)) = x
    | exprDenote (B (operation , x , y)) = binopDenote operation  (exprDenote x , exprDenote y )
    | exprDenote (U (operation , x)) = uniopDenote operation  (exprDenote x)

(*some of the operation for testing*)
val e1 = C( 2.0)
val e2 = B (MINUS , B (PLUS , C(2.0) , C(3.0) ) , C(5.0))
val e3 = B (MINUS , B (MUL , C(2.0) , C(3.0) ) , C(5.0))
val e4 = B (MINUS , B (DIV , C(2.0) , C(3.0) ) , C(5.0))
val e5 = B (PLUS , B (MUL , C(2.0) , C(3.0) ) , C(5.0))
val e6 = U ( UPLUS , B (MINUS , B (PLUS , C(2.0) , C(3.0) ) , C(5.0)))

val x1 = exprDenote e1
val x2 = exprDenote e2
val x3 = exprDenote e3
val x4 = exprDenote e4
val x5 = exprDenote e5
val x6 = exprDenote e6