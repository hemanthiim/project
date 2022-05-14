public class BranchBatch implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts {
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Number_of_Applicants__c, (Select id from Applicants__r) from Branch__c');
    }
    
    public void execute(Database.BatchableContext bc, List<Branch__c> scope){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json;charset=UTF-8');
        req.setBody('{"name":"mighty moose"}');
        HttpResponse res = http.send(req);
        if(res.getStatusCode() != 201){
            System.debug('An unexpected result was returned ' + res.getStatusCode() +' '+ res.getStatus());
        }
        else{
            System.debug('Result'+res.getBody());
        }
        
        List<Branch__c> updtBr = new List<Branch__c>();
        for(Branch__c br : scope){
            Branch__c b = new Branch__c();
            b.Id = br.Id;
            b.Number_of_Applicants__c = br.Applicants__r.size();
            updtBr.add(b);
            recordsProcessed = recordsProcessed + 1;
        }
        update updtBr;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed.');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        //EmailUtils.sendMessage(job, recordsProcessed);
    }
}