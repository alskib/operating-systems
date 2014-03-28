package oslab2;

import java.util.Scanner;

public class LandingOfficerManager extends Thread {
    private LandingOfficer[] officerArray = new LandingOfficer[20]; 
    private Shuttle[] shuttleArray = new Shuttle[20];
    private String[] officerNameList = {"Ace", "Brycin", "Cyder", "Jantzen", "Macen", "Ryo", "Vegas"};
    private String[] shuttleNameList = {"Atlantis", "Challenger", "Columbia", "Endeavour", "Enterprise",
                                        "Constellation", "Constitution", "Defiant", "Excalibur", "Exeter",
                                        "Farragut", "Hood", "Intrepid", "Lexington", "Potemkin", "Yorktown",
                                        "Pegasus", "Agincourt", "Crockett", "Fearless"};
    private int numOfficers;
    
    public LandingOfficerManager(int inputOfficers, int inputShuttles) {
        numOfficers = inputOfficers;
        for (int i = 0; i < inputOfficers; i++) {
            officerArray[i] = new LandingOfficer(officerNameList[i]);
            officerArray[i].start();
        }
        
        for (int j = 0; j < inputShuttles; j++) {
            shuttleArray[j] = new Shuttle(shuttleNameList[j], this);
            shuttleArray[j].start();
        }       
    }
    
    public void landingRequest(Shuttle shuttle) {
        int off = 0;
        while (true) {
            if (officerArray[off].status() == false) {
                officerArray[off].shuttleLanding(shuttle);
                break;
            } else {
                off++;
            }
            
            if (off == numOfficers)
                off = 0;
        }
    }
    
    public void run() {
        try {
            System.out.println("Manager has started.");
        } catch (Exception e) {
            System.out.println("Manager exception: " + e);
        }
    }
}