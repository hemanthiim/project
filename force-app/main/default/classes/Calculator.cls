//Non-virtual and non-abstract type cannot be extended: Calc
//Non-virtual, non-abstract methods cannot be overridden: Decimal Calculator.addition(Decimal, Decimal)
//Method must use the override keyword: Decimal Calculator.addition(Decimal, Decimal)
public class Calculator extends Calc{
	@TestVisible Decimal a, b, c;
    static Decimal D=0;
    public override Decimal addition(Decimal a,Decimal b){
        this.a = a;
        this.b = b;
        return c = a+b;
    }
    public Decimal increment(){
        return D++;
    }
}