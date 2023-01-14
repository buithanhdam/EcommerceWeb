package vn.edu.hcmuaf.fit.services;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class JavaMail {
        private static JavaMail instance;

        private int otp = 0;
        private JavaMail(){

        }
        public static JavaMail getInstance(){
            if (instance==null) instance = new JavaMail();
            return instance;
        }

        public  int OTP(){
            return otp;
        }
    public boolean getOTB(String email) throws MessagingException, UnsupportedEncodingException {
        final String fromEmail = "travellab2023@gmail.com";
        // Mat khai email cua ban
        final String password = "sbqhjjexxrorqwgi";
        // dia chi email nguoi nhan
        final String toEmail = email;
        final String subject = "Cấp otp quên mật khẩu TravelLab";
        final int otb = new Random().nextInt(100000,999999);
        String msg = "Mã OTP: "+otb;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(msg);
            Transport.send(message);
            this.otp = otb;
            System.out.println("Gui mail thanh cong");
        } catch (MessagingException e) {
            System.out.println("Gui mail that bai");
            return false;
        }



        return true;
    }
}
