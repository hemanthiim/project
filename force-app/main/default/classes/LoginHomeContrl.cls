public class LoginHomeContrl {
	public String username {get;set;}
    public String password {get;set;}
    public LoginHomeContrl(){
        
    }
    
    public PageReference validateLogin(){
        PageReference pr;
        if(String.isBlank(username) || String.isBlank(password)){
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please enter both username and password.'));
        }
        else{
            List<Registration__c> reglst = [select Email__c, password__c from Registration__c where Email__c=: username];
            if(reglst == null || reglst.size() == 0){
                Apexpages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Username doesn\'t exists.'));                
            }
            else if(reglst[0].password__c != password){
                Apexpages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Invalid Password.'));                
            }
            else{
                pr = page.Welcome;
            }
        }
        return pr;
    }
}