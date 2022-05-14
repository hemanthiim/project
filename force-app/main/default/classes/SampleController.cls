public class SampleController {
    
    @AuraEnabled //Save Account Data
    Public static void createAccount(Account objacc){
        try{
            //Insert Account Record
            insert objacc; 
            
        }catch(Exception e){
            //throw exception message
            throw new AuraHandledException(e.getMessage());
        }
        finally {
        }
    }
    
    @AuraEnabled //get Account Industry Picklist Values
    public static Map<String, String> getIndustry(){
        Map<String, String> options = new Map<String, String>();
        //get Account Industry Field Describe
        Schema.DescribeFieldResult fieldResult = Account.Industry.getDescribe();
        //get Account Industry Picklist Values
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            //Put Picklist Value & Label in Map
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
}