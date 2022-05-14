public class Rect implements RectangleInterface {
	@TestVisible Decimal length, breadth;
    
    public Rect(){
        length = breadth = 0;
    }
    
    public Rect(Decimal length,Decimal breadth){
        this.length=length;
        this.breadth=breadth;
    }
    
    public decimal area(){
        Decimal result=  length * breadth;
        return result;
    }
    
    public decimal perimeter(){
        Decimal result=  2 * (length + breadth);
        return result;
    }
    
    public decimal area(Decimal len, Decimal brd){
        Decimal result=  length * breadth;
        return result;
    }
    
	public decimal perimeter(Decimal len, Decimal brd){
        Decimal result=  2 * (length + breadth);
        return result;
    }    	
}