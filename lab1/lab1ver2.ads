with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
package Lab1Ver2 is
    -- definitions
   package Duration_IO is new Ada.Text_IO.Fixed_IO(duration);  use Duration_IO;
   package integerIO is new Ada.Text_IO.Integer_IO(integer); use integerIO;

   type RequestType is (Permission_To_Land, Call_The_Ball, Touch_Down);
   type ShuttleNameType is (Atlantis, Challenger, Ranger, MeanMachine);

   package ShuttleNameIO is new Ada.Text_IO.Enumeration_IO(ShuttleNameType);
   use ShuttleNameIO;

   -- This entire procedure represents a critical resource where access must be controlled.
   procedure LandingControlOfficer( Request: in RequestType; Shuttle: in ShuttleNameType);

    -- Create shuttles;
   task type Shuttle1( shuttleName: ShuttleNameType);
   task type Shuttle2( shuttleName: ShuttleNameType);
   --type ShuttlePointer is access Shuttle;

end Lab1Ver2;
