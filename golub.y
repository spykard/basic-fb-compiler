%{	#include <stdio.h>
	#include <math.h>
	void yyerror(char *); 
	extern FILE *yyin;								
	extern FILE *yyout;
	extern yylineno;
	int counter;								
%}

%token EXTERN VOID LEFT_P RIGHT_P DELIM INTEGER BOOLEAN STRING
%token COM AMP BEGINN ENDD LEFT_C RIGHT_C IF ELSE FOR WHILE SET RETURN
%token LOG_0 LOG_1 LOG_2 LOG_3 LOG_4 LOG_5 LOG_6 LOG_7 LOG_8
%token ADD SUB MUL DIV MOD TRUE FALSE INT IDENT

%nonassoc SET 
%left LOG_0 LOG_1
%nonassoc LOG_3 LOG_4 LOG_5 LOG_6 LOG_7 LOG_8
%left ADD SUB
%left MUL DIV MOD
%right LOG_2

%%

programma: eksoterikes_diloseis kefalida_prog tmima_orismon tmima_entolon
		 ;

eksoterikes_diloseis: /* empty, 0 or more */
					| eksoteriko_prot eksoterikes_diloseis
					;				
	
eksoteriko_prot: EXTERN protipo_sinartisis
/*			   | error '\n' { yyclearin; yyerrok;                  }*/
               ;	
			   
kefalida_prog: VOID IDENT LEFT_P RIGHT_P
/*			   | error '\n' { yyclearin; yyerrok;                  }*/
			 ;
			 
tmima_orismon: /* empty, 0 or more */
			 | orismos tmima_orismon 
	     	 ;	

orismos: orismos_metabliton
		| orismos_sinartisis
		| protipo_sinartisis
/*		| error '\n' { yyclearin; yyerrok;                  }*/
		;
		
orismos_metabliton: tipos_dedomenon lista_metavliton DELIM
					;

tipos_dedomenon: INTEGER
				| BOOLEAN
				| STRING
				;
				
lista_metavliton: IDENT lista_metavlitonB
				;

lista_metavlitonB: /* empty for LL(1) */
				| COM IDENT lista_metavlitonB  
				;				
				
orismos_sinartisis: kefalida_sinartisis tmima_orismon tmima_entolon
					;

protipo_sinartisis: kefalida_sinartisis DELIM
					;
					
kefalida_sinartisis: tipos_sinartisis IDENT LEFT_P kefalida_sinartisisK
					;
					
kefalida_sinartisisK: RIGHT_P
					| lista_tipikon RIGHT_P
					;
					
tipos_sinartisis: tipos_dedomenon
				| VOID
				;

lista_tipikon: tipikes_parametroi lista_tipikonB
			;
			
lista_tipikonB:	/* empty 0 or more */
			| COM tipikes_parametroi lista_tipikonB
			;		
			
tipikes_parametroi: tipos_dedomenon AMP IDENT
				| tipos_dedomenon IDENT
				;

tmima_entolon: BEGINN tmima_entolonK ENDD
/*			| error '\n' { yyclearin; yyerrok;                  }*/
			;
			
tmima_entolonK: /* empty, 0 or more */
			| entoli tmima_entolonK
			;
			
entoli: apli_entoli DELIM
		| domimeni_entoli
		| sintheti_entoli
		;
		
sintheti_entoli: LEFT_C sintheti_entoliK RIGHT_C
				;
				
sintheti_entoliK: /* empty, 0 or more */
				| entoli sintheti_entoliK
				;		
	
domimeni_entoli: entoli_if
				| entoli_for
				| entoli_while
				;
				
apli_entoli: anathesi
			| klisi_sinartisis
			| entoli_return
			| entoli_null
			;
			
entoli_if: IF LEFT_P geniki_ekfrasi RIGHT_P entoli else_clause
		;

else_clause: /* empty */ 
			| ELSE entoli
			;

/* 3o EROTIMA */		
entoli_for: FOR LEFT_P IDENT SET INT DELIM INT DELIM INT RIGHT_P entoli
			{ if ($7 > 3) {	printf("\nREPLACE for WITH:\ni = %d;\nwhile( i <= %d ){ ... i=i+%d };\n\n", $5, $7, $9);
							fprintf(yyout, "\ni = %d;\nwhile( i <= %d ){ ... i=i+%d };\n\n", $5, $7, $9);}  
				else { printf("\nLOOP-UNROLLING:\nfor( i = 1 ; %d ; %d ){ ... ... ... }\n\n", $7-2, $9+2);
							fprintf(yyout, "\nfor( i = 1 ; %d ; %d ){ ... ... ... }\n\n", $7-2, $9+2);} };
							
entoli_while: WHILE LEFT_P genikos_protos RIGHT_P entoli		
			;
			
anathesi: IDENT SET geniki_ekfrasi
		;
		
klisi_sinartisis: IDENT LEFT_P klisi_sinartisisK
				;
				
klisi_sinartisisK: RIGHT_P
				| lista_pragmatikon RIGHT_P
				;
				
lista_pragmatikon: pragmatikes_parametroi lista_pragmatikonB
				;

lista_pragmatikonB: /* empty 0 or more */
				| COM pragmatikes_parametroi lista_pragmatikonB
				;	
				
pragmatikes_parametroi: geniki_ekfrasi
					;
					
entoli_return: RETURN entoli_returnK
			;
			
entoli_returnK: /* empty for LL(1) */
		| geniki_ekfrasi
		;
			
entoli_null: /* empty */
			;
			
geniki_ekfrasi: genikos_oros geniki_ekfrasiB
			;
			
geniki_ekfrasiB: /* empty 0 or more */
				| LOG_0 genikos_oros geniki_ekfrasiB
				;	
			
genikos_oros: genikos_paragontas genikos_orosB
			;
			
genikos_orosB: /* empty 0 or more */
			| LOG_1 genikos_paragontas genikos_orosB
			;
			
genikos_paragontas: genikos_protos
				| LOG_2 genikos_protos
				;
				
genikos_protos: apli_ekfrasi genikos_protosK
				;
				
genikos_protosK: /* empty for LL(1) */
		| tmima_sigkrisis
		;
				
tmima_sigkrisis: sigkritikos_telestis apli_ekfrasi
				;
				
sigkritikos_telestis: LOG_3
					| LOG_4
					| LOG_5
					| LOG_6
					| LOG_7
					| LOG_8
					;
					
apli_ekfrasi: aplos_oros apli_ekfrasiB
			;
			
apli_ekfrasiB: /* empty 0 or more */
			| ADD aplos_oros apli_ekfrasiB
			| SUB aplos_oros apli_ekfrasiB
			;
			
aplos_oros: aplos_paragontas aplos_orosB
			;
			
aplos_orosB: /* empty 0 or more */
			| MUL aplos_paragontas aplos_orosB
			| DIV aplos_paragontas aplos_orosB
			| MOD aplos_paragontas aplos_orosB
			;
			
aplos_paragontas: '+' aplos_protos
				| '-' aplos_protos
				| aplos_protos
				;
				
aplos_protos: IDENT
			| INT
			| TRUE
			| FALSE
			| klisi_sinartisis
			| LEFT_P geniki_ekfrasi RIGHT_P
			;
		
%%								    

void yyerror(char *s){
    counter++;
	printf("\n-|ERROR IN LINE %d|-\n", yylineno);
	fprintf(yyout, "\n-|ERROR IN LINE %d|-\n", yylineno);
}									

int main (int argc, char **argv)
{	
	FILE *source;
	counter=0;
	char ch;
	++argv; --argc;
	  
	if(argc>0)
		yyin=fopen(argv[0], "r");
	else
		yyin=stdin;
	yyout = fopen ( "output.txt", "w" );

	source = fopen(argv[0], "r");    /* copy the file to output */
	while( ( ch = fgetc(source) ) != EOF )
		fputc(ch, yyout);
	
	yyparse();
	
	if(counter==0){
	     printf("\n! CODE SYNTACTICALLY CORRECT !\n");
		 fprintf(yyout, "\n! CODE SYNTACTICALLY CORRECT !\n");}
	else{printf("\n! CODE NOT SYNTACTICALLY CORRECT ! #ERRORS:%d\n", counter);
		 fprintf(yyout, "\n! CODE NOT SYNTACTICALLY CORRECT ! #ERRORS:%d\n", counter);}
	   
	fclose(source);
	return 0;
}			