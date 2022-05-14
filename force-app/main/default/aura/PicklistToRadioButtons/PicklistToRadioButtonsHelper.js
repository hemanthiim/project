({
    //get Industry Picklist Value
    getIndustryPicklist: function(component, event) {
        var action = component.get("c.getIndustry");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                console.log("----------",result);
                var industryMap = [];
                for(var key in result){
                    industryMap.push({label: result[key], value: key});
                }
                component.set("v.industryMap", industryMap);
            }
        });
        $A.enqueueAction(action);
    },
    
    //handle Account Save
    saveAccount : function(component, event) {
        var acc = component.get("v.acc");
        var action = component.get("c.createAccount");
        action.setParams({
            objacc : acc
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                alert('Record is Created Successfully');
            } else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            }else if (status === "INCOMPLETE") {
                alert('No response from server or client is offline.');
            }
        });       
        $A.enqueueAction(action);
    }
})