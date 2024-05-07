**free
///
// @Program EXERC04
//
// @Purpose -
//
      ctl-opt main(tabel);

      dcl-f artcomi01 keyed;

        DCL-PROC TABEL;
           DCL-S MUUS VARCHAR(4);
           DCL-S LANGETEXT VARCHAR(1100);
           ACARNR = 3003;
           ACLANG = 'NL';

           SETLL (ACARNR : ACLANG) ARTCOMI01;
           READE (ACARNR : ACLANG) ARTCOMI01;
           DOW NOT %EOF(ARTCOMI01);
                LANGETEXT += ACTEXT;
             READE (ACARNR : ACLANG) ARTCOMI01;
           ENDDO;








  END-PROC;











// @author MadelondeGraaff
// @Date Mar 12, 2024
// Copyright (c)
//
// Change Log:
// Tag      Date        User             Description
//
///
 
