public class EsignRequestsController {
    
    @AuraEnabled
    public static List<eSign_Request__c> getEsignRequestRecords(){
        try{
            return [Select id, Envelope_name__c, Sent_to__c, Signing_Status__c, Sent_on__c from eSign_Request__c];
        }catch(exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    
    @AuraEnabled
    public static void updateEsignRecord(id recId){
        eSign_Request__c esr = new eSign_Request__c(id= recId, Signing_Status__c='Signed');
        update esr;
    }

}