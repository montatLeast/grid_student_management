
package com.family168.student;

import java.sql.*;
import java.util.*;

public class StudentDao {
    private static StudentDao instance = new StudentDao();
    protected StudentDao() {
    }
    public static StudentDao getInstance() {
        return instance;
    }
    public Page pagedQuery(int start, int limit, String sort, String dir) throws Exception {

        String sql = "select limit " + start + " " + limit + " * from student";
        if (sort != null && !sort.equals("") && dir != null && !dir.equals("")) {
            sql += " order by " + sort + " " + dir;
        }
        Connection conn = DbUtils.getConn();
        Statement state = conn.createStatement();

        ResultSet rs = state.executeQuery(sql);
        List result = new ArrayList();
        while (rs.next()) {
            Student student = new Student();
            student.setId(rs.getLong("id"));
            student.setCode(rs.getString("code"));
            student.setName(rs.getString("name"));
            student.setSex(rs.getInt("sex"));
            student.setAge(rs.getInt("age"));
            student.setPolitical(rs.getString("political"));
            student.setOrigin(rs.getString("origin"));
            student.setProfessional(rs.getString("professional"));
            result.add(student);
        }
        rs = state.executeQuery("select count(*) from student");
        int totalCount = 0;
        if (rs.next()) {
            totalCount = rs.getInt(1);
        }
        DbUtils.close(rs, state, conn);

        Page page = new Page(totalCount, result);
        return page;

    }

    public void insert(Student student) throws Exception {
        String sql = "insert into student(code,name,sex,age,political,origin,professional) values(?,?,?,?,?,?,?)";

        Connection conn = DbUtils.getConn();
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, student.getCode());
        state.setString(2, student.getName());
        state.setInt(3, student.getSex());
        state.setInt(4, student.getAge());
        state.setString(5, student.getPolitical());
        state.setString(6, student.getOrigin());
        state.setString(7, student.getProfessional());

        state.executeUpdate();
        DbUtils.close(null, state, conn);
    }

    public void update(Student student) throws Exception {
        String sql = "update student set code=?,name=?,sex=?,age=?,political=?,origin=?,professional=? where id=?";

        Connection conn = DbUtils.getConn();
        PreparedStatement state = conn.prepareStatement(sql);
        state.setString(1, student.getCode());
        state.setString(2, student.getName());
        state.setInt(3, student.getSex());
        state.setInt(4, student.getAge());
        state.setString(5, student.getPolitical());
        state.setString(6, student.getOrigin());
        state.setString(7, student.getProfessional());
        state.setLong(8, student.getId());

        state.executeUpdate();
        DbUtils.close(null, state, conn);
    }

    public void remove(long id) throws Exception {
        String sql = "delete from student where id=?";

        Connection conn = DbUtils.getConn();
        PreparedStatement state = conn.prepareStatement(sql);
        state.setLong(1, id);

        state.executeUpdate();
        DbUtils.close(null, state, conn);
    }
}
