@isTest
private class AnimalLocatorTest {
   @isTest static void testAnimalLocator() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String response = AnimalLocator.getAnimalNameById(1);
        System.assertNotEquals(null,response,'The callout returned a null response.');
}
}