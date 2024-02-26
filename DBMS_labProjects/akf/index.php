<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>learning php</title>
</head>
<body>
    <div class="container">
        this is my first php website
        <?php

            define ('pi' , 3.14);
            echo "hello world i'm printing using php";
            echo "i live in delhi";
            $a = 10;
            echo $a;

            $b = 4;
            echo $b;
            echo "<br>";

            echo "<br>";

            echo "learning about comparison operators....";
            echo "<br>";
            echo var_dump(1==3);

            $mystatus = true and true;
            echo var_dump($mystatus);
            
            echo pi;
            


        ?>

        <?php
            echo $a + $b;
        ?>



    </div>
    
</body>
</html> 


<!--  php -> dynamically typed, use dollar for variable -->
<!-- echo "<br>" karke  newline add hogi -->
<!-- var_dump fn ki help se kisi variable ka data type pta lag jata hai... -->