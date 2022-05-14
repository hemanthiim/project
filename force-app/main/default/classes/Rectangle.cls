/* 
    1. Default access modifier for the class/method/variable is private
    2. Top-level class type must have public or global visibility
*/
public class Rectangle implements RectangleInterface {
    //variables (class)
    @TestVisible Decimal length = 0, breadth = 0; //default value for the variable is null
    Decimal result;
    
    //Construtors
    //Default Constructor
    public Rectangle() {
        length = breadth = 0;
    }
    //Parameterized Constructor (inputs, parameters, arguments)
    public Rectangle(Decimal length, Decimal breadth /*Local Variables*/) {
        this.length = length;
        this.breadth = breadth;
    }
    //Contructor Overloading: Same constructor name but with different parameters.
    
    //methods
    public void voidArea() {
        //If you don't want to return after the method is called then use void.
        result = length * breadth;
    }
    
    public Decimal area() {
        //Missing return statement required return type: Decimal
        return length * breadth;
    }
    
    public Decimal area(Decimal len, Decimal brd) {
        return len * brd;
    }
    //Method Overloading: Same method name with different parameters.
    
    public Decimal perimeter() {
        return 2 * (length + breadth);
    }
    
    public Decimal perimeter(Decimal length, Decimal breadth) {
        return 2 * (length + breadth);
    }
    
    public void showResult() {
        system.debug('Length: '+length);
        system.debug('Breadth: '+breadth);
        system.debug('area: '+area());
        system.debug('area with params: '+area(10,20));
        system.debug('perimeter: '+perimeter());
    }
    //Operator Overloading: same operator with different behavior.
}