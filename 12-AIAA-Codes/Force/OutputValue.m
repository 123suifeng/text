       
fileID = fopen(TXT_Path,'w');
fprintf(fileID,'%s %d\r\n','Realn2_Initial',Realn2(1));
fprintf(fileID,'%s %d\r\n','Realn2_Final',Realn2(Num));
fprintf(fileID,'%s %d\r\n','FinalN3_Initial',FinalN3(1));
fprintf(fileID,'%s %d\r\n','FinalN3_Final',FinalN3(Num));
fprintf(fileID,'%s %d\r\n','Transfer_Line_Initial',Data(1));
fprintf(fileID,'%s %d\r\n','Transfer_Line_Final',Data(Num));
fprintf(fileID,'%s %d\r\n','Transfer_Triangle_Initial',Transfer_Triangle(1));
fprintf(fileID,'%s %d\r\n','Transfer_Triangle_Final',Transfer_Triangle(Num));
fprintf(fileID,'%s %d\r\n','Remain_Couples_Initial',Remain_Couples(1));
fprintf(fileID,'%s %d\r\n','Remain_Couples_Final',Remain_Couples(Num));
fprintf(fileID,'%s %d\r\n','Remain_Thrusters_Initial',Remain_Thrusters(1));
fprintf(fileID,'%s %d\r\n','Remain_Thrusters_Final',Remain_Thrusters(Num));
fclose(fileID);






