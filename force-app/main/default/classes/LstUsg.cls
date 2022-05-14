public class LstUsg {
    Public static void lstusg(){
        List<String> lst1 = new List<String>();
        lst1.add('Hemanth');
        lst1.add('Ravi');
        lst1.add('Mayur');
        system.debug('lst1 '+lst1+' with size '+lst1.size());
        
        List<String> lst2 = new List<String>{'Nidhi','Sagar','Rasool'};
        system.debug('lst2 '+lst2+' with size '+lst2.size());
        lst2.sort();
        system.debug('lst2 '+lst2+' with size '+lst2.size());
        lst2.set(0,'Nidhi Verma');
        lst2[1] = 'Rasool Nayab';
        system.debug('lst2 '+lst2+' with size '+lst2.size());
        lst2.remove(2);
        system.debug('lst2 '+lst2+' with size '+lst2.size());
        lst2.clear();
        system.debug('lst2 '+lst2+' with size '+lst2.size());
        
        List<String> lst3 = lst1.clone();
        lst3.add('Anil');
        system.debug('lst3 '+lst3+' with size '+lst3.size());
        system.debug('lst3 2nd index value'+lst3.get(2));
        system.debug('lst3 2nd index value'+lst3[2]);
        lst3.sort();
        List<String> sortdesc = new List<String>();
        for(Integer i = lst3.size()-1; i>=0;i--)
        {
            sortdesc.add(lst3.get(i));
        }
        
        System.debug('Check the Order -->'+sortdesc); // This should be in descending order
        
    }
}