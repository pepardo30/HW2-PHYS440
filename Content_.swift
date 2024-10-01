import SwiftUI
import Numerics
import ComplexModule

// This view allows the user to input coefficients for a quadratic equation.
struct ContentView: View {
    // Variables to store user input for the coefficients of the quadratic equation
    @State  var aString: String = ""
    @State  var bString: String = ""
    @State  var cString: String = ""
    
    // Body of the SwiftUI view that handles input fields and displays the result
    var body: some View {
    @State var solutionOneR: Double = 0.0
    @State var solutionOneIm: Double = 0.0
    @State var solutionTwoR: Double = 0.0
    @State var solutionTwoIm: Double = 0.0
    /// Solutions using the second method provided, will be used to compute error
    @State var solOnePrime = Complex<Double>(0.0,0.0)
    @State var solTwoPrime = Complex<Double>(0.0,0.0)
    
    @State var solutionOneRPrime: Double = 0.0
    @State var solutionOneImPrime: Double = 0.0
    @State var solutionTwoRPrime: Double = 0.0
    @State var solutionTwoImPrime: Double = 0.0
    
    @State var solutionOneRealAcurracy: Double = 0.0
    @State var solutionOneImaginaryAcurracy: Double = 0.0
    @State var solutionTwoRealAcurracy: Double = 0.0
    @State var solutionTwoImaginaryAcurracy: Double = 0.0

    
    var body: some View {
        VStack {
            Text("Quadratic Equation Calculator")
                .font(.largeTitle)
            HStack {
                Text("a:")
                TextField("Enter a value for a", text: $aString)
            }
            
            HStack {
                Text("b:")
                TextField("Enter a value for b", text: $bString)
            }
            HStack {
                Text("c:")
                TextField("Enter a value for c", text: $cString)
            }
            
            Button("Compute!", action: {self.calculate()})
            
            HStack {Text("x_1:")
                Text("\(self.solutionOneR, specifier: "%.2f") + \(self.solutionOneIm, specifier: "%.2f")i")
            }
            
            HStack {Text("x_1':")
                Text("\(self.solutionOneRPrime, specifier: "%.2f") + \(self.solutionOneImPrime, specifier: "%.2f")i")
            }
            
            HStack {Text("x_2:")
                Text("\(self.solutionTwoR, specifier: "%.2f") + \(self.solutionTwoIm, specifier: "%.2f")i")
            }
            
            HStack {Text("x_2':")
                Text("\(self.solutionTwoRPrime, specifier: "%.2f") + \(self.solutionTwoImPrime, specifier: "%.2f")i")
            }
            
        }
        
        VStack{
            
            HStack {Text("x_1 Real Error:")
                Text("\(self.solutionOneRealAcurracy, specifier: "%.30f")")
                
            }
            
            HStack {Text("x_1 Imaginary Error:")
                Text("\(self.solutionOneImaginaryAcurracy, specifier: "%.30f")")
                
            }
            
            HStack {Text("x_2 Real Error:")
                Text("\(self.solutionTwoRealAcurracy, specifier: "%.30f")")
                
            }
            
            HStack {Text("x_2 Imaginary Error:")
                Text("\(self.solutionTwoImaginaryAcurracy, specifier: "%.30f")")
                
            }
            
        }
        .padding()
    }
    
    func calculate(){
        ///This function defines an object of quadratic equaions, runs both methods to calculate all four solutions.
        ///Returns: void
        let quadraticeqtn = quadraticEquation()
        
        quadraticeqtn.a = Double(aString)!
        quadraticeqtn.b = Double(bString)!
        quadraticeqtn.c = Double(cString)!
        
        
        quadraticeqtn.calculateQuadraticSolutions()
        solutionOneR = quadraticeqtn.solOneR
        solutionOneIm = quadraticeqtn.solOneIm
        solutionTwoR = quadraticeqtn.solTwoR
        solutionTwoIm = quadraticeqtn.solTwoIm
        
        quadraticeqtn.calculateQuadraticSolutionsPrime()
        solutionOneRPrime = quadraticeqtn.solOnePrime.real
        solutionOneImPrime = quadraticeqtn.solOnePrime.imaginary
        solutionTwoRPrime = quadraticeqtn.solTwoPrime.real
        solutionTwoImPrime = quadraticeqtn.solTwoPrime.imaginary
        
        quadraticeqtn.calculateAcurracy()
        solutionOneRealAcurracy = quadraticeqtn.solOneRAccuracy
        solutionOneImaginaryAcurracy = quadraticeqtn.solOneImAccuracy
        solutionTwoRealAcurracy = quadraticeqtn.solTwoRAccuracy
        solutionTwoImaginaryAcurracy = quadraticeqtn.solTwoImAccuracy
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
