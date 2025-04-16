-- cykl_buf.adb
--
-- komunikacja asynchroniczna przez bufor
-- kolejka FIFO
-- Materiały dydaktyczne 
-- 2025 Jacek Piwowarczyk

with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Real_Time;
use Ada.Real_Time;

with Ada.Text_IO, Ada.Numerics.Discrete_Random;

with Ada.Exceptions;
use Ada.Exceptions;

procedure Prod_Kons is
  
	Z: Character;
	B: Boolean;
  Koniec : Boolean := False with Atomic;	

  protected Ekran is
    procedure Pisz(S : String);
    procedure Pisz2(S : String);
  end Ekran;

  protected body Ekran is
    procedure Pisz(S : String) is
    begin
      Put_Line(S);
    end Pisz;
    procedure Pisz2(S : String) is
    begin
      Put(S);
    end Pisz2;
  end Ekran;  
  
-- obiekt chroniony 
protected Buf is
  entry Wstaw(C : Character);
  entry Pobierz(C : out Character);
  private
   Bc : Character;
   Pusty : Boolean := True;
end Buf;

protected body Buf is
  entry Wstaw(C : Character) when Pusty is
  begin
    Bc := C;
    Pusty := False;
  end Wstaw;
  entry Pobierz(C : out Character) when not Pusty is
  begin
    C := Bc;
    Pusty := True;
  end Pobierz;
end Buf;
  
task Producent; 

task body Producent is
  Cl : Character := 's';
  Nastepny : Ada.Real_Time.Time;
  Okres : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(800);
  Przesuniecie : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(10);
  
  subtype Litery is Character range 'a'..'z';
  package Los_Znak is new Ada.Numerics.Discrete_Random(Litery);
  use Los_Znak;
  
  Gen: Generator; -- z pakietu Los_Znak 
begin
  Reset(Gen);
  Nastepny := Ada.Real_Time.Clock + Przesuniecie;
  loop
    delay until Nastepny;
    Cl := Random(Gen);
    Ekran.Pisz("* Zadanie P -> wstawiam znak = " & Cl & "''");
    Buf.Wstaw(Cl);
    Nastepny := Nastepny + Okres;
  exit when Koniec;
  end loop;
Ekran.Pisz("** Koncze zadanie Producent !");
exception
    when E:others => Put_Line("Error: Zadanie Producent");
      Put_Line(Exception_Name (E) & ": " & Exception_Message (E));
end Producent;

task Konsument; 

task body Konsument is
  Cl : Character := ' ';
  Nastepny : Ada.Real_Time.Time;
  Okres : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(800);
  Przesuniecie : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(40);
begin
  Nastepny := Clock + Przesuniecie;
  loop
    delay until Nastepny;
    Buf.Pobierz(Cl);
    Ekran.Pisz("# Zadanie K <- pobralem: znak = '" & Cl & "'");
    Nastepny := Nastepny + Okres;
  exit when Koniec;
  end loop;
Ekran.Pisz("** Koncze zadanie Konsument !");
exception
    when E:others => Put_Line("Error: Zadanie Konsument");
      Put_Line(Exception_Name (E) & ": " & Exception_Message (E));
end Konsument;

begin
  Ekran.Pisz("** Procedura glowana ");
  Ekran.Pisz("** Spacja konczy!");
  loop
  	Get_Immediate(Z, B);
  	if Z = ' ' then Koniec := True;
    end if;
  	exit when Koniec;
  end loop;
  Ekran.Pisz("** Koncze glowny!");
end Prod_Kons;
