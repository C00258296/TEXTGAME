*-----------------------------------------------------------
* Title      :  Text Game
* Written by :  Edward Omorusi 
* Date       :   16/02/2023
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
* Put variables and constants here
START:
    
    BSR     WELCOME    BRANCH TO THE WELCOME SUBROUTINE
       
     
   
*GAME LOOP
    ORG     $3000      THE REST OF THE PROGRAM IS TO BE LOCATED FROM 3000 ONWARDS

*-------------------------------------------------------
*-------------------GAME SUBROUTINE---------------------
*-------------------------------------------------------
GAME:

    RTS                RETURN FROM GAME: SUBROUTINE
          
END:
    SIMHALT

*-------------------------------------------------------
*-------------------WELCOME SUBROUTINE------------------
*-------------------------------------------------------
WELCOME:
    BSR     ENDL            BRANCH TO ENDL SUBROUTINE
    LEA     WELCOME_MSG,A1  ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14,D0          MOVE LITERAL 14 TO DO
    TRAP    #15             TRAP AND INTERPRET VALUE IN D0
   
   
      BSR newLine
      BSR ENTER
      
LOOPGAME
   
    LEA Game_MSG,A1        Moving the Game_MSG to A1 Register
    MOVE.B  #14,D0         Moving 14 into D0 Register
    TRAP    #15
    
 
 

    MOVE.B  #4,D0        Moving 4 into D0 Register
    TRAP    #15       
    CMP.L   #1,D1
    BEQ     GAMEPLAY
    
    BRA  LOOPGAME
    
     
    
    

*-------------------------------------------------------
*---------GAMEPLAY INPUT VALUES SUBROUTINE--------------
*-------------------------------------------------------    
     
    
GAMEPLAY:
    BSR     CLEAR_SCREEN
    BSR     REDTEXT
    LEA     Instructions,A1   Moving the Instructions  to A1 Register

    MOVE.B  #14,D0            Moving 14 into D0 Register
    TRAP    #15               Dislay the message inside #14
    
    MOVE.B  #60, D3           Moving 60 into D0 Register
    BSR     ENTER
    BSR     newLine  
    
    LEA     CLASS  ,A1       Moving the Class to A1 Register
    MOVE.B  #14,D0           Moving 14 into D0 Register
    TRAP    #15              Dislay the message inside #14
    
   BSR  WHITEXT
   BSR  ENTER
   BSR  LOOP                 Calling  Loop
     
   BRA  GAMEPLAY       
   
LOOP:
	LEA	SOLDIER1,A1    Moving the SOLDIER1  to A1 Register
	BSR DISPLAY
	LEA	SOLDIER2,A1    Moving the SOLDIER2  to A1 Register
	BSR DISPLAY
	LEA	SOLDIER3,A1    Moving the SOLDIER2  to A1 Register
	BSR DISPLAY


	
	MOVE.B	#5,D0		; Read keyboard entry and moving 5 into D0 Register
	TRAP	#15         ; Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	    SOL1
	CMP.B	#$32,D1
	BEQ	    SOL2
	CMP.B	#$33,D1
	BEQ	    SOL3

	BNE	ER1
	
SOL1	 LEA CLASS_MSG,A1         Moving the CLASS_MSG  to A1 Register
	     BSR DISPLAY
          BRA	HISTORY1
SOL2	
        LEA	CLASS_MSG2,A1         Moving the CLASS_MSG2  to A1 Register
	    BSR DISPLAY 
	    BRA		HISTORY1
SOL3	
        LEA	CLASS_MSG3,A1          Moving the CLASS_MSG3  to A1 Register
        BSR DISPLAY
	     BRA		HISTORY1

ER1	
    LEA	EMSG,A1                        Moving the error message  to A1 Register
    BSR DISPLAY
	BRA	LOOP


HISTORY1:

     BSR     CLEAR_SCREEN
     BSR     REDTEXT

    LEA HISTORY_MSG,A1                      
    MOVE.B  #14,D0                         Moving 14 into D0 Register
    TRAP    #15                            Dislay the message inside #14

    
     BSR     newLine  


   BSR ENTER
    LEA HISTORY_MSG2,A1
    MOVE.B  #14,D0                         Moving 14 into D0 Register
    TRAP    #15                            Dislay the message inside #14

     BSR     newLine  

   BSR ENTER

    LEA ATTACK_MSG,A1
    MOVE.B  #14,D0                         Moving 14 into D0 Register
    TRAP    #15                            Dislay the message inside #14
 
     BSR     WHITEXT
     BSR     newLine  

      
     BSR   LOOP2 
    
LOOP2	LEA	ATTACK,A1
	    BSR	DISPLAY
	    LEA	ATTACK2,A1
	    BSR	DISPLAY
	    	
	MOVE.B	#5,D0		  Read keyboard entry and moving 5 to D0
	TRAP	#15           Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	DAM
	CMP.B	#$32,D1
	BEQ	DAM2
	BNE	ER1
	
DAM	
	     BRA		HISTORY3
	    
DAM2	
	    BRA	HISTORY3
	    
ER2  	LEA	EMSG,A1     Moving the error message  to A1 Register
	    BSR	DISPLAY
	    BRA	LOOP2
	   
HISTORY3

  BSR     CLEAR_SCREEN 
  BSR  REDTEXT
  
    LEA     HISTORY_MSG3 ,A1
    MOVE.B  #14,D0                Moving 14 into D0 Register
    TRAP    #15                   Dislay the message inside #14

    
    BSR ENTER
    BSR   newLine   
    
    LEA     HMSG,A1
    MOVE.B  #14,D0               Moving 14 into D0 Register
    TRAP    #15                  Dislay the message inside #14

    BSR WHITEXT
    BSR ENTER
    BSR   newLine   

    
   LEA HISTORY_MSG4 ,A1
   MOVE.B  #14,D0                Moving 14 into D0 Register
   TRAP    #15                   Dislay the message inside #14

  
   BSR ENTER
   BSR   newLine 
   
   
   LEA NAME_MSG ,A1
   MOVE.B  #14,D0                Moving 14 into D0 Register
   TRAP    #15                   Dislay the message inside #14
   BSR	WHITEXT
   
   MOVE.B	#2,D0		; name input and moving  2 into D0
   LEA	NAME,A1
   TRAP	#15              Dislay the message inside #14

   
   MOVE.B  #14,D0          Moving 14 into D0 Register
   TRAP    #15            Dislay the message inside #14

  BSR REDTEXT
   
   LEA HISTORY_MSG5 ,A1
   MOVE.B  #14,D0            Moving 14 into D0 Register
   TRAP    #15               Dislay the message inside #14

     BSR WHITEXT
     BSR LOOP3
   
LOOP3	
         BSR ENTER

        LEA	HAPPY_MSG,A1
	    BSR	DISPLAY
	    LEA	RUDE,A1
	    BSR	DISPLAY
	
	MOVE.B	#5,D0		Read keyboard entry and moving  5 into D0
	TRAP	#15         Dislay the message inside #14
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	HAPPY
	CMP.B	#$32,D1
	BEQ	RUDE1
	BNE	ER3
	
HAPPY	LEA	 NICEMSG,A1
	BSR	DISPLAY
	BRA	HISTORY4
RUDE1	LEA  RUDE_MSG,A1
	BSR	DISPLAY
	BRA	HISTORY4
ER3	LEA	EMSG,A1    Moving the error message  to A1 Register
	BSR	DISPLAY
	BRA	LOOP3
 
HISTORY4:
   BSR ENTER
   BSR   newLine
   BSR REDTEXT 
    
   LEA HISTORY_MSG6 ,A1
   MOVE.B  #14,D0               Moving 14 into D0 Register
   TRAP    #15                   Dislay the message inside #14

   
   BSR ENTER

   BSR WHITEXT
   BSR LOOP4
   
    
LOOP4      BSR ENTER
	
        LEA	LAND,A1
	    BSR	DISPLAY
	    LEA	LAND2,A1
	    BSR	DISPLAY
	
	MOVE.B	#5,D0	     Read keyboard entry and moving  5 into D0
	TRAP	#15          Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ  	LAN
	CMP.B	#$32,D1
	BEQ 	LAN2
	BNE	    ER4
	
LAN	LEA	LANDRESPONDE,A1
	BSR	DISPLAY
	BRA HISTORY5
	
LAN2	LEA	LANDRESPONDE2,A1
	    BSR	DISPLAY
		BRA	HISTORY5
		
ER4	LEA	EMSG,A1       Moving the error message  to A1 Register
	BSR	DISPLAY
	BRA	LOOP4

 
   
HISTORY5
  BSR ENTER
  BSR REDTEXT
    
 LEA HISTORY_MSG7 ,A1          Moving History_MSG7 into  A1
 MOVE.B    #14,D0              Moving 14 into D0 Register
 TRAP      #15                 Dislay the message inside #14

  
  BSR ENTER
  BSR LOOP5
  BSR WHITEXT
  
LOOP5	LEA	OCCUPIEDMSG,A1       Moving OCCUPIEDMSG into A1
	    BSR	DISPLAY
	    LEA	RUDEMSG,A1
	    BSR	DISPLAY
	
	MOVE.B	#5,D0		 Read keyboard entry
	TRAP	#15          Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	OCCU
	CMP.B	#$32,D1
	BEQ	RUDE2
	BNE	ER5
	
OCCU      LEA RESPONDE2,A1
	      BSR	DISPLAY
	      BSR	HISTORY6
	      
RUDE2   	LEA	RESPONDE1,A1
	        BSR	DISPLAY
		    BSR	HISTORY6

ER5	     LEA	EMSG,A1    Moving the error message  to A1 Register
	     BSR	DISPLAY
	     BRA	LOOP5


HISTORY6

  BSR ENTER
  BSR  newLine 
  BSR  REDTEXT

  LEA HISTORY_MSG8 ,A1
 MOVE.B    #14,D0           Moving 14 into D0 Register
 TRAP      #15              Dislay the message inside #14

 
  BSR ENTER


 LEA HISTORY_MSG9 ,A1
 MOVE.B    #14,D0           Moving 14 into D0 Register
 TRAP      #15              Dislay the message inside #14

 
   BSR ENTER

 
 LEA MEALS ,A1 
 MOVE.B    #14,D0          Moving 14 into D0 Register
 TRAP      #15             Dislay the message inside #14
 
 BSR WHITEXT
 BSR ENTER
 BSR LOOP6
 
LOOP6
    	LEA	MEAL1,A1
	    BSR	DISPLAY
	    LEA	MEAL2,A1
	    BSR	DISPLAY
	    LEA	MEAL3,A1
	    BSR	DISPLAY

	
	MOVE.B	#5,D0		; Read keyboard entry and moving 5 into d0
	TRAP	#15         Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	APO1
	CMP.B	#$32,D1
	BEQ	APO2
	CMP.B	#$33,D1
	BEQ	LIKE

	BNE	ER6 
APO1	LEA	APOLIGISE1 ,A1   
	    BSR	DISPLAY
	    BRA	HISTORY7
APO2	LEA	APOLIGISE2  ,A1
	    BSR	DISPLAY
	    BRA	HISTORY7
LIKE 	LEA	LIKEMSG  ,A1
	    BSR	DISPLAY
	    BRA	HISTORY7



ER6 	LEA	EMSG,A1      Moving the error message  to A1 Register MOVING
	    BSR	DISPLAY
	    BRA	LOOP6
	    
	    
HISTORY7
   BSR ENTER
   BSR newLine 
   BSR REDTEXT
 LEA HISTORY_MSG10 ,A1
 MOVE.B    #14,D0          Moving 14 into D0 Register
 TRAP      #15             Dislay the message inside #14

 BSR WHITEXT
 BSR LOOP7

LOOP7   BSR ENTER
     	LEA	DESERT1,A1
	    BSR	DISPLAY
	    LEA	DESERT2,A1
	    BSR	DISPLAY
	    LEA DESERT3,A1
	    BSR DISPLAY
	
	MOVE.B	#5,D0		; Read keyboard entry and moving 5 into do register
	TRAP	#15         Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	DESER
	CMP.B	#$32,D1
	BEQ	DESER2
	CMP.B	#$33,D1
	BEQ	DESER3

	BNE	ER6
	 
DESER     BSR ENTER     Moving the error message  to A1 Register	     
	      LEA DESERTBADLUCK,A1
	      BSR DISPLAY
	      BRA	HISTORY_MSG11
	      
DESER2	BSR ENTER 
 	    LEA DESERTBADLUCK,A1
	    BSR DISPLAY
		BRA	HISTORY8
		
		
DESER3  BSR ENTER
        LEA LIKEFRUITS ,A1
	    BSR	DISPLAY
		BRA	HISTORY8

ER7	LEA	EMSG,A1    Moving the error message  to A1 Register
	BSR	DISPLAY
	BRA	LOOP7

HISTORY8

   BSR  CLEAR_SCREEN
   BSR    REDTEXT
   
 LEA HISTORY_MSG11 , A1
 MOVE.B    #14,D0        Moving 14 into D0 Register
 TRAP      #15           Dislay the message inside #14



  BSR ENTER
  
 LEA HISTORY_MSG12, A1
 MOVE.B    #14,D0        Moving 14 into D0 Register
 TRAP      #15           Dislay the message inside #14


  BSR ENTER

 LEA HISTORY_MSG13,A1
 MOVE.B      #14,D0         Moving 14 into D0 Register
 TRAP        #15            Dislay the message inside #14

 BSR WHITEXT
 BSR BATTLE
 
BATTLE	LEA	ATTACK,A1
	    BSR	DISPLAY
	    LEA	ATTACK2,A1
	    BSR	DISPLAY
	   
	
	MOVE.B	#5,D0		; Read keyboard entry and moving 5 into D0 register
	TRAP	#15         Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	DAMA
	CMP.B	#$32,D1
	BEQ	DAMA2
	BNE	ERBATTLE
	
DAMA	LEA	DAMA_MSG,A1
	    BSR	DISPLAY
	    BRA	FINALHISTORY
	    
DAMA2	LEA	DAMA_MSG2,A1
	    BSR	DISPLAY
	    BRA	FINALHISTORY

ERBATTLE  	LEA	EMSG,A1      Moving the error message  to A1 Register
	        BSR	DISPLAY
	        BRA	FINALHISTORY
	   
	   
FINALHISTORY

 BSR REDTEXT
 BSR CLEAR_SCREEN
 
 
 LEA HISTORY_MSG15,A1
 MOVE.B      #14,D0          Moving 14 into D0 Register
 TRAP        #15             Dislay the message inside #14

 BSR WHITEXT
 BSR FINAL
 
FINAL	LEA	SAVEME,A1
	    BSR	DISPLAY
	    LEA	SAVEHIM,A1
	    BSR	DISPLAY
	   
	
	MOVE.B	#5,D0		; Read keyboard entry and moving  5 to D0 register
	TRAP	#15          Dislay the message inside #14

	
	BSR	NEWLINE
	CMP.B	#$31,D1
	BEQ	FINAL_1
	CMP.B	#$32,D1
	BEQ	FINAL_2
	BNE	ERFINAL
	
FINAL_1	LEA FINAL1,A1     Moving DAMA_MSG into A1 register
	    BSR	DISPLAY
	    BSR ENTER
	    BRA DONE
	    
FINAL_2	LEA	FINAL2,A1      Moving DAMA_MSG2 into A1 register
	    BSR	DISPLAY
	    BSR ENTER
	    BRA DONE


ERFINAL  	LEA	EMSG,A1        Moving the error message  to A1 Register
	        BSR	DISPLAY
	        BRA	FINAL

 

DONE:    
    MOVE.B  #4,D0      Move 4 to D0 register
    TRAP    #15

CLEAR_SCREEN: 
    MOVE.B  #11,D0      CLEAR SCREEN
    MOVE.W  #$FF00,D1
    TRAP    #15
    RTS
    
ENDL:
    MOVEM.L D0/A1,-(A7)
    MOVE    #14,D0
    LEA     CRLF,A1
    TRAP    #15
    MOVEM.L (A7)+,D0/A1
    RTS
    
newLine	

    MOVEM.L	D0/A1,-(A7)   divide do and a1 and after subtract a7
	MOVE	#14,D0
	LEA	crlf,A1
	TRAP	#15
	MOVEM.L	(A7)+,D0/A1   add a7 after d0 and a1 is divided
	RTS
ENTER	
    MOVE.B	#2,D0
	TRAP	#15
	RTS
	
DISPLAY	
   MOVE	#14,D0
	TRAP	#15
	MOVEM.L	D0/A1,-(A7)
	MOVE	#14,D0
	LEA	crlf,A1
	TRAP	#15
	MOVEM.L	(A7)+,D0/A1
	RTS	
	
REDTEXT	MOVE.L	#RED,D1
	MOVE.B	#21,D0
	TRAP	#15
	RTS
	
WHITEXT	
    MOVE.L	#WHITE,D1
	MOVE.B	#21,D0
	TRAP	#15
	RTS


;HISTORY MESSAGES
crlf	DC.B	$d,$a,0
WELCOME_MSG:    DC.B    '************************************************************'
                DC.B    $0D,$0A
                DC.B                         'Welcome to Humans vs Zombies'
                DC.B    $0D,$0A
                DC.B    '************************************************************'
                DC.B    $0D,$0A,0
Instructions:   DC.B   'Welcome to  Humans vs Zombies,we have been in this war agasint the zombies'
                DC.B    $0D,$0A
                DC.B   'for the last 4 years already we have try everything to win agaisnt them '
                DC.B    $0D,$0A
                DC.B   'we have lost a lot of lifes in this war but you,'
                DC.B    $0D,$0A
                DC.B   'i think that we your strenght will be able to win!! '
                DC.B    $0D,$0A,0
Game_MSG:       DC.B   'Press 1 to play the game ',0
Game1_MSG:      DC.B   'Press 1 to continue ',0
ERROR_MSG:      DC.B   'Please enter a 1 to play the game ',0
CLASS:          DC.B   'Choose one ofthis  weapons available:',0           
HISTORY_MSG     DC.B   'After Choosing your weapon you and a group of soldiers are going to a mission'
                DC.B    $0D,$0A
                DC.B   'to eleminated a group of zombies that are attacking a village near us.'
                DC.B     $0D,$0A,0
HISTORY_MSG2    DC.B   'You arrived to the village where the zombies are attacking '
                DC.B    $0D,$0A
                DC.B   ',seems that they have seen you are they are coming to you to attack you '
                DC.B    $0D,$0A,0
ATTACK_MSG      DC.B   'Options :'
HISTORY_MSG3    DC.B   'Well done after killing that zombies , go and check that'
                DC.B    $0D,$0A
                DC.B   'the people are safe and make sure that you try to help them'
                DC.B    $0D,$0A
                DC.B   'in anything that you can do '
                DC.B      $0D,$0A,0
HISTORY_MSG4    DC.B   'We appreciate your protecting us because we were afraid of those zombies. ',0
NAME_MSG        DC.B   'Sorry I didnt ask you our name. What is your name  ??? --->',0
HISTORY_MSG5    DC.B   '? Ohh I am Jeremy, and these are my friends Peter and Jack.'
                DC.B     $0D,$0A
                DC.B   'Ok, nice to meet you '
                DC.B       $0D,$0A,0
RUDE_MSG        DC.B   'Ooh, you look rude.',0
NICEMSG         DC.B   'I ll try my best to remember your name.',0
HISTORY_MSG6    DC.B   'So,with this first battle against the zombies,we have been having a difficult time.'
                DC.B     $0D,$0A
                DC.B   'It appears that we have lost a lot of soldiers in this fight '
                DC.B     $0D,$0A
                DC.B   'and I am unsure of the source of our new recruits. '
                DC.B     $0D,$0A
                DC.B   ' where are you from? ' 
                DC.B     $0D,$0A,0
LANDRESPONDE    DC.B   'You are a brave soldier to come to this war from a far land.',0 
LANDRESPONDE2   DC.B   'Damn, it appears that we are Kidnapping for individuals hahahha.',0
HISTORY_MSG7    DC.B   'With all the zombies about,I will let you focus on your work since you look occupied.',0
RESPONDE1       DC.B   'You are so rude , bro ',0
RESPONDE2       DC.B   'Good luck !!! ',0
HISTORY_MSG8    DC.B   'Later on the  soldiers are regrouping after killing all zombies from the village '
                DC.B       $0D,$0A
                DC.B   'and they went to the base where they live. '
                DC.B     $0D,$0A,0
HISTORY_MSG9    DC.B   'When the soldiers arrive they went to have their dinner.There were three meal alternatives '
                DC.B     $0D,$0A
                DC.B   'available in the soldiers home, where all the soldiers receive nourishment. '
                DC.B     $0D,$0A,0
APOLIGISE1      DC.B   'We are sorry, but we are out of spaghetti. We just have broccoli for now. ' ,0
APOLIGISE2      DC.B   'We are sorry  but we are out lasagna and chips. All we have is fish and broccoli. ' ,0
BADLUCKMSG      DC.B   'What terrible luck I have had.',0
LIKEMSG         DC.B   'I do like broccoli!!!! ',0
HISTORY_MSG10   DC.B   'After the mean there was some desert for the soldiers after digesting their dinner. ',0
DESERTSMSG      DC.B   'We only have fruits and less vanilla ice cream. ',0
DESERTSMSG2     DC.B   'We only have fruits and less chocolate ice cream.  ',0
DESERTBADLUCK   DC.B   'Today is not my day ... ',0
LIKEFRUITS      DC.B   'Like Bananas !!! ',0
HISTORY_MSG11   DC.B   'All of the soldiers they went to their are bed after eating dinner '
                DC.B      $0D,$0A
                DC.B   'because they would need to wake up early for the upcoming mission. '
                DC.B     $0D,$0A,0      
HISTORY_MSG12   DC.B   'The next day the wake up and they started preparing their self for the missions of that days.'
                DC.B    $0D,$0A
                DC.B   'they got a nice healthy breakfast to get energy for the day.After that they were talking about'
                DC.B     $0D,$0A
                DC.B   'the mission for that day and it was to rescute some civilias from the enemy area  '
                DC.B    $0D,$0A
                DC.B   'that they were abducted by the zombies and if we dont go there quick they will die'
                DC.B    $0D,$0A,0
HMSG            DC.B   'After that the soldiers went to the village to try to help in anything that they can,'
                DC.B     $0D,$0A
                DC.B   'they where talking  with the people of that village and a group of three people comes'
                DC.B     $0D,$0A
                DC.B   'to you , seems that they want to talk to you.'
                DC.B      $0D,$0A,0
HISTORY_MSG13   DC.B   'They went to the enemey area.they were waiting to begin the mission when one member of you team'
                DC.B     $0D,$0A
                DC.B   'have make noise  and the zombies are coming to you Get Ready to fight agaisnt them!!!'
                DC.B    $0D,$0A,0
DAMA_MSG        DC.B   ' You have kill the zombies but one of them are hurts you! ',0
DAMA_MSG2       DC.B   'When you were trowhing the grenade it have damaged you a bit ' ,0
HISTORY_MSG15   DC.B   'After killing the zombies you have found the civilias that they were abducted by the zombies ,'
                DC.B     $0D,$0A
                DC.B   ' you see that one of that persons are hurt in the ribs , the person is in pain right now but'
                DC.B     $0D,$0A
                DC.B   ' you are also in pain because of the battle that you just hab against the zombies and you '
                DC.B     $0D,$0A
                DC.B   ' only have some bandage with you. '    
                DC.B     $0D,$0A,0
SAVE_MSG        DC.B   ' Choose one of this options ',0
FINAL1          DC.B   ' You have choose to same your life , so the person die after 10 minutes due is ribs injury , '
                DC.B    $0D,$0A
                DC.B   ' after coming back to the base  , the people  that you saved  in the enemy base  ' 
                DC.B    $0D,$0A
                DC.B   ' started talking to every residents  of the village about it what you did '
                DC.B    $0D,$0A
                DC.B    ' leaving a person die and after a while this  affected your soldier status.'
                DC.B    $0D,$0A
                DC.B   ' YOU LOST THE GAME :( !! ' 
                DC.B    $0D,$0A ,0             
FINAL2          DC.B   ' You have choosed to save the life of the person injured , you use the bandage left in him '
                DC.B    $0D,$0A
                DC.B   ' so bringed the people back to is village. The residents of the village started to talk well'
                DC.B    $0D,$0A
                DC.B   ' about you and this affected your soldier status positively . '
                DC.B    $0D,$0A
                DC.B   ' YOU PASS THE GAME:) !! '
                DC.B    $0D,$0A,0
NAME	DS.B	80
EMSG	DC.B	'Key entered not recognized try again',0    

; Game Options     
SOLDIER1        DC.B   '1 Sword and two  grenade',0
SOLDIER2        DC.B   '2 Gun  and  two  grenade',0
SOLDIER3        DC.B   '3 Stick and two  grenade',0
DESERTS         DC.B    ' Options : ' ,0
DESERT1         DC.B    ' 1) vanilla ice cream cone',0 
DESERT2         DC.B    ' 2) chocolate ice creams ',0 
DESERT3         DC.B    ' 3) Bananas ' ,0
MEALS           DC.B    '  Choose a option :' ,0 
MEAL1           DC.B    ' 1) Pasta dish with cheese and tomato with beef ',0
MEAL2           DC.B    ' 2) Chips and lasagna ',0 
MEAL3           DC.B    ' 3) Fish and broccoli' ,0
OCCUPIEDMSG     DC.B    ' 1)Thanks very much! ' ,0
RUDEMSG         DC.B    ' 2)Please dont waste my time, thanks  ',0
LAND            DC.B    ' 1) I am from a distant land, far from here.',0
LAND2           DC.B    ' 2) I dont even know how I arrive here !! ',0
HAPPY_MSG       DC.B    ' 1) Iam happy to meet you ',0
RUDE            DC.B    ' 2)I simply worry about finishing my work; I don t care about your names.',0
ATTACK          DC.B    ' 1) Attack with the sword ',0
ATTACK2         DC.B    ' 2) throw a grenade  ',0
SAVEME          DC.B    ' 1) Im going to uses this bandage in me sorry',0
SAVEHIM         DC.B    ' 2) Come im going to uses this bandage in you do not move',0
CLASS_MSG       DC.B   'You look scary with that sword ',0
CLASS_MSG2      DC.B   'You a good with that gun on you!! ',0 
CLASS_MSG3      DC.B   'You look scary!!!!!'     

;COLOURS
RED	EQU	$000000FF
WHITE	EQU	$00FFFFFF






    END    START        ; last line of source





















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
