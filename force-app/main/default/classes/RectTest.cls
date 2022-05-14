@isTest
public class RectTest {    
    @isTest static void RectangleTest(){
        Rect R1 = new Rect();
        Decimal result1 = R1.area();
        system.assertEquals(0, result1);
        
        Rect R2 = new Rect(5,10);
       	Decimal result2 = R2.area();
        system.assertEquals(50, result2);
    }    
}