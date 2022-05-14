trigger AccountRelatedContact on Account (after insert) {

list<account> acclist = new list<account>();
for(account acc:trigger.new){

acclist .add(acc);
}

accountrelatedContact.createContact(acclist);


}