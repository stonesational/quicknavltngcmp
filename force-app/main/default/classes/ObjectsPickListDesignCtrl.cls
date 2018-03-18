global with sharing class ObjectsPickListDesignCtrl extends VisualEditor.DynamicPickList {
    
    global override Boolean isValid(Object attributeValue){
        String val = (String)attributeValue;       

        if ( val == null || val.length() == 0 ) return true; //Valid if blank

        //Check if the Object Name is valid
		Map<String, Schema.SObjectType> sObjects = Schema.getGlobalDescribe();
        if( sObjects.containsKey(val) ) return true;
        else return false;
    }  
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('', '');
        return defaultValue;
    }
    
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();
        myValues.addRow(new VisualEditor.DataRow('',''));
        for( String sObj : getSobjects() ){
            myValues.addRow(new VisualEditor.DataRow(sObj, sObj));
        }
        return myValues;
    }
    
    private List<String> getSObjects(){        
        List<string> toReturn = new List<string>();

        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
			String name = objTyp.getDescribe().getName();
			if( !containsUnwantedObject(name) ) toReturn.add(name);
		}
        return toReturn;        
    }
    
    private Boolean containsUnwantedObject(String argName){
        SET<String> badNamesContains = new SET<String>{'history', 'tag', 'share', 'feed'};
        SET<String> badNamesExact = new SET<String>{'EventLogFile', 'CorsWhitelistEntry', 'UserFieldAccess', 'UserEntityAccess'};
        
        for(String badName :badNamesContains){ //Check if name is similar to anything bad
			if(argName.containsIgnoreCase(badName)) return true;                
        }
        for(String badName :badNamesExact){ //Check if name is bad
            if(argName.equals(badName)) return true;                
        }
        return false;    
    }
}