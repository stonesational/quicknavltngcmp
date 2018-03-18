/**
 * Test class for ObjectsPickListDesignCtrl
 *  1) test01_labsnavhelper_DefaultValues: Check Default labels
 *  2) test02_labsnavhelper_CheckValues: Ensure a std obj like Account is present
 *  3) test03_labsnavhelper_Valid: Good Values
 *  4) test04_labsnavhelper_Invalid: Bad Values
 */
@isTest
public class ObjectsPickListDesignCtrlTest {

    @isTest static void test01_DefaultValues() {
        labsnavhelper.ObjectsPickListDesignCtrl opl = new labsnavhelper.ObjectsPickListDesignCtrl();
        VisualEditor.DataRow row = opl.getDefaultValue();
        System.assert(row != null);
        System.assertEquals('', row.getValue());            
    }


    @isTest static void test02_labsnavhelper_CheckValues() {
        labsnavhelper.ObjectsPickListDesignCtrl opl = new labsnavhelper.ObjectsPickListDesignCtrl();
        VisualEditor.DynamicPickListRows rows = opl.getValues();		

        System.assert(rows != null);
        
        SET<String> values = new SET<String>();
        for(VisualEditor.DataRow row : rows.getDataRows()){
            values.add((String)row.getValue());
        }
		
		System.assert(values.contains('Account'));        
    }
    

    @isTest static void test03_labsnavhelper_Valid() {
        labsnavhelper.ObjectsPickListDesignCtrl opl = new labsnavhelper.ObjectsPickListDesignCtrl();
        System.assert(opl.isValid(null));
	    System.assert(opl.isValid(''));        
        System.assert(opl.isValid('Contact'));
    }

   
    @isTest static void test04_labsnavhelper_Invalid() {
        labsnavhelper.ObjectsPickListDesignCtrl opl = new labsnavhelper.ObjectsPickListDesignCtrl();
        System.assert(!opl.isValid('blaskdlklajsdfljasd'));
    }
    

}