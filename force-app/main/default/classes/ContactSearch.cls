public class ContactSearch {
    public static List<Contact> searchForContacts(string lastname,string postalcode){
        List<Contact> conList = new List<Contact>([select ID,Name from Contact where LastName =: lastname and MailingPostalCode =: postalcode]);
        return conList;
    }
}