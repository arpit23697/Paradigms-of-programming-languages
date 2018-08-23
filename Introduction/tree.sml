(*This is to define the tree data type and then writing the inorder traversal and rotation*)
datatype 'a tree = emptyTree
                | node of 'a tree * 'a * 'a tree
            
val tree1 = emptyTree
val tree2 = node (emptyTree , 2 , emptyTree)
val tree3 = node (node (emptyTree , 1 , emptyTree) , 2 , node (emptyTree , 3 , emptyTree))
val tree5 = node (node (node (emptyTree , 4 , emptyTree) , 2 , emptyTree) , 1 , node (emptyTree , 3 , emptyTree))
(*this is the function to create the singular function*)
fun singular x = node (emptyTree , x , emptyTree)
val tree4 = singular 3

(*this is the function for the inorder traversal*)
fun inorderTraversal emptyTree = []
    | inorderTraversal (node (x , y , z)) = inorderTraversal x @ y :: inorderTraversal z

val order1 = inorderTraversal tree1
val order2 = inorderTraversal tree2
val order3 = inorderTraversal tree3   
val order4 = inorderTraversal tree5

(*function for the rotation*)
fun rotation (node (node (A , b, B) , a , C)) = node (A , b , node (B , a , C))
    | rotation x = x

val r1 = rotation tree1
val r2 = rotation tree2
val r3 = rotation tree3
val r5 = rotation tree5