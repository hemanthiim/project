trigger CaseTrigger on Case (before delete) {
    for(Case cs : trigger.old){
        if(cs.isClosed){
            cs.Status.addError(label.CaseClosed_Error_Message);
        }
    }
}