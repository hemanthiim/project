public class EmployeeErrorMessageController{
    public Employee__c emp{get;set;}
    
    public EmployeeErrorMessageController(ApexPages.StandardController controller) {
         emp = new Employee__c();
    }
    
    public void validate(){ 
        //system.debug('emp.Phone'+ emp.Phone__c);
        //system.debug('emp.Phone length'+ String.valueOf(emp.Phone__c).length() );
        string phoneString = string.valueOf(emp.Phone__c);
        if(phoneString == '' || phoneString == null || phoneString.length() != 10){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Input value must be a number and must be exactly of length 10.....'));
		}
	}
}