**free
///
// @Program EXCERC05
//
// @Purpose -

ctl-opt main(TEST);

DCL-PROC TEST;

   dcl-s datefield2   date;
   dcl-s charfield2  char(10);

charfield2 = '20240312';
datefield2 = %date(charfield2 : *iso0);



SND-MSG %char(datefield2);

END-PROC;




// @author MadelondeGraaff
// @Date Mar 14, 2024
// Copyright (c)
//
// Change Log:
// Tag      Date        User             Description
//
///
 
