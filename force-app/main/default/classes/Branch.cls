public with sharing class Branch {
    @future(callout=true)
    public static void updateBranch(set<Id> recs){
        //Sample Callout
        Http http = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        System.debug('HTTP response'+res);
        if(res.getStatusCode() == 200){
            Map<String,object> results = (Map<String,object>) JSON.deserializeUntyped(res.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following output');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
   
        List<Branch__c> updtBr = new List<Branch__c>();
        for(Branch__c br : [Select Number_of_Applicants__c, (Select id from Applicants__r) from Branch__c where Id IN :recs]){
            Branch__c b = new Branch__c();
            b.Id = br.Id;
            b.Number_of_Applicants__c = br.Applicants__r.size();
            updtBr.add(b);
        }
        update updtBr;
    }
    
    @future(callout=true)
    public static void test(){
         //Sample Callout
        Http http = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        System.debug('HTTP response'+res);
        if(res.getStatusCode() == 200){
            Map<String,object> results = (Map<String,object>) JSON.deserializeUntyped(res.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following output');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
    }
}