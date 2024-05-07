**free
///
//
// oefeningen  easi
//
//
// @Program EXERC01
//
// @Purpose -
//
//
      ctl-opt main(btw);

   dcl-proc btw;



   dcl-s bedragEX    packed(15:2) inz(98.98);
   dcl-s btw21       packed(15:0) inz(21);
   dcl-s D100         packed(15:0) inz(100);
   dcl-s stringvar   varchar(50);
   dcl-s bedragINCL      packed(19:2);
   dcl-s waitInput       char(1);

   bedragINCL = %dech(bedragEX / D100 * btw21 + bedragEX : 50 : 2);


   stringvar = %char(bedragEX) + ' euro met ' + %char(btw21) +
    ' procent btw is: ' + %char(bedragINCL);

   dsply stringvar '' waitInput;

   END-PROC;











//
// @author MadelondeGraaff
// @Date Mar 6, 2024
// Copyright (c)
//
// Chtnge Log:
// Tag      Date        User             Description
//
///
 
