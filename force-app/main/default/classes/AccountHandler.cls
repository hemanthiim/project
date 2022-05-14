public class AccountHandler {
    
    public static Account insertNewAccount(String accname){
        try {
           Account acc = new Account(name=accname);
           insert acc;
           return acc;
        } catch (DmlException e) {
    		System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
		}
        
    }

}