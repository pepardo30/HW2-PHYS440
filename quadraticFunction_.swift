import SwiftUI
import Numerics
import ComplexModule

class quadraticEquation: NSObject {
    ///This class is defined with three core variables, a, b and c to compute all four solutions of a quadratic equation
    var a: Double = 0.0
    var b: Double = 0.0
    var c: Double = 0.0
    
    var solOne: Double = 0.0
    var solOneR: Double = 0.0
    var solOneIm: Double = 0.0
    var solTwoR: Double = 0.0
    var solTwoIm: Double = 0.0
    
    var solOnePrime = Complex<Double>(0.0,0.0)
    var solTwoPrime = Complex<Double>(0.0,0.0)
    
    var solOneRAccuracy: Double = 0.0
    var solOneImAccuracy: Double = 0.0
    var solTwoRAccuracy: Double = 0.0
    var solTwoImAccuracy: Double = 0.0
    
    func calculateAcurracy(){
        solOneRAccuracy = self.solOneR - self.solOnePrime.real
        solOneImAccuracy = self.solOneIm - self.solOnePrime.imaginary
        solTwoRAccuracy = self.solTwoR - self.solTwoPrime.real
        solTwoImAccuracy = self.solTwoIm - self.solTwoPrime.imaginary
    }
    
    
    func calculateDeterminant()->Double{
        ///This function takes in the values of a, b and c and returns the determinant with formula:
        ///b^2-4ac
        ///as a Double
        return Double(pow(b,2)) - 4.0*a*c
    }
    
    func calculateQuadraticSolutions(){
        /// This function calculates the two solutions from the conventionalquadratic equation and returns four variables for the real and imaginary parts of each solution. see below for the formula:
        /// x1 = (-b+sqrt(b^2-4ac))/2a
        ///x2 = (-b-sqrt(b^2-4ac))/2a
        
        var det = self.calculateDeterminant()
        switch det {
        case let x where x < 0:
            det = det*(-1.0)
            let sqrt = det.squareRoot()
            solOneR = (-1.0)*b/(2.0)*a
            solTwoR = solOneR
            solOneIm = (1.0/(2.0*a))*sqrt
            solTwoIm = (-1.0)*solOneIm
        case let x where x == 0:
            solOneR = (-1.0)*b/(2.0)*a
            solTwoR = solOneR
        case let x where x > 0:
            let sqrt = det.squareRoot()
            solOneR = ((-1.0)*b + sqrt)/(2*a)
            solTwoR = ((-1.0)*b - sqrt)/(2*a)
        default:
            print("this is impossible")
        }
    }
    
    func calculateQuadraticSolutionsPrime(){
        /// This function defines a determinant and calculates two solutions to the quadratic equation using the second method shown in the book with formula:
        /// x1 = -2c/(b+sqrt(b^2/4ac))
        ///x2 = -2c/(b-sqrt(b^2/4ac))
        ///Returns a complex double solOnePrime and solTwoPrime
        
        var det = self.calculateDeterminant()
        switch det {
        case let x where x < 0:
            det = det*(-1.0)
            var sqrt = det.squareRoot()
            var denominatorSolOne = Complex<Double>(b, sqrt)
            var denominatorSolTwo = Complex<Double>(b, -1.0*sqrt)
            
            solOnePrime = Complex<Double>(((-2.0)*c), 0.0)/denominatorSolOne
            solTwoPrime = Complex<Double>(((-2.0)*c), 0.0)/denominatorSolTwo
            print(solOnePrime)
            print(solTwoPrime)

        case let x where x == 0:
            solOnePrime = Complex<Double>(((-2.0)*c)/b, 0.0)
            solTwoPrime = Complex<Double>(((-2.0)*c)/b, 0.0)

            
        case let x where x > 0:
            let sqrt = det.squareRoot()
            solOnePrime = Complex<Double>(((-2.0)*c)/(b+sqrt),0.0)
            solTwoPrime = Complex<Double>(((-2.0)*c)/(b-sqrt),0.0)
 
        default:
            print("this is impossible")
        }
    }
    
    
    
    
    
    

}
