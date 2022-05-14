@isTest
public class LeadProcessorTest {
   @TestSetup
    static void setUp() {
        List<Lead> ld = new List<Lead>();
        for(Integer i=0;i<10;i++){
            ld.add(new Lead(LastName = 'TestLead' + i, Company = 'Company' + i));
        }
        insert ld;
    }

    @IsTest
    static void methodName(){
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        system.assertEquals(10, [select count() from lead where LeadSource = 'Dreamforce']);
        
    }
}