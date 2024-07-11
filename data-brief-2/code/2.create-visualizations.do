/********************************************************************************\
  Project: ECON 255 - Data Brief 2
  
  File Name: 2.create-visualizations.do

  Description: This program creates DB2 visualizations

*******************************************************************************/

	/* import data cleaned by previous do file */ 
		use "$data/data-for-analysis.dta", clear
		

		
		
/******************************************************************************/      
/***************************    first decriptive analysis part ******************************/          
/******************************************************************************/	

/* Provide a visualization supporting a claim that the conditional expectation of your LHS variable changes with respect to variation in your RHS variable */


/* economic security: rent */
preserve
		collapse (mean) expns_dif, by(age)
		
		// Create a scatterplot with a fitted line
	twoway (scatter age expns_dif) ///
       (lfit age expns_dif), ///
       title("Conditional Expectation Plot of Age and Economic Security") ///
       xtitle("Economic Security") ytitle("Age")
	   
	    /* export the histogram to output folder */
      graph export "$output/age_economic_sec_scatter.png", replace
	  
	   regress age expns_dif
		
restore


/* housing security: rent */
preserve
		collapse (mean) rent_yes, by(age)
		
		// Create a scatterplot with a fitted line
	twoway (scatter age rent_yes) ///
       (lfit age rent_yes), ///
       title("Conditional Expectation Plot of Age and Rent") ///
       xtitle("rent_yes") ytitle("Age")
	   
	    /* export the histogram to output folder */
      graph export "$output/age_rentyes_scatter.png", replace
	  
	   regress age rent_yes
		
restore


/* health acess: insurance access */
preserve
		collapse (mean) health_security, by(age)
		
		// Create a scatterplot with a fitted line
	twoway (scatter age health_security) ///
       (lfit age health_security), ///
       title("Conditional Expectation Plot of Age and Health Security") ///
       xtitle("health_security") ytitle("Age")
	   
	    /* export the histogram to output folder */
      graph export "$output/age_health_security_scatter.png", replace
	  
	   regress age health_security
		
restore

/* food security: curfoodsuf */
preserve
		collapse (mean) curfoodsuf, by(age)
		// Create a scatterplot with a fitted line
	twoway (scatter age curfoodsuf) ///
       (lfit age curfoodsuf), ///
       title("Conditional Expectation Plot of Age and Food Security") ///
       xtitle("food security") ytitle("Age")
	   
	    /* export the histogram to output folder */
      graph export "$output/age_food_security_scatter.png", replace
		
restore


	
	
/******************************************************************************/      
/***************************    second descriptive analysis part  ******************************/          
/******************************************************************************/








