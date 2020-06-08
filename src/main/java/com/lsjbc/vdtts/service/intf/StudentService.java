package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface StudentService {
    public List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);
    public int insertstudent(Student student);
    public int updatestudent(Student student);
    public int selectCount(Student student);
    public int deletestudent(Student student);
	public LayuiData selectList(Student student, int page, int pageSize);

}
