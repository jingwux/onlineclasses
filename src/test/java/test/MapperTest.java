package test;

import com.myyl.mapper.AdminMapper;
import com.myyl.pojo.Admin;
import com.myyl.pojo.AdminExample;
import com.myyl.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

//@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class MapperTest {


    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminMapper adminMapper;

    @Test
    public void testSSM(){
//        adminService.testMapper();
        List<Admin> admins = adminMapper.selectByExample(new AdminExample());
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }

    @Test
    public void testMapper(){
        ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        AdminMapper adminMapper1 = (AdminMapper) applicationContext.getBean("adminMapper");
        adminMapper1.countByExample(new AdminExample());
        System.out.println(adminMapper1);
    }



}