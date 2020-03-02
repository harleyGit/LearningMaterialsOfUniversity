import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionFactory;
import db.DbClose;



// 该类用来演示JDBC事务的用法
public class TestTansaction {
	public static void main(String[] args) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO stuinfo(name, classes, score)VALUES(?,6851,88)";
        String sql2="DELETE FROM student Where id=2";
		try {
			// 1. 设置是否自动提交事务为false
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "测试事务");
			System.out.println("第一条语句执行....");
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(sql2);
			System.out.println("第二条语句执行....");
			pstmt.executeUpdate();
			// 2. 提交事务
			conn.commit();
			System.out.println("提交事务....");
		} catch (SQLException e) {
			try {
				// 3. 如果出现异常则回滚事务
				conn.rollback();
				System.out.println("回退事务....");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				//4. 设置自动提交事务为true
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DbClose.close(pstmt, conn);
		}
	}
}
