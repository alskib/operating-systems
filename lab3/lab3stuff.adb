with Ada.Text_IO, Ada.Calendar;
use Ada.Text_IO, Ada.Calendar;
procedure lab3stuff is
   package Duration_IO is new Ada.Text_IO.Fixed_IO(duration); use Duration_IO;

   start : Clock;

begin
   for i in 1..5 loop
      start := Clock;
      Put(seconds(Clock)); new_line;
      delay until start = start + 10.0;

   end loop;

end lab3stuff;
