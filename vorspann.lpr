program vorspann;
uses crt;
var x,y, zustand:integer;
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
begin
startAnimation(x,y)

end.

