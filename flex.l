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

\f0\fs26\fsmilli13333 \cb3 #include "y.tab.h"
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include "string.h"
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 #include \'93header.h\'94
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 extern treenode *table;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 treenode *table=NULL;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 treenode *addSymbol(char str[8]);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 treenode *createNode(float leaf_data, int t);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %%
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "integer" \'a0 \'a0 \'a0 \'a0 \{return INT;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "main" \'a0 		\'a0 \{return MAIN;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "agar"\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{return IF;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "warna" \'a0 \'a0 \'a0 \'a0 \'a0 \{return ELSE;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "jab_tak"		\'a0 \{return WHILE;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "tab_tak"		\'a0 \{return FOR;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "return"\'a0 \'a0 \'a0 \'a0 \'a0 \{return RET;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "void"\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{return VOID;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "++"			\'a0 \{return INCR;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "--"			\'a0 \{return DECR;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "==" 			\'a0 \{return EQ;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "!=" 			\'a0 \{return NOT_EQ;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "<=" 			\'a0 \{return LE_EQ;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 ">=" 			\'a0 \{return GE_EQ;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "<" 			\'a0 \{return LE;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 ">" 			\'a0 \{return GE;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "&" 			\'a0 \{return AND;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "|" 			\'a0 \{return OR;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "#" 			\'a0 \{return XOR;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "!"				\'a0 \{return NOT;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 "%" 			\'a0 \{return MOD;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 [0-9]+	\'a0 	\'a0 \'a0 \'a0 \{yylval.eval=createNode(atoi(yytext),2); return NUM;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 ([A-Z]+[0-9]*)+	\'a0 \{yylval.eval=addSymbol(yytext);return ID;\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 [-~+*/()\{\},=]\'a0 	\'a0 \{return yytext[0];\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 %%
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 int yywrap(void)\'a0\'a0\'a0\'a0\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0return 0;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \}
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 int yyerror(char *errormsg)\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0fprintf(stderr, "%s\\n", errormsg);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \'a0\'a0\'a0\'a0exit(1);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \}
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 treenode *addSymbol(char str[8])
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	treenode *temp=table, *newnode=NULL;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	if (temp==NULL)
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		newnode = (treenode *)malloc(sizeof(treenode));
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		strcpy(newnode->varname,str);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		newnode->next=NULL;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		newnode->type = -1;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		table=newnode;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	else
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	\{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		while (temp->next !=NULL)
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		\{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 			if (strcmp(temp->varname,str)==0)
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 				return temp;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 			else	
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 				temp=temp->next;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		if (strcmp(temp->varname,str)==0)
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 			return temp;			
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		newnode = (treenode*)malloc(sizeof(treenode));
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		strcpy(newnode->varname,str);
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		newnode->next=NULL;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		newnode->type = -1;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 		temp->next=newnode;
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 	\}
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	return newnode;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \}
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 \
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 treenode *createNode(float leaf_data, int t)
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	treenode* curr_node = (treenode *)malloc(sizeof(treenode));
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	curr_node -> data = leaf_data;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	curr_node->type = t;	
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	return curr_node;\'a0
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \}
\f1\fs24 \cb1 \
}