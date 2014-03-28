with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
package body Lab1Ver2 is
   -- definitions
   randNum: Generator;  -- used to generate 0.0 <= random numbers <1.0.
    --"Random(randNum)" generates a random number, 0.0 < random number < 1.0.
    -- Duration(Random(randNum) ) coerces the random number to the data type
    -- required by the "delay" statement when requesting a process be put to sleep.

   C1 : Integer := 0;
   C2 : Integer := 0;
   Turn : Integer := 1;

   -- This entire procedure represents a critical resource where access must be controlled.
   procedure LandingControlOfficer( Request: in RequestType; Shuttle: in ShuttleNameType) is
   begin
      case Request is
         when Permission_To_Land =>
            delay Duration(Random(randNum) * 5.0);
            -- Make decision.
            put(Shuttle); put(" is granted permission to land."); new_line;
         when Call_The_Ball =>
            delay Duration(Random(randNum) * 5.0);
            -- Prepare gudiance system..
            put(Shuttle); put(" call the ball!"); new_line;
         when Touch_Down =>
            put(Shuttle); put(", permission is granted for final approach."); new_line;
            delay Duration(Random(randNum) * 10.0);
            -- Wait for shuttle to land.

      end case;

   end LandingControlOfficer;

   task body Shuttle1 is
      shuttle: ShuttleNameType := shuttleName;
      initiateLandingSequence: duration;
      landingComplete: duration;
   begin
      for I in 1..10 loop
         delay Duration(Random(randNum) * 15.0);  --Crew boarding and perform mission.
         C1 := 1;
         while C2 = 1 loop
            if Turn = 2 then
               C1 := 0;
               while Turn = 2 loop
                  null;
               end loop;
               C1 := 1;
            end if;
         end loop;
         put(shuttle); put(" entering its critical landing section.");  new_line(2);
         initiateLandingSequence:= seconds(clock);
         LandingControlOfficer( Permission_To_Land, shuttle );
         LandingControlOfficer( Call_The_Ball, shuttle );
         delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
         LandingControlOfficer( Touch_Down, shuttle );
         landingComplete := seconds(clock);
         put( shuttle ); put(" docked in "); put( landingComplete - initiateLandingSequence );
         put(" seconds." ); new_line;
         put( shuttle ); put(" leavings its critical section.  Obtain new crew and start next mission.");
         new_line(2);

         C1 := 0;
         Turn := 2;
        end loop;
   end Shuttle1;

   task body Shuttle2 is
        shuttle: ShuttleNameType := shuttleName;
        initiateLandingSequence: duration;
      landingComplete: duration;
   begin
      for I in 1..10 loop
         delay Duration(Random(randNum) * 15.0);  --Crew boarding and perform mission.
         C2 := 1;
         while C1 = 1 loop
            if Turn = 1 then
               C2 := 0;
               while Turn = 1 loop
                  null;
               end loop;
               C2 := 1;

            end if;
         end loop;
         put(shuttle); put(" entering its critical landing section.");  new_line(2);
         initiateLandingSequence:= seconds(clock);
         LandingControlOfficer( Permission_To_Land, shuttle );
         LandingControlOfficer( Call_The_Ball, shuttle );
         delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
         LandingControlOfficer( Touch_Down, shuttle );
         landingComplete := seconds(clock);
         put( shuttle ); put(" docked in "); put( landingComplete - initiateLandingSequence );
         put(" seconds." ); new_line;
         put( shuttle ); put(" leavings its critical section.  Obtain new crew and start next mission.");
         new_line(2);

         C2 := 0;
         Turn := 1;
      end loop;
   end Shuttle2;

end Lab1Ver2;
