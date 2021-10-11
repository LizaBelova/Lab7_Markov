program Markov;
{$APPTYPE CONSOLE}
uses SysUtils;
var    str: string;
        st: integer;
procedure pustmarkovprosto;
var temp: boolean;
       i: Integer;
begin
    temp:=true;
        for i:=1 to Length(str)-1 do if (str[i]='(')and(str[i+1]=')') then begin
            Delete(str,i,2);
            st:=1;
            writeln('Status: ',st,', Tape: ',str);
            temp:=false;
        end;
        if temp then begin
                while Length(str)>1 do begin
                    for i:=1 to Length(str)-1 do if (str[i]='(')and(str[i+1]='(') then begin
                    Delete(str,i,1);
                    st:=2;
                    writeln('Status: ',st,', Tape: ',str);
                    //temp:=false;
                    end;
                    for i:=1 to Length(str)-1 do if (str[i]=')')and(str[i+1]=')') then begin
                        Delete(str,i,1);
                        st:=3;
                        writeln('Status: ',st,', Tape: ',str);
                        //temp:=false;
                    end;
                    for i:=1 to Length(str)-1 do if (str[i]=')')and(str[i+1]='(') then begin
                        Delete(str,i,1);
                        st:=3;
                        writeln('Status: ',st,'.5, Tape: ',str);
                        //temp:=false;
                    end;
                end;
                if Length(str)=1 then if str[1]='(' then begin
                    st:=4;
                    str:='WRONG';
                    writeln('Status: ',st,', Tape: ',str);
                    st:=8;
                    writeln('Status: ',st,', Tape: ',str);
                end;
                if Length(str)=1 then if str[1]=')' then begin
                    st:=4;
                    str:='WRONG';
                    writeln('Status: ',st,', Tape: ',str);
                    st:=8;
                    writeln('Status: ',st,', Tape: ',str);
                end;
                if Length(str)=0 then begin
                    st:=6;
                    str:='RIGHT';
                    writeln('Status: ',st,', Tape: ',str);
                    st:=7;
                    writeln('Status: ',st,', Tape: ',str);
                end;
        end;
end;
begin
    read(str);
    st:=0;
    writeln('Status: ',st,', Tape: ',str);
    while st<7 do pustmarkovprosto;
    sleep(10000000);
end.

