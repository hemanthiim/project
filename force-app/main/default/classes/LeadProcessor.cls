global class LeadProcessor implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select Id, LeadSource from Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> ld = new List<Lead>();
        for(Lead lead : records){
            lead.LeadSource = 'Dreamforce';
            ld.add(lead);
        }
        update ld;
    }

    global void finish(Database.BatchableContext bc){
        
    }
}