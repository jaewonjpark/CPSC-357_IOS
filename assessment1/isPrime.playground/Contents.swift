import UIKit

//Prime Number (can only be divided by itself or 1)
func isPrime(n: Int) -> Bool {
    // has to be greater than 1
    if n <= 1 {
        return false
    }
    //2 and 3 are always true
    if n <= 3 {
        return true
    }

    //This while loop starts from n: 4
    var num = 2
    while num*num <= n
    {
        if n % num == 0
        {
            return false
        }
        num += 1
    }
    return true
}

// In while loop
isPrime(n: 4) // num:2, n:4 --> 4%2==0 --> return false --> num:2
isPrime(n: 5) // num:2, n:5 --> 5%4!=0 --> num:3 --> go back to beginning of while loop --> 9<=5 is false --> Ends while loop --> return true
isPrime(n: 6)
isPrime(n: 7)
isPrime(n: 8)
isPrime(n: 9)
isPrime(n: 10)
isPrime(n: 13)


print("isPrime(n:2) = " + String(isPrime(n: 2))) // true
print("isPrime(n:3) = " + String(isPrime(n: 3))) // true
print("isPrime(n:10) = " + String(isPrime(n: 10))) // false
print("isPrime(n:13) = " + String(isPrime(n: 13))) // true
