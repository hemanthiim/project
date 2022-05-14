public class ListUsage {
  /*
    1. variables or the methods we can make as static.
    2. By default all the variables/methods are non static.
    3. Transaction: starting of the programig execution to ending of the programing execution.
    4. static variables/methods should be called with class name.
  */
  public static Integer count = 0;
    public static void listUse() {
      count++;
      
      /*
        1. List is ordered. It allows duplicates.
        2. Max. Number of values in the list: no limit as soon as it is not reaching the heap size 
        limit of 6 MB for synchronous and 12 MB for asynchronous.
        3. Syntax: List<DataType> lstName = new List<DataType>();
      */
      /*List<String> namesLst = new List<String>();
      namesLst.add('Venki');
      namesLst.add('Vina');
      namesLst.add('Venki');*/
      List<String> namesLst = new List<String>{'Venki','Vina','Venki'};
      namesLst.sort(); //Default sorting order is: ascending
      system.debug('namesLst: '+namesLst+' with size: '+namesLst.size());
      namesLst.set(2,'Teja'); //namesLst[2] = 'Teja';
      system.debug('namesLst: '+namesLst+' with size: '+namesLst.size());
      system.debug('namesLst 1st index value: '+namesLst.get(1)/*namesLst[1]*/);
      
      List<String> namesLst2 = new List<String>();
      namesLst2.addAll(namesLst); 
      system.debug('namesLst2: '+namesLst2+' with size: '+namesLst2.size());     
      namesLst2.remove(0);
      system.debug('namesLst2 after removal: '+namesLst2+' with size: '+namesLst2.size());
      namesLst2.clear();
      system.debug('namesLst2 after removal: '+namesLst2+' with size: '+namesLst2.isEmpty());
      
      List<String> namesLst3 = namesLst.clone();
      system.debug('namesLst3: '+namesLst3+' with size: '+namesLst3.size());
      system.debug('namesLst2 contains venki? '+namesLst3.contains('Venki'));
      
      //Array
      Integer[] numArray = new Integer[3];
      numArray[0] = 100;
      numArray[1] = 20;
      numArray[2] = 300;
      numArray.add(300); //If you use add method array will become elastic.
      system.debug('numArray: '+numArray+' with size: '+numArray.size());
      
      /*
        - SOQL: Salesforce Object Query Language
        - Purpose: To query from an object and the related objects.
        Governer Limits:
        - Max. SOQL query limit: 100. If it reaches the limit it will throw exception 
        'Too many SOQL queries: 101'
        - Max. number of records per SOQL query: 50k. If it reaches the limit it will throw exception 
        'Too many SOQL query rows: 50001'
        Note: We cannot handle governer limit exceptions
        
        List<Contact> conLst = [SELECT Name, AccountId FROM Contact];
        SELECT Name, AccountId FROM Contact order by Name desc
        SELECT Name, AccountId FROM Contact Limit 10
        SELECT Name, AccountId FROM Contact order by Name desc limit 10 offset 10
        Note: Max offset limit: 2000
        SELECT Salutation, Name, FirstName, LastName, AccountId FROM Contact where Salutation = 'Ms.' 
        and (FirstName like 'A%')  order by Name desc
        Integer conCount = [SELECT count() FROM Contact];
        List<AggregateResult> aggrResult = [SELECT count(id), AccountId FROM Contact group by AccountId having AccountId != null];
        SELECT Name, AccountId FROM Contact where CreatedDate = today
        Relationship Queries -
          Standard Object -
            1. Query on Child and get the parent object records.
              SELECT Name,AccountId, Account.Name, Account.Industry FROM Contact
            2. Query on Parent and get the child object records.
              SELECT Name, (select id, Name, Email from Contacts) FROM Account 
          Custom Object -
            1. Query on Child and get the parent object records.
              SELECT Id, Name, Status__c, Applicant__c, Applicant__r.Name,Applicant__r.Gender__c, Course__c, Course__r.Name FROM Course_Application__c
            2. Query on Parent and get the child object records.      
              SELECT Id, Name, (select id, Name from Course_Applications__r) FROM Applicant__c
          
      */
      /*
        - SOSL: Salesforce Object Search Language
        - Purpose: To search for a value from multiple objects which might or might not be related.
        Governer Limits:
        - Max. SOSL query limit: 20. If it reaches the limit it will throw exception 
        'Too many SOSL queries: 21'
        - Max. number of records per SOSL query: 2k. If it reaches the limit it will throw exception 
        'Too many SOSL query rows: 2001'
        List<List<Sobject>> soslLst = [FIND {test} IN ALL FIELDS RETURNING Account, 
        Contact(Id, MailingCity, MailingStreet, MailingState, MailingCountry), Applicant__c, Course__c];
      */
      /*
        - DML: Data Manipulation Language
        - Purpose: To make changes to the data in the database.
          1. insert singleRecord/ListRecords;
          2. update
          3. delete
          4. undelete
          5. upsert --> insert/update
          6. merge --> update/delete --> only works on Leads, Account and Contacts
        Governer Limits:
        - Max. DML Stmts limit: 150. If it reaches the limit it will throw exception 
        'Too many DML Stmts: 151'
        - Max. number of records per DML stmt: 10k. If it reaches the limit it will throw exception 
        'Too many DML stmts: 2001'
      */
      /*** Working with primitive data types ***/
      /*List<Applicant__c> applntLst = [select Id from Applicant__c where Name = 'Applicant-003'];
      if(applntLst != null && applntLst.size() > 0) {
        //insert Course
        Course__c course = new Course__c(
          Name__c = 'TCourse'+system.now(), Faculty__c = 'Business'
        );
        insert course;
        
        List<Course_Application__c> courseApplLst = new List<Course_Application__c>();
        //insert new record
        Course_Application__c cApp = new Course_Application__c();
        //cApp.Applicant__c = 'a006F000035zz4Z'; //never hard code
        cApp.Applicant__c = applntLst[0].Id;
        cApp.Course__c = course.Id;
        cApp.Status__c = 'New';
        courseApplLst.add(cApp);
        
        Course_Application__c cApp2 = new Course_Application__c();
        cApp2.Applicant__c = applntLst[0].Id;
        cApp2.Course__c = course.Id;
        cApp2.Status__c = 'Under Conditional Approval';
        courseApplLst.add(cApp2);
        
        Course_Application__c cApp3 = new Course_Application__c();
        courseApplLst.add(cApp3);
        
        /*try {
          insert courseApplLst;
        }
        catch(Exception e) {
          system.debug('courseApplLst exception: '+e.getMessage());
        }*/
        /*
          1. Allowing partial DML operation
          2. In detail error handling
        */
        /*Database.saveResult[] svResult = Database.insert(courseApplLst,false);
        for (Database.SaveResult sr : svResult) {
          if (sr.isSuccess()) {
              // Operation was successful, so get the ID of the record that was processed
              System.debug('Successfully inserted Course Application. Application ID: ' + sr.getId());
          }
          else {
              // Operation failed, so get all errors                
              for(Database.Error err : sr.getErrors()) {
                  System.debug('The following error has occurred.');                    
                  System.debug(err.getStatusCode() + ': ' + err.getMessage());
                  System.debug('Account fields that affected this error: ' + err.getFields());
              }
          }
      }
      }
      //Working with update operation
      List<Course_Application__c> caUpdLst = [select id, Status__c from Course_Application__c where 
      Status__c = 'New' or Status__c = null];
      for(Course_Application__c ca : caUpdLst) {
        ca.Status__c = 'Queued for Assessment';
      }
      if(caUpdLst != null && caUpdLst.size() > 0) {
        try {
          update caUpdLst;
        }
        catch(Exception e) {
          system.debug('caUpdLst Exception: '+e.getMessage()+' in line number: '+e.getLineNumber());
        }
      }
      
      //Delete operation
      List<Course_Application__c> courseDelLst = [select id from Course_Application__c where LastModifiedDate = today];
      if(courseDelLst != null && courseDelLst.size() > 0) {
        try {
          delete courseDelLst;
        }
        catch(Exception e) {
          system.debug('courseDelLst Exception: '+e.getMessage()+' in line number: '+e.getLineNumber());
        }
      }
      
      //Undelete operation
      List<Course_Application__c> courseUndelLst = [select id from Course_Application__c 
      where isDeleted=true all rows];
      
      if(courseUndelLst !=  null && courseUndelLst.size() > 0) {
        try {
          undelete courseUndelLst;
        }
        catch(Exception e) {
          system.debug('courseDelLst Exception: '+e.getMessage()+' in line number: '+e.getLineNumber());
        }
      }
      
      //SOSL Query
      List<List<Sobject>> lstOfLst = [Find 'test' in All Fields returning 
      Account, Contact, Applicant__c, Course__c];
      List<Schema.Account> accLst = (List<Schema.Account>)lstOfLst[0];
      List<Course__c> courseSoslLst = (List<Course__c>)lstOfLst[3];*/
    }
}