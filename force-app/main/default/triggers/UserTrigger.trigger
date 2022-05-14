trigger UserTrigger on User (after insert, after update) {
	Map<string,string> rdmap = new Map<string,string>();
    List<Role_Division_Mapping__c> rdlist= new List<Role_Division_Mapping__c> (
        [ select Name,Division__c from Role_Division_Mapping__c ]
    );
    for(Role_Division_Mapping__c rd : rdlist){
        rdmap.put(rd.Name,rd.Division__c);
    }
    
    
    for(User us : trigger.new){
        
    }
}