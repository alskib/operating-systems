with Ada.Text_IO; use Ada.Text_IO;
with Lab1Ver2;  use Lab1Ver2;
procedure Lab1Ver2Use is

   shuttle1: Shuttle1(Atlantis);  -- Compile time allocation.
   shuttle2: Shuttle2(Ranger);
   --shuttle3: ShuttlePointer := new Shuttle( MeanMachine ); -- Runtime allocation


begin
    put("Lab1ver2use Shuttle operations are authorized."); new_line;
    -- Used as a container by the mother ship to launch and recover shuttles.
end Lab1Ver2Use;
