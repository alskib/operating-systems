with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
procedure Lab1Ver1 is
   -- definitions
   package Duration_IO is new Ada.Text_IO.Fixed_IO(duration);  use Duration_IO;
   package integerIO is new Ada.Text_IO.Integer_IO(integer); use integerIO;

   randNum: Generator;  -- used to generate 0.0 <= random numbers <1.0.
    --"Random(randNum)" generates a random number, 0.0 < random number < 1.0.
    -- Duration(Random(randNum) ) coerces the random number to the data type
                         -- required by the "delay" statement when requesting a process be put to sleep.


   type RequestType is (Permission_To_Land, Call_The_Ball, Touch_Down);
   type ShuttleNameType is (Atlantis, Challenger, Ranger, MeanMachine);

   package ShuttleNameIO is new Ada.Text_IO.Enumeration_IO(ShuttleNameType);
   use ShuttleNameIO;

   C1 : Integer := 0;
   C2 : Integer := 0;
   Turn : Integer := 1;

   -- This entire procedure represents a critical resource where access must be controlled.
   procedure LandingControlOfficer( Request: in RequestType; Shuttle: in ShuttleNameType) is
   begin
      case Request is
      	   when Permission_To_Land =>
               delay Duration(Random(randNum) * 5.0);  --  0 <= Delay < 5.0 uniformly distributed.
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

   task ShuttleAtlantis;
   task body ShuttleAtlantis is
      initiateLandingSequence: duration;
      landingComplete: duration;
   begin
      for I in 1..10 loop
         C1 := 1;
         delay Duration(Random(randNum) * 15.0);  --Crew boarding and perform mission.
         while C2 = 1 loop
            if Turn = 2 then
               C1 := 0;
               while Turn = 2 loop
                  null;
               end loop;
               C1 := 1;
            end if;
         end loop;
         put("Atlantis entering its critical landing section.");  new_line(2);
         initiateLandingSequence:= seconds(clock);
         LandingControlOfficer( Permission_To_Land, Atlantis );
         LandingControlOfficer( Call_The_Ball, Atlantis );
         delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
         LandingControlOfficer( Touch_Down, Atlantis );
         landingComplete := seconds(clock);
         put("Shuttle Atlantis docked in "); put( landingComplete - initiateLandingSequence );
         put(" seconds." ); new_line;
         put("Atlantis leavings its critical section.  Obtain new crew and start next mission.");
         new_line(2);

         C1 := 0;
         Turn := 2;
      end loop;
   end ShuttleAtlantis;

   task ShuttleRanger;
   task body ShuttleRanger is
      initiateLandingSequence: duration;
      landingComplete: duration;
   begin
      for I in 1..10 loop
         C2 := 1;
         delay Duration(Random(randNum) * 15.0);  --Crew boarding and perform mission.
         while C1 = 1 loop
            if Turn = 1 then
               C2 := 0;
               while Turn = 1 loop
                  null;
               end loop;
               C2 := 1;
            end if;
         end loop;
         put("Ranger entering its critical landing section.");  new_line(2);
         initiateLandingSequence:= seconds(clock);
         LandingControlOfficer( Permission_To_Land, Ranger );
         LandingControlOfficer( Call_The_Ball, Ranger );
         delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
         LandingControlOfficer( Touch_Down, Ranger );
         landingComplete := seconds(clock);
         put("Shuttle Ranger docked in "); put( landingComplete - initiateLandingSequence );
         put(" seconds." ); new_line;
         put("Ranger leavings its critical section.  Obtain new crew and start next mission.");
         new_line(2);

         C2 := 0;
         Turn := 1;
      end loop;
   end ShuttleRanger;

begin
   put("Lab1Ver1 Shuttle operations are authorized."); new_line;
   -- Used as a container by the mother ship to launch and recover shuttles.
end Lab1Ver1;
