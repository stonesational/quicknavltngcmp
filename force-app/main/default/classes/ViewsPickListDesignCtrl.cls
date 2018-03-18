global with sharing class ViewsPickListDesignCtrl extends VisualEditor.DynamicPickList{
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('','');
        return defaultValue;
    }
    
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();
        myValues.addRow(new VisualEditor.DataRow('',''));
        for( ListView lv : [SELECT Id, Name, NamespacePrefix, SobjectType FROM ListView WHERE SobjectType != NULL] ){
            //Format Name
            String formatedName = lv.SobjectType + '_' + lv.Name;
            if(lv.NamespacePrefix != null) formatedName += ' (' + lv.NamespacePrefix + ')';
            
            //Format Value
            String val = (String)lv.Id + ',' + lv.Name + ',' + lv.SobjectType;
            myValues.addRow(new VisualEditor.DataRow(formatedName, val));
        }
        
        return myValues;
    }
    
    global override Boolean isValid(Object attributeValue){
		//TODO: Why is the below query giving we getting: "System.QueryException: sObject type 'ListView' is not supported."??
		//		I smell a bug where a ListView query is not allowed within the VisualEditor.DynamicPickList.isValid
        //		Returning true for now since there doesn't seem to be any harm from a dropdown
		return true;
         
        /* 
        String val = (String)attributeValue;  
        
		if ( val.length() == 0 ) return true; //Valid if blank
       
        //Check if the LiveView ID is valid
        List<ListView> lv = [SELECT Id FROM ListView WHERE Id=:val];
        if( lv.isEmpty() ) return false;
        else return true;
		*/
    }
    
}