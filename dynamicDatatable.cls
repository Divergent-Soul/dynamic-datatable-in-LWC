public with sharing class dynamicDatatable {
    
    @AuraEnabled
    public String label {get;set;}
    @AuraEnabled
    public String fieldName {get;set;}
    
    @AuraEnabled
    public static List<dynamicDatatable> readFieldSet(String fieldSetName, String ObjectName){
        List<dynamicDatatable> objList = new List<dynamicDatatable>();
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
        for(Schema.FieldSetMember fieldSetMem : fieldSetObj.getFields()){
            dynamicDatatable dd = new dynamicDatatable();
            dd.label = String.valueOf(fieldSetMem.getLabel());
            dd.fieldName = String.valueOf(fieldSetMem.getFieldPath());
            objList.add(dd);
        }
        return objList;
    }

    @AuraEnabled
    public static List<sObject> getRecords(String objectName, List<String> fieldsList){
        String fields = 'Id';
        for (String str : fieldsList) {
            fields = fields + ',' +str;
        }
        String query = 'SELECT ' + fields + ' FROM ' + objectName;
        return Database.query(query);
    }

}