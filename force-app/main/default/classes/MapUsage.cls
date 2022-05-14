public with sharing class MapUsage {
    public static void mapUse() {
      /*
        1. Map holds key and value pair.
        2. Syntax: Map<DataType,DataType> mapName = new Map<DataType,DataType>();
      */
      /*Map<String,String> cityCountryMap = new Map<String,String>();
      cityCountryMap.put('Bangalore','India');
      cityCountryMap.put('Newyork','USA');
      cityCountryMap.put('Pune','India');
      cityCountryMap.put('Bangalore','Ind');*/
      Map<String,String> cityCountryMap = new Map<String,String>{
        'Bangalore'=>'India', 'Newyork'=>'USA', 'Pune'=>'India', 'Bangalore'=>'Ind'
      };
      
      system.debug('cityCountryMap: '+cityCountryMap);
      system.debug('cityCountryMap keys: '+cityCountryMap.keyset());
      system.debug('cityCountryMap values: '+cityCountryMap.values());
      system.debug('cityCountryMap value based on the key: '+cityCountryMap.get('Bangalore'));
      system.debug('cityCountryMap contains a key? '+cityCountryMap.containsKey('Bangalore'));
    }
}