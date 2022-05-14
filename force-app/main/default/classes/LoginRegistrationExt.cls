public class LoginRegistrationExt {
    public String confirmpassword {get;set;}
    Registration__c reg;
    Public LoginRegistrationExt(ApexPages.StandardController controller){
        reg = new Registration__c();
        reg = (Registration__c)controller.getRecord();      
    }
    public Pagereference save() {
        Pagereference pr; //defaul value is null
        if(String.isBlank(reg.Password__c) || String.isBlank(confirmPassword)) {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter both Password and Confirm Password.');
            ApexPages.addMessage(msg);
        }
        else if(reg.Password__c  != confirmPassword) {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'Password and Confirm Password doesn\'t match. Please check.');
            ApexPages.addMessage(msg);
        }
        else {
            try {
                insert reg;
                 //pr = new Pagereference('/apex/LoginSuccess');
                pr = Page.LoginSuccess;  //It will check for the dependency while deleting LoginSuccess page but PageReference won't check the dependency
            }
            catch(Exception e) {
                ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
                ApexPages.addMessage(msg);
            }
           
        }
        return pr;
    }
    public Pagereference cancel() {
        Pagereference pr = Page.LoginRegistration;
        //To clear the form values
        //pr.setRedirect(true);
        return pr;
    }
}