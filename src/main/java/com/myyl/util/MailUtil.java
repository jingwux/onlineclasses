package com.myyl.util;

import com.myyl.pojo.User;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;



/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public final class MailUtil {

    public static Properties props;

    private static Session session;

    static {
        props = new Properties();
        props.put("mail.transport.protocol", "smtp");    // 指定协议
        props.put("mail.smtp.host", "smtp.qq.com");        // 主机   stmp.qq.com
        //props.put("mail.smtp.port", 25);					// 端口
        props.put("mail.smtp.auth", "true");                // 用户密码认证
        props.put("mail.debug", "false");

        session = Session.getDefaultInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("email", "password");
            }
        });
    }

    public static void sendMail(User user) throws MessagingException {

        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("email"));
        msg.setSubject("激活邮件");
        msg.setSentDate(new Date());
        msg.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
        msg.setContent("亲爱的 <b>" + user.getUname() + "</b> ：<br/>&emsp;&emsp;恭喜你成为本网站的用户，请于24小时内使用以下链接激活你的用户。"
                        + "<a href='http://localhost:8080/onlineclasses_war_exploded/user/register/active/"
                        + user.getUid() + "/" + user.getValidatecode() + "'>点击激活</a>&emsp;(如果不能点击该链接地址，请复制并粘贴到浏览器的地址输入框)"
                        + "<br/><br/>&emsp;" + DateUtil.getCurrentFormatDate(), "text/html;charset=utf-8");

        //4)发送邮件
        Transport.send(msg);
    }

    public static void sendMailToAdmin(User user) {

        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setSubject("反馈邮件");
            msg.setSentDate(new Date());
            msg.setSender(new InternetAddress("email"));
            msg.setRecipient(RecipientType.TO, new InternetAddress("email"));
            msg.setContent(user.getRemark() + "<br/>发送者：" + user.getUname() + "<br/>邮箱：" + user.getEmail(), "text/html;charset=utf-8");

            //4)发送邮件
            Transport.send(msg);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

}
