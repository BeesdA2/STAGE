**free
///
// @Program EXERC02
//


       ctl-opt main(werkplek);



  dcl-proc werkplek;


   dcl-s i   packed(1);
   dcl-s stringvar   varchar(50);
   dcl-s waitInput       char(1);


   // 25 gedeelt door 50 X 100

   dcl-ds week qualified dim(7);
     dag        char(10);
     aantalPlek packed(4);
     aantalPers packed(4);
     bezet      packed(4);

   END-DS;

    week(1).dag = 'Maandag';
    week(2).dag = 'Dinsdag';
    week(3).dag = 'Woensdag';
    week(4).dag = 'Donderdag';
    week(5).dag = 'Vrijdag';
    week(6).dag = 'Zaterdag';
    week(7).dag = 'Zondag';

    week(1).aantalPlek = 50;
    week(2).aantalPlek = 10;
    week(3).aantalPlek = 0;
    week(4).aantalPlek = 5;
    week(5).aantalPlek = 1;
    week(6).aantalPlek = 0;
    week(7).aantalPlek = 0;

    week(1).aantalPers = 25;
    week(2).aantalPers = 10;
    week(3).aantalPers = 2;
    week(4).aantalPers = 3;
    week(5).aantalPers = 2;
    week(6).aantalPers = 0;
    week(7).aantalPers = 0;




    FOR i = 1 TO 7;
      stringvar = week(i).dag;
      dsply stringvar '' waitInput;
      IF week(i).aantalPlek = 0;
       week(i).bezet = 100;
      ELSE;
       week(i).bezet = week(i).aantalPers / week(i).aantalPlek * 100;
      ENDIF;

    if week(i).bezet > 100;
         week(i).bezet = 100;
         endif;
      stringvar = %char(week(i).bezet);
      dsply stringvar '' waitInput;
        // Loop body goes here
    ENDFOR;



  END-PROC;









// @author MadelondeGraaff
// @Date Mar 7, 2024
// Copyright (c)
//
// Change Log:
// Tag      Date        User             Description
//
///
 
