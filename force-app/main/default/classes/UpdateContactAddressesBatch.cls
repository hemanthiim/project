global class UpdateContactAddressesBatch implements Database.Batchable<sObject>, Database.stateful{
    
    global Integer recordsProcessed = 0;
    global database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode FROM Contacts) FROM Account'
            );

    }

    global void execute(Database.BatchableContext bc, List<Account> acc){
        List<Contact> contacts = new List<Contact>();
        for(Account account : acc){
            for(Contact contact : account.contacts){
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;

                contacts.add(contact);
                recordsProcessed = recordsProcessed + 1;
            }
        }
        update contacts;
    }

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Hemanth!');
    }
}