trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
	
    List<Task> CreateTasks=new List<Task>();
    for(Opportunity opp : Trigger.new){
        If(opp.StageName=='Closed Won'){
            Task t=new Task(Subject='Follow Up Test Task',WhatId=opp.id);
            CreateTasks.add(t);
        }
    }
    insert CreateTasks;
}