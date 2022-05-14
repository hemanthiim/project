@isTest
public class EsignRequestsControllerTest {

    @isTest
    public static void test(){
       eSign_Request__c esr = new eSign_Request__c();
        insert esr;
        
        EsignRequestsController.getEsignRequestRecords();
        EsignRequestsController.updateEsignRecord(esr.id);
    }
}