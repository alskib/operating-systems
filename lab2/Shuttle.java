package oslab2;

public class Shuttle extends Thread {
    private String shuttleName;
    private LandingOfficerManager manager;
    
    public Shuttle(String name, LandingOfficerManager man) {
        this.shuttleName = name;
        this.manager = man;
    }
    
    public String name() {
        return shuttleName;
    }
    
    public void run() {
        try {
            System.out.println("Shuttle " + this.name() + " is now operating.");
            
            for (int i = 0; i < 5; i++) {
                System.out.println("Starting mission " + (i+1) + " for shuttle " + this.name() + ".");
                Thread.sleep((int)(10000 * Math.random()));
                System.out.println("Shuttle " + this.name() + " requires landing officer.");
                manager.landingRequest(this);
                System.out.println("Mission " + (i+1) + " complete for shuttle " + this.name() + ".");   
            }
            
            System.out.println("ALL MISSIONS COMPLETE: " + this.name() + ".");
        } catch (InterruptedException e) {
            System.out.println("Exception for shuttle " + this.name() + ". " + e);
        }
    }
}
