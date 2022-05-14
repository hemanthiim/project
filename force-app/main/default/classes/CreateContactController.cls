public class CreateContactController{
    
    public Contact con{get;set;}
    Public CreateContactController(ApexPages.StandardController controller){
        con = new Contact();
    }
    
    public pagereference save(){
        system.debug('from save'+con.Email);
//         con = new Contact();
        List<Contact> cont = [select id, FirstName, LastName, MobilePhone, Email from Contact where Email =: con.Email Limit 1];
        if(cont.size() <> 0){
            con.FirstName = cont[0].FirstName;
            con.Lastname = cont[0].Lastname;
            con.MobilePhone = cont[0].MobilePhone;
            con.Email = cont[0].Email;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Warning,'Contact with the same Email is exists already.....'));
            return null;
        }
        
        else{
            Contact con = new Contact(FirstName = con.FirstName, LastName = con.LastName, MobilePhone = con.MobilePhone, Email = con.Email);
            try{
            insert con; 
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Contact has been created successfully.'));   
                PageReference pageRef = new PageReference('/'+con.Id);
                return pageRef;       
            }
            
            Catch(Exception e){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Contact creation failure.'+ e.getMessage()));            
                return null;
            }
            
            
        }
    }
    
}