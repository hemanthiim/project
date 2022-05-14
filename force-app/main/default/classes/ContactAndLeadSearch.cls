public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchword){
        
        List<List<SObject>> searchList = [FIND :searchword IN ALL FIELDS 
                                      RETURNING Lead(FirstName,LastName), Contact(FirstName,LastName)];
        return searchList;
    }

}