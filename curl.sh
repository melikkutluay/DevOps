echo "helm charts finished"
calc_factorial() { 
    read -p "Enter a Queue message: " val 
    if [ -z "$val"  ] 
        then 
        echo val is empty
    else 
        echo $val
        curl --location --request POST "http://localhost:8081/produce?message=$val"
        echo "The factorial of $val is: $factorial" 
        factorial=$(calc_factorial $val)
    fi 
} 

factorial=$(calc_factorial)