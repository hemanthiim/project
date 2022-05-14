({
    //Load Account Industry Picklist
    doInit: function(component, event, helper) {        
        helper.getIndustryPicklist(component, event);
    },
    
    //handle Account Save
    handleAccountSave : function(component, event, helper) {
        helper.saveAccount(component, event);
    },
    
    //handle Industry Picklist Selection
    handleCompanyOnChange : function(component, event, helper) {
        var indutry = component.get("v.acc.Industry");
        alert(indutry);
    }
})