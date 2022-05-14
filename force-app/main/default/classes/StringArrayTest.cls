public class StringArrayTest {
    public static List<string> generateStringArray(integer arraysize){
        List<string> strings = new List<string>();
        for(integer i=0;i<arraysize;i++){
            string s='Test '+i;
            strings.add(s);
        }
        return strings;
    }
}