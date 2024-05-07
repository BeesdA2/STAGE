**free
///
// @Program EXERC04
//
// @Purpose -
//
      ctl-opt main(tabel);
      ctl-opt option(*SrcStmt:*NoDebugIO);
      dcl-f artcomi01 keyed;

  dcl-proc tabel;

     dcl-s langetext varchar(1000);
     ACARNR = 3003;
     ACLANG = 'NL';
     setll (ACARNR : ACLANG) artcomi01;
     reade (ACARNR : ACLANG) artcomi01;
     dow not %eof(artcomi01);
          langetext += ' ' + %trim(ACTEXT);
       reade (ACARNR : ACLANG) artcomi01;


     ENDDO;

         SND-MSG langetext;

  END-PROC;











// @author MadelondeGraaff
// @Date Mar 12, 2024
// Copyright (c)
//
// Change Log:
// Tag      Date        User             Description
//
///
 
