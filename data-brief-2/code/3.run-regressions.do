/********************************************************************************\
  Project: ECON 255 - Data Brief 2
  
  File Name: 3.run-regressions.do

  Description: This program performs regressions on the data

*******************************************************************************/


	/* import data for analysis */
		use "$data/data-for-analysis.dta", replace
	
	

/******************************************************************************/      
/**********************    run  regressions  **********************************/          
/******************************************************************************/

/* Run a bivariate OLS regression of your LHS and RHS variables */ 

	   regress age i.expns_dif
	   est store reg1
		



/* Run a multivariate regression of your LHS and RHS variables, including the first of your 3 additional variables*/

	   regress age i.expns_dif i.rent_yes
		est store reg2



/* Run a multivariate regression of your LHS and RHS variables, including 2 of your 3 additional variables*/
	   regress age i.expns_dif i.rent_yes i.health_security
		est store reg3

/* Run a multivariate regression of your LHS and RHS variables, including all 3 of your additional variables */
		regress age i.expns_dif i.rent_yes i.health_security i.curfoodsuf
		est store reg4

/******************************************************************************/      
/*****************    display results in table   ******************************/          
/******************************************************************************/


	esttab r* using "$output/tables/table-1.rtf", ///
			se label replace /// SEs in parantheses, variable labels, replace output
			title("Regression Outputs") ///
			stats(N r2) /// put n obs and R2 in table
			starlevels(* 0.05 ** 0.01 *** 0.001) /// p-value stars
			note("Regression 1: Bivariate OLS regression between age and economic security or 'expns_dif'. Regression 2: Multivariate regression of age on economic security and housing security (represented by rent). Regression 3: Multivariate Regression of age on economic security, housing security, and health access (represented by access to health insurance). Regression 4: Multivariate Regression of age on economic security, housing security, health access, and food security")
		
		