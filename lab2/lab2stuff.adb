with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
procedure lab2stuff is
   -- definitions
   package Duration_IO is new Ada.Text_IO.Fixed_IO(duration);  use Duration_IO;
   package integerIO is new Ada.Text_IO.Integer_IO(integer); use integerIO;

   randNum: Generator;  -- used to generate 0.0 <= random numbers <1.0.

   type RequestType is (Permission_To_Land, Call_The_Ball, Touch_Down);
   type ShuttleNameType is (Atlantis, Challenger, Ranger, MeanMachine);
   type OfficerNameType is (Ace, Brycin, Cyder, Jantzen, Macen, Ryo, Vegas);

   package ShuttleNameIO is new Ada.Text_IO.Enumeration_IO(ShuttleNameType);
   use ShuttleNameIO;


   task type LandingControlOfficer is
   end LandingControlOfficer;

   task body LandingControlOfficer is

   begin
	Put("Landing Officer output."); new_line;
   end LandingControlOfficer;




   task Shuttle;
   task body Shuttle is
   begin
      for I in 1..5 loop
         Put("Shuttle, loop: "); Put(I); new_line;
      end loop;
   end Shuttle;


begin
   put("Lab2 shuttle operations are authorized."); new_line;
end lab2stuff;
