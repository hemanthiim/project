global class UpdateContactAddressesBatchSchedule implements Schedulable{
    global void execute(SchedulableContext SC) {
        UpdateContactAddressesBatch ucab = new UpdateContactAddressesBatch();
        ID batchId = Database.executeBatch(ucab);
    }
}