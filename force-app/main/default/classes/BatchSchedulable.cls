public class BatchSchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        //Sample Callout
        Http http = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        System.debug('HTTP response'+res);
        if(res.getStatusCode() == 200){
            Map<String,object> results = (Map<String,object>) JSON.deserializeUntyped(res.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following output');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
        
         Branch.test();
    }
}