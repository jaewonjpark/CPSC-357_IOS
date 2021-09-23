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

    var num = 2
    while num*num <= n {
        if n % num == 0 {
            return false
        }
        num += 1
    }
    return true
}

isPrime(n: 2) //true
isPrime(n: 3) //true
isPrime(n: 10) //false
isPrime(n: 13) //true

print("isPrime(n:2) = " + String(isPrime(n: 2))) // true
print("isPrime(n:3) = " + String(isPrime(n: 3))) // true
print("isPrime(n:10) = " + String(isPrime(n: 10))) // false
print("isPrime(n:13) = " + String(isPrime(n: 13))) // true
