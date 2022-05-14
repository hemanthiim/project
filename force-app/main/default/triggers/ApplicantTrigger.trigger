trigger ApplicantTrigger on Applicant__c (after insert, before update, after update, after delete, after undelete) {
    Set<Id> brIds = new Set<Id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
       for(Applicant__c ap : trigger.new){
        	brIds.add(ap.Branch__c);
    	} 
    }
    if(trigger.isDelete || trigger.isBefore){
       for(Applicant__c ap : trigger.old){
        	brIds.add(ap.Branch__c);
    	} 
    }
   	
    /*
    List<Branch__c> updtBr = new List<Branch__c>();
    for(Branch__c br : [Select Number_of_Applicants__c, (Select id from Applicants__r) from Branch__c where Id IN :brIds]){
        Branch__c b = new Branch__c();
        b.Id = br.Id;
        b.Number_of_Applicants__c = br.Applicants__r.size();
        updtBr.add(b);
    }
    update updtBr;
	*/
    
   	//Branch.updateBranch(brIds);
   	
    
    BranchBatch bt = new BranchBatch();
    Database.executeBatch(bt);
    
    
    /*
    BatchQueueable bq = new BatchQueueable(trigger.new);
    ID jobId = System.enqueueJob(bq);
    System.debug('Job Id'+ jobId);
	*/
}