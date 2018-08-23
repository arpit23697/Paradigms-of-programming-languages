(*datatype for the binary tree*)
datatype 'x tree = empty_tree
                | node of 'x tree * 'x * 'x tree

(*Fun for the singleton*)
fun singleton x = node (empty_tree , x , empty_tree)    

(*Fun for inorder traversal*)
fun inorderTraveresal empty_tree = []
    | inorderTraveresal (node(a , x , b )) = inorderTraveresal a @ x  :: inorderTraveresal b
    

