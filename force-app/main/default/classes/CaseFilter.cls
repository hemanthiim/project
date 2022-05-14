public class CaseFilter {

    public static List<Id> filterCases(Id accId){
        Map<id,Account> accCases = new Map<id,Account>([Select id,Owner.Email,(Select id,ContactEmail from Cases) from Account where Id =: accId]);
        String accEmail = [Select Owner.Email from Account where id =: accId].Owner.Email;
        System.debug('accCases+++'+accCases);
        List<Id> csIDList = new List<Id>();
        for(Case cs: accCases.get(accId).Cases) {
            if(accEmail == cs.ContactEmail){
                csIDList.add(cs.Id);
            }
        }
        
        return csIDList;
    }
}