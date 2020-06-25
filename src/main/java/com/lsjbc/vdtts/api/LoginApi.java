package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.dao.ExamErrorDao;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.impl.StudentServiceImpl;
import com.lsjbc.vdtts.service.intf.StudentService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName: LoginApi
 * @Description: 登录时使用的接口
 * @Datetime: 2020/6/16   20:13
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/login")
public class LoginApi {

    @Resource(name = StudentServiceImpl.NAME)
    private StudentService studentService;

    @Resource(name = ExamErrorDao.NAME)
    private ExamErrorDao examErrorDao;

    /**
     * 学员登录
     *
     * @param request request域
     * @param account 登录信息
     * @return 登录结果
     */
    @PostMapping("student")
    public ResultData studentLogin(HttpServletRequest request, Account account) {
        ResultData resultData = studentService.studentLogin(account, request);

        if(resultData.getCode()==0){
            Student student = (Student) request.getSession().getAttribute("student");
            readExamError(student.getSId());
        }

        return resultData;
    }

    /**
     * 预读用户的错题
     * @param studentId 学员ID
     */
    @Async
    public void readExamError(Integer studentId){
        examErrorDao.getByStudentId(studentId,1);
        examErrorDao.getByStudentId(studentId,4);
    }

}
