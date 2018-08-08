(* defining some of the values and  see how the sml is going to respond to it *)
val aString = "Arpit "
val aChar = #"C"
val aBool = true
val anotherBool = false
val anInt = 2
val aReal = 2.0
val aList = [1 , 2, 3]
val aPair = ("Arpit" , 23)
val aTriple = (1, 2.4 , "Arpit")
val aUnit = () (*This is the empty product type **)

(*The compiler can infer the types easily 
This is one of the main advantage of the ML*)

(*This definition asserts that the definition is a constant of type real * real 
You cannot change the value of the constant
Note the type should match
*)
val origin : real * real = (0.0 , 0.0)
val origin : real * string = (0.0 , "0.0")

(*We can also give new names to the type 
This is known as the type aliasing
*)
type vector2D = real * real
val unitx : vector2D = (1.2 , 2.2)


(*This is going to show how to use the functions in sml*)
(*this is the factorial function*)

fun factorial n = if n <= 0 then 1 
                    else n * factorial (n-1)

(*The idea of currying
In ML we have function with only one argument*)

fun add (u, v) = u + v
fun addp u v = u + v

(*Both the function take only one argument
The first variant takes a parameter of the type int * int and then give int
The second variant takes a parameter int and returns a function that takes int and this finally gives the int

The variant add is the uncurried version
The variant addp is the curried version
The advantage of the curried version is that we can partially apply the curried version

*)

val increment = addp 1;

(*
In general a function that takes n parameters of types t1 , t2 , t3 . . .  tn and returns a type of type t
can be thought of the type t1 -> (t2 -> (t3 -> . . ))
This is called currying
This allows for the partial application
*)

(*The following convert from curried to uncurried and vice versa*)
fun curry f = fn x => fn y => f (x, y)  (*To convert to the curried form*)
val curry2 = fn f => fn x => fn y => f (x , y)     (*this is the other way*)



fun uncurry f = fn (x, y) => f x y     (*To convert to the uncurried form*)
val uncurry2 = fn f => fn (x , y ) => f x y
fun uncurry3 f (x , y) = f x y 


val addp1 = curry add   (*We are using the val instead of the function*)
val incr = addp 1
val add1 = uncurry addp

(*Concept of anonymous function fun x = (... x ... ) is the function that maps its argument to (... x ...)
With the help of the anonymous function we can rewrite the function definition*)

fun f a b c = a
fun f2 a b   = fn c => a
fun f3 a     = fn b => fn c => a
val f4       = fn a => fn b => fn c => a  
