import java.util.Date;
import java.lang.Math;

public class TimeThread extends Thread {
    
    public void run() {
        try {
            long timeSum, startTime;
            timeSum = startTime = new Date().getTime();
            long correction = 0;
            
            for (int i = 0; i < 5; i++) {
                long time = new Date().getTime();
                System.out.println("Initial time: " + time);
                
                System.out.println("Correction: " + correction);
                Thread.sleep(10000 - correction); // 10 seconds minus correction
                
                System.out.println("End time: " + new Date().getTime() + "\n");
                long endTime = new Date().getTime();
                correction = Math.max(0, endTime - time - 10000);
                timeSum += endTime - time;
            }
            
            long elapsed = timeSum - startTime;
            System.out.println("Time elapsed: " + elapsed + " milliseconds");
        } catch (InterruptedException e) {
            System.out.println("Exception in TimeThread");
        }
    }
    
    // System time does not return anything smaller than milliseconds 
    // and the local drift of the clock is sub-millisecond drift at this interval.
    
    // This problem can partially be mitigated by using System.nanoTime()
    // as that returns nanoseconds, but the downside of this is that Thread.sleep()
    // does not accept anything less than milliseconds anyway, making the extra
    // nanosecond data moot.
    
    // The end result is that even though time is corrected, the loss of precision
    // due to the above factors will never allow Java to have the perfect clock.
}
