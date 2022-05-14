global class BatchQueueable implements Queueable{
	/*private List<Branch__c> batches;
    
    global BatchQueueable(List<Branch__c> recs){
        this.batches = recs;
    }
    */
    public void execute(QueueableContext qc){
        
        Branch.test();
        
        /*
        List<Branch__c> updtBr = new List<Branch__c>();
        for(Branch__c br : batches){
            Branch__c b = new Branch__c();
            b.Id = br.Id;
            b.Number_of_Applicants__c = br.Applicants__r.size();
            updtBr.add(b);
        }
        update updtBr;
		*/
    }
}