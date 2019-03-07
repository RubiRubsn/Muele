Program Muele;
Uses crt;
  var x,y,xf,yf,aktuell,i,help,zustand:Integer;
  var richtung:string;
  var belegt: array[1..24] of integer;

procedure TastenStart (var zustand:integer);
  var key:char;
      begin
          Key:= Readkey;
            Case Key of
            #0: Begin
                Key:= ReadKey;
                  Case Key Of
                    #75 : if zustand <> 0 then zustand:= zustand-1;
                    #77 : if zustand <> 2 then zustand:= zustand+1;
                  end;
                end;
            #13: zustand:=4;
            End;   	
      end;

procedure Muelelogo(var x,y:integer);
    begin
        gotoxy(x,y);
        writeln('      ___           ___           ___           ___       ___    '); 
        gotoxy(x,y+1);
        writeln('     /\__\         /\__\         /\  \         /\__\     /\  \    ');
        gotoxy(x,y+2);
        writeln('    /::|  |       /:/  /        /::\  \       /:/  /    /::\  \   ');
        gotoxy(x,y+3);
        writeln('   /:|:|  |      /:/  /        /:/\:\  \     /:/  /    /:/\:\  \  ');
        gotoxy(x,y+4);
        writeln('  /:/|:|__|__   /:/  /  ___   /::\~\:\  \   /:/  /    /::\~\:\  \ ');
        gotoxy(x,y+5);
        writeln(' /:/ |::::\__\ /:/__/  /\__\ /:/\:\ \:\__\ /:/__/    /:/\:\ \:\__\');
        gotoxy(x,y+6);
        writeln(' \/__/~~/:/  / \:\  \ /:/  / \:\~\:\ \/__/ \:\  \    \:\~\:\ \/__/');
        gotoxy(x,y+7);
        writeln('       /:/  /   \:\  /:/  /   \:\ \:\__\    \:\  \    \:\ \:\__\  ');
        gotoxy(x,y+8);
        writeln('      /:/  /     \:\/:/  /     \:\ \/__/     \:\  \    \:\ \/__/  ');
        gotoxy(x,y+9);
        writeln('     /:/  /       \::/  /       \:\__\        \:\__\    \:\__\    ');
        gotoxy(x,y+10);
        writeln('     \/__/         \/__/         \/__/         \/__/     \/__/    ');
    end;

Procedure startAnimation (var x,y:integer);
    var zaeler:integer;
        begin
            x:=8;
            y:=3;
            clrscr;
            muelelogo(x,y);
            delay(1000);
            y:=y+1;
            clrscr;
            muelelogo(x,y);
            delay(1000);
            y:=y+1;
            clrscr;
            muelelogo(x,y);
            delay(1000);
                repeat 
                    begin
                    zaeler:=zaeler+1;
                        if zaeler=8 then y:=y-1;
                        if zaeler>16 then begin y:=y+1; zaeler:=0; end; 
                        gotoxy(2,1);
                        writeln('test', zaeler);
                        clrscr;
                        muelelogo(x,y);
                        if keypressed then TastenStart(zustand);
                        if zaeler<=7 then y:=y-1;
                        if zaeler>16 then y:=y+1;
                        gotoxy(3,1);
                        Writeln('zaeler:',zaeler);
                        gotoxy(x+12, y+16);
                        Writeln('Singelplayer * Multiplayer * Highscore');
                        case zustand of
                        0: begin gotoxy(x+12,y+17); write('------------'); gotoxy(1,1); end;
                        1: begin gotoxy(x+27,y+17); write('-----------'); gotoxy(1,1);  end;
                        2: begin gotoxy(x+41,y+17); write('---------'); gotoxy(1,1);    end;
                        end;
                        if zaeler<=7 then y:=y+1;
                        if zaeler>16 then y:=y-1;
                        delay(125);
                        
                        
                    end
                until zustand=4;
        end;
procedure steinPrint(var x,y:integer);
  begin
    gotoxy(x-2,y-1); 
    writeln('/¯¯¯\');
    gotoxy(x-2,y);
    writeln('| # |');
    gotoxy(x-2,y+1);
    writeln('\___/');
    textcolor(white)
  end;
procedure positionen(var aktuell,x,y:integer);
  begin
  x:=3;
  y:=3;
    case aktuell of
      1: begin x:=x; y:=y; end;
      2: begin x:=x+31; y:=y; end;
      3: begin x:=x+63; y:=y; end;
      4: begin x:=x+11; y:=y+3; end;
      5: begin x:=x+31; y:=y+3; end;
      6: begin x:=x+52; y:=y+3; end;
      7: begin x:=x+22; y:=y+6; end;
      8: begin x:=x+31; y:=y+6; end;
      9: begin x:=x+41; y:=y+6; end;
      10: begin x:=x; y:=y+9; end;
      11: begin x:=x+11; y:=y+9; end;
      12: begin x:=x+22; y:=y+9; end;
      13: begin x:=x+41; y:=y+9; end;
      14: begin x:=x+52; y:=y+9; end;
      15: begin x:=x+63; y:=y+9; end;
      16: begin x:=x+22; y:=y+12; end;
      17: begin x:=x+31; y:=y+12; end;
      18: begin x:=x+41; y:=y+12; end;
      19: begin x:=x+11; y:=y+15; end;
      20: begin x:=x+31; y:=y+15; end;
      21: begin x:=x+52; y:=y+15; end;
      22: begin x:=x; y:=y+18; end;
      23: begin x:=x+31; y:=y+18; end;
      24: begin x:=x+63; y:=y+18; end;
    end;
  end;
procedure Tasten(var richtung:string);
  var key: char;
    begin
    richtung:='';
      repeat 
        begin
        Key:= Readkey;
          Case Key of
          #0: Begin
              Key:= ReadKey;
                Case Key Of
                  #75 : richtung:='l';
                  #77 : richtung:='r';
                  #72 : richtung:='o';
                  #80 : richtung:='u';
                end;
              end;
          #13: richtung:='enter';
          End;
        End	
      Until richtung<>'';
    end;
procedure positionberechnen (var aktuell:integer; richtung:string);
  begin
    case richtung of
      'r': 
          if aktuell <> 24 then aktuell:=aktuell+1;
      'l':
          if aktuell <> 1 then aktuell:=aktuell-1;
      'o':
          case aktuell of
            5:  aktuell:=2;
            8:  aktuell:=5;
            10: aktuell:=1;
            11: aktuell:=4;
            12: aktuell:=7;
            13: aktuell:=9;
            14: aktuell:=6;
            15: aktuell:=3;
            16: aktuell:=12;
            17: aktuell:=8;
            18: aktuell:=13;
            19: aktuell:=11;
            20: aktuell:=17;
            21: aktuell:=14;
            22: aktuell:=10;
            23: aktuell:=20;
            24: aktuell:=15;
          end;
      'u':
          case aktuell of
            1: aktuell:=10;
            2:  aktuell:=5;
            3:  aktuell:=15;
            4:  aktuell:=11;
            5:  aktuell:=8;
            6:  aktuell:=14;
            7:  aktuell:=12;
            8:  aktuell:=17;
            9:  aktuell:=13;
            10: aktuell:=22;
            11: aktuell:=19;
            12: aktuell:=16;
            13: aktuell:=18;
            14: aktuell:=21;
            15: aktuell:=24;
            17: aktuell:=20;
            20: aktuell:=23;
          end;
      'enter': 
        
          
      end;
  end;
procedure Kreuz (var x,y: integer);
  begin
  Textcolor(red);
    gotoxy(x-1,y-1);
    Writeln('X');
    gotoxy(x+1,y-1);
    writeln('X');
    gotoxy(x,y);
    Writeln('X');
    gotoxy(x-1,y+1);
    Writeln('X');
    gotoxy(x+1,y+1);
    writeln('X');
    Textcolor(white);
  end;

procedure Feld(x,y:integer);
  begin
    gotoxy(x,y);
    Writeln('o------------------------------o-------------------------------o');
    gotoxy(x,y+1);
    Writeln('I                              I                               I');
    gotoxy(x,y+2);
    Writeln('I                              I                               I');
    gotoxy(x,y+3);
    Writeln('I          o-------------------o--------------------o          I');
    gotoxy(x,y+4);
    Writeln('I          I                   I                    I          I');
    gotoxy(x,y+5);
    Writeln('I          I                   I                    I          I');
    gotoxy(x,y+6);
    Writeln('I          I          o--------o---------o          I          I');
    gotoxy(x,y+7);
    Writeln('I          I          I                  I          I          I');
    gotoxy(x,y+8);
    Writeln('I          I          I                  I          I          I');
    gotoxy(x,y+9);
    Writeln('o----------o----------o                  o----------o----------o');
    gotoxy(x,y+10);
    Writeln('I          I          I                  I          I          I');
    gotoxy(x,y+11);
    Writeln('I          I          I                  I          I          I');
    gotoxy(x,y+12);
    Writeln('I          I          o--------o---------o          I          I');
    gotoxy(x,y+13);
    Writeln('I          I                   I                    I          I');
    gotoxy(x,y+14);
    Writeln('I          I                   I                    I          I');
    gotoxy(x,y+15);
    Writeln('I          o-------------------o--------------------o          I');
    gotoxy(x,y+16);
    Writeln('I                              I                               I');
    gotoxy(x,y+17);
    Writeln('I                              I                               I');
    gotoxy(x,y+18);
    Writeln('o------------------------------o-------------------------------o');
  end;

Begin
  startAnimation(x,y);
  clrscr;
  xf:=3;
  yf:=3;
  x:=3;
  y:=3;
  aktuell:=1;
  Feld(xf,yf);

  repeat
    begin
        clrscr;
        Feld(xf,yf);
          begin
            // Positionsberechnung nicht als procedure da pascal keine weitergabe von arrays unterstuetzt
            help:=aktuell;
            for i:=1 to 24 do
              begin
              aktuell:=i;
                case belegt[i] of
                1: begin textcolor(lightblue); positionen(aktuell,x,y); steinPrint(x,y); end;
                2: begin textcolor(green); positionen(aktuell,x,y); steinPrint(x,y); end;
                end;
              end; 
              aktuell:=help;
            end;
        positionen(aktuell,x,y);
        kreuz(x,y);
        Tasten(richtung);
        positionberechnen(aktuell,richtung);
        if richtung='enter' then belegt[aktuell] := 1;
        
      end
    until richtung='enterr';
  readln();
end.
