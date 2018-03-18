@isTest
public class ViewsPickListDesignCtrlTest {
/**
 * Test class for ViewsPickListDesignCtrl
 *  1) test01_labsnavhelper_DefaultValues: Check Default labels
 *  2) test02_labsnavhelper_CheckValues: Ensure a std obj like Account is present
 *  3) test03_labsnavhelper_Valid: Good Values
 */

    @isTest static void test01_DefaultValues() {
        labsnavhelper.ViewsPickListDesignCtrl opl = new labsnavhelper.ViewsPickListDesignCtrl();
        VisualEditor.DataRow row = opl.getDefaultValue();
        System.assert(row != null);
        System.assertEquals('', row.getValue());            
    }


    @isTest static void test02_labsnavhelper_CheckValues() {
        SET<String> values = new SET<String>();
        labsnavhelper.ViewsPickListDesignCtrl opl = new labsnavhelper.ViewsPickListDesignCtrl();
        VisualEditor.DynamicPickListRows rows = opl.getValues();		

        System.assert(rows != null);

        Integer blankThreshold=1; //One blank entry allowed  
        Boolean isGoodTest = true;
        for(VisualEditor.DataRow row : rows.getDataRows()){
			String x = (String)row.getValue();
            List<String> parts = x.split(',');
            if(parts.size() != 3){
                if(blankThreshold > 0) blankThreshold--;
                else isGoodTest=false;
            } else values.add(parts[1]+'_'+parts[2]);
        }
		System.assert(values.contains('Opportunity Pipeline_Opportunity'));        
    }
    

    @isTest static void test03_labsnavhelper_Valid() {
        labsnavhelper.ViewsPickListDesignCtrl opl = new labsnavhelper.ViewsPickListDesignCtrl();
        System.assert(opl.isValid(true));
    }
    
}