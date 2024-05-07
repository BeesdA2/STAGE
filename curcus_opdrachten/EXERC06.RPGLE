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

        dcl-pi btw  ;
        bedragEX packed(15:2) const;
        BTW packed(3) const;
        bedragINCL packed(15:2);
        END-PI   ;

   dcl-s D100         packed(15:0) inz(100);


   bedragINCL = %dech(bedragEX / D100 * btw + bedragEX : 50 : 2);



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
 
