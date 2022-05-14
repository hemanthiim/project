@isTest
public class CalcTest {
    @isTest static void CalcTest(){		//@isTest is to pass some parameters when required. To access the salesforce DB
        Calc c = new Calc();
        system.debug('Addition :'+c.addition(10,5));
        system.debug('Subtraction :'+c.subtraction(10,5));
        system.debug('Multiplication :'+c.multiplication(10,5));
        system.debug('Division :'+c.division(10,5));
    }
}