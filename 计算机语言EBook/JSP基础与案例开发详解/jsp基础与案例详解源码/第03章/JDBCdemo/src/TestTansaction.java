import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionFactory;
import db.DbClose;



// ����������ʾJDBC������÷�
public class TestTansaction {
	public static void main(String[] args) {
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO stuinfo(name, classes, score)VALUES(?,6851,88)";
        String sql2="DELETE FROM student Where id=2";
		try {
			// 1. �����Ƿ��Զ��ύ����Ϊfalse
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "��������");
			System.out.println("��һ�����ִ��....");
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(sql2);
			System.out.println("�ڶ������ִ��....");
			pstmt.executeUpdate();
			// 2. �ύ����
			conn.commit();
			System.out.println("�ύ����....");
		} catch (SQLException e) {
			try {
				// 3. ��������쳣��ع�����
				conn.rollback();
				System.out.println("��������....");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				//4. �����Զ��ύ����Ϊtrue
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DbClose.close(pstmt, conn);
		}
	}
}
