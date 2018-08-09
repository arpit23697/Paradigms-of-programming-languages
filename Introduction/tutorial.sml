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

(*Functions in sml can be passed to other functions *)
(*This is one of the special properties of the sml*)
(*This is to show how to store the function in the list*)
val someIntFunctions = [addp 1 , addp 2 , addp 3]


(*ML lists and the functions*)
val fewPrimeNumbers = [3 , 5 , 7]

(*The x::xs denotes the list with the x as the first element and the xs as the rest of the list*)
val morePrimeNumbers = 2 :: fewPrimeNumbers     

(*
To access the elements of the list use the List.nth function 
It takes a tuple as the argument with the first element as the list and the second element as the index
The time complexity is O(n)
*)
val ListItem = List.nth (fewPrimeNumbers , 2)  (*Taking the element at index in 2 of the fewPrimeNumbers*)
val funItem = List.nth (someIntFunctions , 1)

(*Writing a function to apply to all the elements in the list*)
fun map f [] = []
   | map f (x :: xs) = f x :: map f xs

(*The way to use this function*)
val useLess = map incr fewPrimeNumbers
val useLess2 = map (addp 42 ) fewPrimeNumbers

(*Another functionn that is very important for processing list are folds
fold f a [b0 , b1 , b2 , b3 . . . ] = f (f a b0) b1 . . .
Think of op as an operator
fold op a [b0 , b1, b2 , b3  . . ] = ((a op b0) op b1) op b2
this corresponds to the  library function foldl
 
*)

fun fold _ x [] = x
   | fold f x (y :: ys) = fold f (f x y) ys

(*Let us write a function to sum up the list of the numbers*)
val sum = fold addp 0 

(*you can use this method to define the product of the elements of the list*)
fun subtract x y = x-y
fun mult x y = x*y
val product = fold mult 1

(*Ways to apply this function*)
val useLess3 = sum fewPrimeNumbers
val useLess4 = product fewPrimeNumbers

val useless5 = fold subtract 0 fewPrimeNumbers

(*there is more elegent way to define this sort of functions*)
val prod = let  fun mul x y = x * y
    in fold mul 1
    end
val useLess6 = prod fewPrimeNumbers

val sub = let fun subtract x y = x-y
    in fold subtract 0
    end

val useLess7 = sub fewPrimeNumbers