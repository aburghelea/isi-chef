package ro.isi.restaurant;

import junit.framework.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * User: Alexandru Burghelea
 * Date: 12/24/12
 * Time: 6:30 PM
 */
public class CodeGeneratorTest {

    CodeGenerator codeGenerator;
    @Before
    public void setUp() throws Exception {
        codeGenerator = new CodeGenerator();
    }

    @Test
    public void testGetCodeForEmptyPrefix() throws Exception {
        Assert.assertEquals("S_1",codeGenerator.getNextCode("S"));
        Assert.assertEquals("DRINKS_1",codeGenerator.getNextCode("DRINKS"));
        Assert.assertEquals("FOOD_1",codeGenerator.getNextCode("FOOD"));
    }

    @Test
    public void testGetMultipleTimesForSamePrefix() throws Exception {
        for (int i = 1 ; i < 20; i++){
            Assert.assertEquals("DRINKS_"+i,codeGenerator.getNextCode("DRINKS"));
        }
    }
}
