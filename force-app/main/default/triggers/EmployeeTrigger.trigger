trigger EmployeeTrigger on Employee__c (before insert,after update) {
    for(Employee__c emp : Trigger.new){
        if(emp.Phone__c == null){
            emp.addError('TEST : Input value must be a number and must be exactly of length 10');
        }
    }
}