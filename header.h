{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 CourierNewPSMT;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs26\fsmilli13333 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 struct\'a0 expnode
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \{
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	char varname[8],code[10000],name[5];
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	int data;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	int type;		// -1 = No Data Type, 2 for int, 4 for Func with return, 5 for Func with no return
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 	struct expnode *next,*left,*right,*third,*fourth;
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 \};
\f1\fs24 \cb1 \

\f0\fs26\fsmilli13333 \cb3 typedef struct expnode treenode;
\f1\fs24 \cb1 \
}