public class AnimalLocator {
    public static String getAnimalNameById(Integer ID) {
        String name;
        HTTP http = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ ID);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
			system.debug('Animal info' + response);
        }
        return name;
    }

    //sit
}