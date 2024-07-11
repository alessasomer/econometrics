/********************************************************************************\
  Project: ECON 255 - Data Brief 1
  
  File Name: 3.run-regressions.do

  Description: This program performs regressions on the data

*******************************************************************************/


	/* import data for analysis */
		use "$data/data-for-analysis.dta", replace
	
	

/******************************************************************************/      
/*****************    run bivariate regressions  ******************************/          
/******************************************************************************/

/*Run a bivariate OLS regression of healthcare access (LHS) and a county characteristic (RHS) */
 /* healthcare access: the number of medical doctors per 1000,000 county residents : MD_PC */
 /* county characteristic: unemployment rate for 16+ */
	/* column (1) */
		reg MD_PC F06795, robust
		est sto col1
		
/*Run a bivariate OLS regression of opioid prescribing (LHS) and a healthcare access (RHS) */
 /* opioid perscribing: "PCPV" /Per Capita Opioid Pill Volume"*/
 /* healthcare access: the number of medical doctors per 1000,000 county residents : MD_PC*/
	/* column (2) */
		reg PCPV MD_PC, robust
		est sto col2
		
/* Run a bivariate OLS regression of opioid prescribing (LHS) and the same county characteristic (RHS) from before */
	/* column (3) */
	/* opioid perscribing: "PCPV" /Per Capita Opioid Pill Volume"*/
	/* county characteristic: unemployment rate for 16+*/
		reg PCPV F06795, robust
		est sto col3
		
		reg PCPV F13226


/******************************************************************************/      
/*****************    display results in table   ******************************/          
/******************************************************************************/


	esttab col* 
	
/* take a screenshot and insert but make a note and title for it)
		
		
		