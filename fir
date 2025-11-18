import java.io.*;
import java.net.*;
import java.util.*;
public class Reciever {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of frames to be Recieved:\n");
        int n = sc.nextInt();

        try {
            ServerSocket ss = new ServerSocket(6879);
            Socket s = ss.accept();
            DataInputStream datain = new DataInputStream(s.getInputStream());
            String finaldata = "";
            for (int i = 0; i < n; i++) {
                String data = datain.readUTF();
                System.out.println("Frame Received...Successfully!!!");
                System.out.println("The received frame is : " + data);
                finaldata = finaldata.concat(data);
            }
            System.out.println("The received data is : " + finaldata);
            ss.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

import java.io.*;
import java.net.*;
import java.util.*;
public class Sender {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of frames to be sent:\n");
        int n = sc.nextInt();

        try {
            Socket s = new Socket("localhost", 6879);
            DataOutputStream dataout = new DataOutputStream(s.getOutputStream());

            for (int i = 0; i < n; i++) {
                System.out.println("Enter the frame to be Sent :");
                String data = sc.next();
                int framelen = data.length();
                System.out.println("Sending frame: " + data + " with " + framelen + " bytes");
                dataout.writeUTF(data);
                dataout.flush();
            }
            dataout.close();
            s.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
