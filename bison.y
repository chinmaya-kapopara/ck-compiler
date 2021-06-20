{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 CourierNewPSMT;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 \expnd0\expndtw0\kerning0
%\{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include "math.h"
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include "stdio.h"
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include "string.h"
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include "stdlib.h"
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include \'93header.h\'94
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 int yylex();
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 void yyerror(const char *s);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 extern treenode *table;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 treenode *makeNode();
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 int t;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 int count=1;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 int count2=1;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 char tempReg[5];
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %union
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	int itype;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	float ftype;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	char ctype;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	struct expnode *eval;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \};
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 %token IF ELSE MAIN MOD EQ NOT_EQ LE_EQ GE_EQ LE GE AND OR NOT XOR WHILE FOR INCR DECR RET VOID
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %token <eval> NUM FNUM CNUM ID\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %type <eval> E F F1 S SS BLK LIST LIST2 DEC DEC2 COND IFST IFST2 WHILEST FORST RETST FUN FUN2 UDFUN MAINFUN PAR PAR2 PAR3 PAR4 FUNCALL
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %token <itype> INT
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %type <itype> DT
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 %left '^'
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %left '+' '-'
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %left '/' '*'
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %left '(' ')'
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %%
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 PROG : FUN \{printf("\\n---Assembly Code---\\n\\n%s\\n",$1->code);exit(0);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 FUN\'a0 : FUN2 MAINFUN \{$$=makeNode();sprintf($$->code,"%s%s",$2->code,$1->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 FUN2 : FUN2 UDFUN \{$$=makeNode();sprintf($$->code,"%s%s",$1->code,$2->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 |	 		\'a0 \{$$=makeNode();sprintf($$->code,"");\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 MAINFUN: DT MAIN '(' ')' '\{' SS RETST '\}' \{$$=$6;sprintf($$->code,"%sHLT\\n",$$->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 UDFUN : DT ID 	\{$2->type=4;sprintf(tempReg,"R%d",count++);\} '(' PAR ')' '\{' SS RETST '\}' \{$$=makeNode();sprintf($$->name,"%s",tempReg);sprintf($$->code,"%s PROC NEAR\\nPOP %s\\n%s%s%sPUSH %s\\nRET\\n%s ENDP\\n",$2->varname,$$->name,$5->code,$8->code,$9->code,$$->name,$2->varname);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\'a0 | VOID ID \{$2->type=5;sprintf(tempReg,"R%d",count++);\} '(' PAR ')' BLK \{$$=makeNode();sprintf($$->name,"%s",tempReg);sprintf($$->code,"%s PROC NEAR\\nPOP %s\\n%s%sPUSH %s\\nRET\\n%s ENDP\\n",$2->varname,$$->name,$5->code,$7->code,$$->name,$2->varname);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\'a0 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 RETST : RET E '~' \{$$=makeNode();sprintf($$->code,"PUSH %s\\n",$2->varname);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 PAR : PAR2 \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	| 	 \'a0 \{$$=makeNode();sprintf($$->code,"");\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 PAR2 : PAR2 ',' DEC2 \{$$=makeNode();sprintf($$->name,"R%d",count++);sprintf($$->code,"%sPOP %s\\nMOV %s,%s\\n",$1->code,$$->name,$3->name,$$->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 | 			DEC2 \{$$=makeNode();sprintf($$->name,"R%d",count++);sprintf($$->code,"POP %s\\nMOV %s,%s\\n",$$->name,$1->name,$$->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 BLK : '\{' SS '\}' \{$$=$2;\}	
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 SS : SS S \{$$=makeNode();sprintf($$->code,"%s%s",$1->code,$2->code);\}\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| S\'a0 \'a0 \{$$=$1;sprintf($$->code,"%s",$1->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 S\'a0 : DEC '~' \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| F '~'	\{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| IFST \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| WHILEST \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| FORST \{$$=$1;\}	
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| FUNCALL '~' \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 DEC : DT \{t = $1;\} LIST \{$$=makeNode();sprintf($$->code,"");sprintf($$->name,"%s",$3->name);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 DEC2 : DT \{t = $1;\} LIST2 \{$$=makeNode();sprintf($$->code,"");sprintf($$->name,"%s",$3->name);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 LIST2 : ID	\{$$=makeNode();if($1->type != -1) \{printf("Error: variable %s is redeclared\\n", $1->varname); exit(0);\} else \{$1->type = t;sprintf($$->name,"%s",$1->varname);\}\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\'a0 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 DT : INT \{$$ = 2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 LIST : LIST ',' ID \'a0 \{$$=makeNode();if($3->type != -1) \{printf("Error: variable %s is redeclared\\n", $3->varname); exit(0);\} else \{$3->type = t;\}\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0| ID			 \{$$=makeNode();if($1->type != -1) \{printf("Error: variable %s is redeclared\\n", $1->varname); exit(0);\} else \{$1->type = t;sprintf($$->name,"%s",$1->varname);\}\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 F : F1 		 \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| ID INCR\'a0 \{$$=makeNode();sprintf($$->name,"R%d",count++);sprintf($$->code,"MOV %s,%s\\nINC %s\\nMOV %s,%s\\n",$$->name,$1->varname,$$->name,$1->varname,$$->name);count--;\}\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| ID DECR\'a0 \{$$=makeNode();sprintf($$->name,"R%d",count++);sprintf($$->code,"MOV %s,%s\\nDEC %s\\nMOV %s,%s\\n",$$->name,$1->varname,$$->name,$1->varname,$$->name);count--;\}\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 F1 : ID '=' F1	\{$$=makeNode();sprintf($$->code,"%sMOV %s,%s\\n",$3->code,$1->varname,$3->name);count--;\}\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0| E		\'a0 \'a0 	\{$$=$1;\}\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 E : '(' E ')' \'a0 \'a0 \{$$=makeNode();sprintf($$->name,"%s",$2->name);sprintf($$->code,"%s",$2->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E '+' E \'a0 \'a0 \'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%sADD %s,%s\\n",$1->code,$3->code,$1->name,$3->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E '-' E \'a0 \'a0 \'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%sSUB %s,%s\\n",$1->code,$3->code,$1->name,$3->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E '*' E \'a0 \'a0 \'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%s",$1->code,$3->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"AX")!=0)sprintf($$->code,"%sPUSH AX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"BX")!=0)sprintf($$->code,"%sPUSH BX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"DX")!=0)sprintf($$->code,"%sPUSH DX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0sprintf($$->code,"%sMOV AX,%s\\nMOV BX,%s\\nMUL BX\\nMOV %s,AX\\n",$$->code,$1->name,$3->name,$1->name);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"DX")!=0)sprintf($$->code,"%sPOP DX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"BX")!=0)sprintf($$->code,"%sPOP BX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"AX")!=0)sprintf($$->code,"%sPOP AX\\n",$$->code);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E '/' E \'a0 \'a0 \'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%s",$1->code,$3->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"AX")!=0)sprintf($$->code,"%sPUSH AX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"BX")!=0)sprintf($$->code,"%sPUSH BX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"DX")!=0)sprintf($$->code,"%sPUSH DX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0sprintf($$->code,"%sMOV AX,%s\\nMOV DX,0\\nMOV BX,%s\\nDIV BX\\nMOV %s,AX\\n",$$->code,$1->name,$3->name,$1->name);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"DX")!=0)sprintf($$->code,"%sPOP DX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"BX")!=0)sprintf($$->code,"%sPOP BX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"AX")!=0)sprintf($$->code,"%sPOP AX\\n",$$->code);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E MOD E		\'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%s",$1->code,$3->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"AX")!=0)sprintf($$->code,"%sPUSH AX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"BX")!=0)sprintf($$->code,"%sPUSH BX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"DX")!=0)sprintf($$->code,"%sPUSH DX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0sprintf($$->code,"%sMOV AX,%s\\nMOV DX,0\\nMOV BX,%s\\nDIV BX\\nMOV %s,DX\\n",$$->code,$1->name,$3->name,$1->name);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"DX")!=0)sprintf($$->code,"%sPOP DX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"BX")!=0)sprintf($$->code,"%sPOP BX\\n",$$->code);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0if(strcmp($1->name,"AX")!=0)sprintf($$->code,"%sPOP AX\\n",$$->code);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E AND E		\'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%sAND %s,%s\\n",$1->code,$3->code,$1->name,$3->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E OR E		\'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%sOR %s,%s\\n",$1->code,$3->code,$1->name,$3->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| E XOR E		\'a0 \{$$=makeNode();sprintf($$->name,"%s",$1->name);sprintf($$->code,"%s%sXOR %s,%s\\n",$1->code,$3->code,$1->name,$3->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| NUM		 	\'a0 \{$$=$1;sprintf($$->name,"R%d",count++);sprintf($$->code,"MOV %s,%d\\n",$$->name,(int)$1->data);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0| ID		\'a0 	\'a0 \{if($1->type==-1) \{printf("Error: Variable %s is undeclared\\n", $1->varname); exit(0);\} else \{$$=$1;sprintf($$->name,"R%d",count++);sprintf($$->code,"MOV %s,%s\\n",$$->name,$1->varname);\}\}
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 COND : E EQ E 		\{$$=makeNode();sprintf($$->code,"%s%sCMP %s,%s\\nJE LABEL%d\\n",$1->code,$3->code,$1->name,$3->name,count2);count--;$$->data=count2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0| E GE E		\{$$=makeNode();sprintf($$->code,"%s%sCMP %s,%s\\nJG LABEL%d\\n",$1->code,$3->code,$1->name,$3->name,count2);count--;$$->data=count2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0| E GE_EQ E	\{$$=makeNode();sprintf($$->code,"%s%sCMP %s,%s\\nJGE LABEL%d\\n",$1->code,$3->code,$1->name,$3->name,count2);count--;$$->data=count2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0| E LE E 		\{$$=makeNode();sprintf($$->code,"%s%sCMP %s,%s\\nJL LABEL%d\\n",$1->code,$3->code,$1->name,$3->name,count2);count--;$$->data=count2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0| E LE_EQ E 	\{$$=makeNode();sprintf($$->code,"%s%sCMP %s,%s\\nJLE LABEL%d\\n",$1->code,$3->code,$1->name,$3->name,count2);count--;$$->data=count2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0| E NOT_EQ E 	\{$$=makeNode();sprintf($$->code,"%s%sMOV %s,%s\\nCMP %s,%s\\nJNE LABEL%d\\n",$1->code,$3->code,$1->name,$3->name,count2);count--;$$->data=count2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 IFST : IF '(' COND ')' \{count2+=2;\} BLK IFST2 \{$$=makeNode();sprintf($$->code,"%s%sJMP LABEL%d\\nLABEL%d:\\n%sLABEL%d:\\n",$3->code,$7->code,$3->data+1,$3->data,$6->code,$3->data+1);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 IFST2 : ELSE BLK \{$$=$2;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\'a0 | \{$$=makeNode();sprintf($$->code,"");\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\'a0 ;\'a0\'a0\'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 WHILEST : WHILE \{count2++;\} '(' COND ')' \{count2++;\} BLK \{$$=makeNode();sprintf($$->code,"JMP LABEL%d\\nLABEL%d:\\n%sLABEL%d:\\n%s",$4->data-1,$4->data,$7->code,$4->data-1,$4->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0	\'a0 \'a0 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 FORST : FOR \{count2++;\} '(' F '~' COND '~' F ')' \{count2++;\} BLK \{$$=makeNode();sprintf($$->code,"%sJMP LABEL%d\\nLABEL%d:\\n%s%sLABEL%d:\\n%s",$4->code,$6->data-1,$6->data,$11->code,$8->code,$6->data-1,$6->code);\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 FUNCALL : ID '(' PAR3 ')' \{if($1->type==5)\{$$=makeNode();sprintf($$->code,"%sCALL %s\\n",$3->code,$1->varname);\}else if($1->type ==4 )\{printf("\\nError: Conflict in Return type");exit(0);\} else \{printf("\\nError: Function undeclared");exit(0);\}\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		| ID '=' ID '(' PAR3 ')' \{if($3->type==4)\{$$=makeNode();sprintf($$->name,"R%d",count++);sprintf($$->code,"%sCALL %s\\nPOP %s\\nMOV %s,%s\\n",$5->code,$3->varname,$$->name,$1->varname,$$->name);count--;\}else if($3->type == 5)\{printf("\\nError: Conflict in Return type");exit(0);\} else \{printf("\\nError: Function undeclared");exit(0);\}\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\'a0 \'a0 ;\'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 PAR3 : PAR4 \{$$=$1;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 | \{$$=makeNode();sprintf($$->code,"");\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 PAR4 : PAR4 ',' E \{$$=makeNode();sprintf($$->code,"%sPUSH %s\\n%s",$3->code,$3->name,$1->code);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 | E \{$$=makeNode();sprintf($$->code,"%sPUSH %s\\n",$1->code,$1->name);count--;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	 ;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 %%
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 treenode *makeNode()
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	treenode* curr_node = (treenode *)malloc(sizeof(treenode));
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	return curr_node;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \}
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 int main()
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	yyparse();
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	return 0;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \}
\f1\fs24 \cb1 \
}