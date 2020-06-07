package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface StudentService {
    public List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);
    public int inserttudent(Student student);
    public int updatetudent(Student student);
    public int selectCount(Student student);
    public int deletetudent(Student student);

}
