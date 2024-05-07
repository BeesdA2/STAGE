**free
///
// @Program PARAMETER
//


ctl-opt DFTACTGRP(*NO)
  option(*nodebugio);

Dcl-f PARAMETER WorkStn handler('PROFOUNDUI(HANDLER)')
                      sfile (sfl1:rrn);

// Declare display
dcl-s rrn zoned(5:0);


inzGrid();
filGrid();
contextMenu();

  // scherm 1 laten zien en knoppen laten verwijzen naar procedure
exit1 = *off;
dow exit1 = *OFF;
  Exfmt  scherm1;
  readc sfl1;
   if not %eof;

    if action = 'view';
      fill2b();
    endif;

    if action = 'delete';
      delete2();
    endif;

    if action = 'edit';
      edit2();
    endif;

    endif;

    if btnAdd = *on;
     toevoegen2();
    endif;



enddo;
*inlr = *on;





//// tabel vullen
dcl-proc filGrid;


  RRN = 0;    // toegang voor db2
  sqlcod = 0;  // houd bij of er fouten optreden

  EXEC SQL DECLARE DATA CURSOR FOR
  SELECT PAKEY, PAFILN, PANAME, PAVALUE, PAONOFF, PATYPE, PAINFO FROM IDASPARF;

  EXEC SQL OPEN DATA;
  EXEC SQL FETCH NEXT FROM DATA INTO :ID, :FILIAAL, :NAAM_PA,
   :WAARDE_PA, :AANUIT_PA, :TYPE_PA, :TEXT_PA;



  dow sqlcode = 0;
    rrn += 1;
    write sfl1;
    EXEC SQL FETCH NEXT FROM DATA INTO :ID, :FILIAAL, :NAAM_PA,
    :WAARDE_PA, :AANUIT_PA, :TYPE_PA, :TEXT_PA;
  enddo;



  EXEC SQL CLOSE DATA;



end-proc;





/// context menu opties

dcl-proc contextMenu;

choises = 'bekijken,wijzigen,verwijderen';

end-proc;


///// scherm bekijken

dcl-proc fill2b;

  btnBack = *off;
  dou  btnBack = *on;
    exfmt scherm2b;


  enddo;

end-proc;


////// scherm  verwijderen
dcl-proc delete2;

dou btnBackV = *on or btnDelete = *on;
  exfmt scherm2v;
  if btnDelete = *on;
    EXEC SQL DELETE FROM IDASPARF
    WHERE PAKEY = :ID
    AND PAFILN = :FILIAAL
    AND PANAME = :NAAM_PA;
    inzGrid();
    filGrid();
  endif;

enddo;

end-proc;


///// scherm wijzigen
dcl-proc edit2;

dou btnBackW = *on or btnSave = *on;
  exfmt scherm2W;
  if btnSave = *on;
    EXEC SQL UPDATE IDASPARF
    SET  PAVALUE = :WAARDE_PA, PAONOFF = :AANUIT_PA, PATYPE = :TYPE_PA, PAINFO = :TEXT_PA
    WHERE PAKEY = :ID
    AND PAFILN = :FILIAAL
    AND PANAME = :NAAM_PA;
    inzGrid();
    filGrid();
  endif;


enddo;

end-proc;


//////  scherm toevoegen
   dcl-proc toevoegen2;
     dcl-s newID char(10);
     dcl-s rijCount int(10);

  btnBackT = *off and btnSaveT = *off;
  dou btnBackT = *on or btnSaveT = *on;
    exfmt scherm2T;
    if btnSaveT = *on;

      newID = ID;
    // validatie voor ID
      EXEC SQL
        SELECT COUNT(*)
        INTO :rijCount
        FROM IDASPARF
        WHERE PAKEY = :newID;

      if (rijCount > 0);
        dou btnBackID = *on;
         exfmt message_ID;
         enddo;
      else;
        EXEC SQL
          INSERT INTO IDASPARF (PAKEY, PAFILN, PANAME, PAVALUE, PAONOFF, PATYPE, PAINFO)
          VALUES (:ID, :FILIAAL, :NAAM_PA, :WAARDE_PA, :AANUIT_PA, :TYPE_PA, :TEXT_PA);
        inzGrid();
        filGrid();
      endif;
    endif;
  enddo;
end-proc;


////// gooit de grid leeg

dcl-proc inzGrid;

clearGrid = *ON;
write scherm1;
clearGrid = *OFF;


end-proc;



 