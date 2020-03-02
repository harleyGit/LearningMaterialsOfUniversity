import junit.framework.TestCase;


public class TestSampleCaclculator extends TestCase {
protected void setUp() throws Exception{
	System.out.println("打开数据库的连接");
}
	public void testAdd() {
		SampleCaclculator calculator=new SampleCaclculator();
		int result =calculator.add(50, 20);
		this.assertEquals(70, result);
	}

	public void testSubtration() {
		SampleCaclculator calculator=new SampleCaclculator();
		int result =calculator.subtration(50, 20);
		this.assertEquals(40, result);
	}
	protected void tearDown() throws Exception{
		System.out.println("关闭数据库的连接");
	}
}
