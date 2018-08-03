(*This is the way to define function 
 Although this is going to give error as it is not exhaustive*)
fun head (x::xs) = x

(*function to check if the list is empty or not*)
fun isempty (x::xs) = false
    | isempty _     = true

(*function to find the length of the list*)
fun length(x :: xs) = 1 + length(xs)
    | length _      = 0

(*Way to declare the variable*)
val len = length [1 , 2  , 3];  

(*there is one other way to define the function using white space*)
fun leng (_ :: xs) = leng(xs) + 1
    | leng (_)     = 0

(*this to sum the list*)
fun sumList (x :: xs) = x + sumList xs
    | sumList _       = 0

(*demo function*)
fun twice x = 2*x

(*function that takes function as the parameter*)
fun map f (x :: xs) = f (x) :: map f xs
    | map f (xs)    = xs

val temp = map twice [1 ,2 , 3] 

(*Function have more precedence as compared to the expression*)
(*ML don't have multi argument function*)

(*returns the first element of a two tuple*)
fun firstElement (x , y) = x

(*Returns the second element of a two tuple*)
fun secondElement (x , y) = y

(*shorthand for getting the first element of a tuple*)
(* to get the nth element of the following tuple *)
val x = (1,2,3,4,"hello" , false , 4.56);
#1 x;
#5 x;

val increment = fn x => x+1;
(* this is the curried form for multiple arguments*)
(* these are the anonymous functions *)
(* this is the curried form *)
fun plus1 x y = x+y;
fun plus2 x = fn y => x+y;
val plus3 = fn x => fn y => x+y; 

val temp = fn x => fn y => x+y;
val temp2 = fn (x , y) => x+y;