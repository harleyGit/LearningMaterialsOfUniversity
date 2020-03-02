import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestSampleCacl {

	@Before
	public void start() throws Exception {
		System.out.println("�����ݿ������");
	}

	@After
	public void end() throws Exception {
		System.out.println("�ر����ݿ������");
	}

	@Test
	public void add() {
		SampleCaclculator calculator = new SampleCaclculator();
		int result = calculator.add(50, 20);
		assertEquals(70, result);
	}

	@Test
	public void subtration() {
		SampleCaclculator calculator = new SampleCaclculator();
		int result = calculator.subtration(50, 20);
		assertEquals(40, result);
	}

}
