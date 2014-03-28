package oslab2;

public class LandingOfficer extends Thread {
    private String officerName;
    private long startTime, elapsedTime;
    private boolean busy = false;
    
    public LandingOfficer(String name) {
        this.officerName = name;
    }
    
    public String name() {
        return officerName;
    }
    
    public boolean status() {
        return busy;
    }
    
    public synchronized void shuttleLanding(Shuttle shuttle) {
        busy = true;
        startTime = System.currentTimeMillis();
        System.out.println(shuttle.name() + " is entering its critical landing section.");
        System.out.println("[LANDING SEQ][" + this.officerName + "] Interacting with shuttle " + shuttle.name() + ".");
        sleepABit(5000);
        System.out.println("[LANDING SEQ][" + this.officerName + "] " + shuttle.name() + " is granted permission to land.");
        sleepABit(5000);
        System.out.println("[LANDING SEQ][" + this.officerName + "] " + shuttle.name() + " call the ball!");
        sleepABit(3000);
        System.out.println("[LANDING SEQ][" + this.officerName + "] " + shuttle.name() + " permission is granted for final approach.");
        sleepABit(10000);
        elapsedTime = (System.currentTimeMillis() - startTime) / 1000;
        System.out.println("[LANDING SEQ][" + this.officerName + "] " + shuttle.name() + " has docked in " + elapsedTime + " seconds.");
        System.out.println("[LANDING SEQ][" + this.officerName + "] " + shuttle.name() + " leaving its critical section.");
        busy = false;
    }
    
    private void sleepABit(int duration) {
        try {
            Thread.sleep((int)(duration * Math.random()));
        } catch (InterruptedException e) {
            System.out.println("Exception for officer " + this.name() + ". " + e);
        }
    }
    
    public void run() {
        try {
            System.out.println("Officer " + this.name() + " has started.");
        } catch (Exception e) {
            System.out.println("Run exception in officer " + this.name() + ". " + e);
        }
    }
}
