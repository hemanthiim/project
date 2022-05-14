public class accountrelatedContact{

    public accountrelatedContact(){


    }

    public static void createContact(list<account> acclist){

    list<contact> conlist = new list<contact>();

        for(account acc: acclist){

            contact con = new contact();
            con.lastname = acc.name;
            con.phone = acc.phone;
            con.accountid = acc.id;

            conlist.add(con);
        }
        Database.insert(conlist,true);


    }


    }