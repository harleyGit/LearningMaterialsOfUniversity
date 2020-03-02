package com.tjitcast.log;

// 导入相应的类
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CommonLoggingTest {
	// 使用CommonsLogging来获得日志记录器实例
	private static Log logger = LogFactory.getLog(CommonLoggingTest.class);

	public static void main(String[] args) {
		// 输出日志信息
		if (logger.isDebugEnabled()) {
			logger.debug("这是调试级日志");
		}
		if (logger.isInfoEnabled()) {
			logger.info("这是消息级日志");
		}
		if (logger.isWarnEnabled()) {
			logger.warn("这是警告级日志");
		}
		if (logger.isErrorEnabled()) {
			logger.error("这是异常信息", new RuntimeException("内部异常"));
		}
	}
}
