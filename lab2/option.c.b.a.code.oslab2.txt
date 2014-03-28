package oslab2;

import java.util.Scanner;

public class Oslab2 {

    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        System.out.print("How many officers? ");
        int numOfficers = reader.nextInt();
        System.out.print("How many shuttles? ");
        int numShuttles = reader.nextInt();
        
        LandingOfficerManager man = new LandingOfficerManager(numOfficers, numShuttles);
        
        man.start();
    }
}
