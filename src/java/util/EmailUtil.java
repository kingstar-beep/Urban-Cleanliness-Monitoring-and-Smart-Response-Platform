package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    public static void sendAlert(

            String toEmail,
            String streetName,
            String status

    ){

        final String senderEmail =
                "kingstar.files@gmail.com";

        final String senderPassword =
                "wpopkfzejmcimgzy";

        Properties props =
                new Properties();

        props.put(
                "mail.smtp.host",
                "smtp.gmail.com");

        props.put(
                "mail.smtp.port",
                "587");

        props.put(
                "mail.smtp.auth",
                "true");

        props.put(
                "mail.smtp.starttls.enable",
                "true");

        Session session =
                Session.getInstance(
                props,

                new javax.mail.Authenticator(){

            @Override
            protected PasswordAuthentication
            getPasswordAuthentication(){

                return new PasswordAuthentication(
                        senderEmail,
                        senderPassword);
            }
        });

        try{

            Message message =
                    new MimeMessage(session);

            message.setFrom(
                    new InternetAddress(
                            senderEmail));

            message.setRecipients(

                    Message.RecipientType.TO,

                    InternetAddress.parse(
                            toEmail)
            );

            message.setSubject(
                    "Urban Cleanliness Alert");

            message.setText(

                    "Alert!\n\n"

                    + "Street: "
                    + streetName

                    + "\nStatus: "
                    + status

                    + "\n\nImmediate attention required."

            );

            Transport.send(message);

            System.out.println(
                    "Alert email sent successfully."
            );

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}