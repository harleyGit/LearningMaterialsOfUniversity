java_test项目：

1. 更改jdbc.properties中的数据库用户名和密码。
2. 更改java_test\src\org\bzc\jdbc下DoInsert.java、DoSelect.java、PreparedSelect.java中的数据库用户名和密码。

3. 在SQLyog中选择DB->Restore From SQL Dump菜单命令，导入studb.sql。
4. 运行src下org.tjitcast.jdbc中的Java文件(右击文件，以Run As Java Application方式运行)，并在Console中查看输出。

5. 项目中使用了jre1.6.0_06，如果导入项目后查看项目属性->Java Build Path->Libraries时显示为(unbound)，请单击Edit按钮，为Alternate JER重新绑定jre1.6.0_06。