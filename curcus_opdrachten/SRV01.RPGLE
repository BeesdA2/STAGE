**free


ctl-opt nomain;

dcl-proc srv01_berekenBedragBtw export;


  dcl-pi srv01_berekenBedragBtw packed(10:2)  ;
    bedragEX packed(10:2) const;
    BTW packed(10:2) const;
  END-PI;

  dcl-s  bedragINCL packed(10:2);


  bedragINCL = %dech(bedragEX / 100 * btw + bedragEX : 50 : 2);


             return bedragINCL;

END-PROC; 
