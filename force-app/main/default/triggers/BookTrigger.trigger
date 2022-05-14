trigger BookTrigger on Book__c (before insert) {
    for(Book__c b : Trigger.New) {
        if(b.SoldOut__c= true){
            b.addError('Book Already Soldout');
        }
        else{
            continue;
        }
    }   
}