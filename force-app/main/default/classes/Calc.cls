public virtual class Calc {
	@TestVisible Decimal a, b, c;
    
    public virtual Decimal addition(Decimal a,Decimal b){
        this.a = a;
        this.b = b;
        return c = a+b;
    }
    
    public Decimal subtraction(Decimal a,Decimal b){
        this.a = a;
        this.b = b;
        return c = a-b;
    }
    
    public Decimal multiplication(Decimal a,Decimal b){
        this.a = a;
        this.b = b;
        return c = a*b;
    }
    
    public Decimal division(Decimal a,Decimal b){
        this.a = a;
        this.b = b;
        try{
            if(a<>0 && b==0) 
            {
                throw new CustomException('Divide by 0 exception. Please don'+'t enter '+'0'+' in the denominator');
            }
            	return c = a/b;
            
        }catch(CustomException ce){
            system.debug('The following error has occured :'+ce.getMessage());
            return null;
        }
        
    }
}