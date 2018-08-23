(*This is the program to show the polymorphism of the function*)
(*Have a look at the type of the ML function map*)
fun map f [] = []
    | map f (x :: xs) = f x :: map f xs
(*map takes a function 'a -> 'b to function that takes 'a list to 'b lists*)

(*Internally sml infers the most general type by solving a set of constraints internally that
 arise by the definition.
 If it is not able to solve then it means that there is a type error
Some of the examples are*)
fun identity x = x
fun constant x y = x
fun compose f g x = f (g x)            (*doubt*)


(*Algebraic data types are as follows
They are well suited for writing the compiler*)
datatype color = Red | green | blue
datatype DaysOfWeek = Sunday | Monday | tuesday | thursday | friday | saturday | sunday 

(*Algebraic data types that are defined by a finite set of rules and cases which build the type from the 
simpler object. The rules or cases are distinguished by the constructors of that type.*)

(*In the case of color there are only three constructors
while in the case of DaysOfWeek there are 7 constructors*)
val skyColor = blue
val favouriteDay = Sunday

(*constructor of a type is also used to define the function from the type by what is known as patternMatching*)
fun isHoliday Sunday = true
    | isHoliday _    = false

(*Here _ is a match everything pattern often called wild card pattern*)
(*Defining the list data type on its own*)
datatype 'a mylist = nil
                 | cons of ('a * 'a mylist)

(*Defining the function by pattern matching*)

fun isEmpty nil = true
    | isEmpty _ = false


fun listlength nil = 0
    | listlength (cons(_ , y)) = 1 + listlength y

(*defining the list and using it*)
val list = cons (2 , cons (3 , nil))
val x = listlength list
val y = isEmpty list

(*Built in patterns for list like ([]), (p1 :: p2), and sequences of
   patterns like [p], [p1,p2], [p1,p2,p3] etc.  where pi's are
   themselves patterns*)

(*Defining our own option data type*)
datatype 'a Option = None 
                | Some of 'a 

(*defining the head and tale of the list*)
fun head [] = NONE
    | head (x :: _) = SOME x

fun tail [] =  NONE 
    | tail (_ :: xs) = SOME xs        (*'a list -> 'a list option*)

(*natural ways to define the function*)
fun head1 xs  = case xs of 
                [] => NONE
                | x :: xs => SOME x