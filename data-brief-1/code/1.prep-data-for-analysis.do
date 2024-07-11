/********************************************************************************\
  Project: ECON 255 - Data Brief 1

  File Name: prep-data-for-analysis.do

  Description: This program prepares the county opioid data for analysis

			  
  Data source: https://data.mendeley.com/datasets/dwfgxrh7tn/8
*******************************************************************************/

/* clear anything in memory */
      clear all
      capture log close

  /* create a global macro for your working directory */
      global root "~/Desktop/econ-255-fa23/data-brief-1"

  
  /* create global macros for your data and output folders */
      global data "$root/data"
      global output "$root/output"
      global logs "$root/logs"
	  /* change forward slahes to backslashes for PC users*/

	/* import the 2015 massachusetts county-by-race seer panel */ 
		use "$data/county-opioid-panel", clear
		
	/* only keep data for states in the Appalacia region */
	keep if F12424 == "OH" | F12424 == "WV" | F12424 == "KY" | F12424 == "PA" | F12424 == "MD"

	/*move unemployment rate for 16+ to front of data set*/
	order F06795
	
	/*move median household income to front of data set*/
	order F13226
	
	/*move # of medical docors per 100,000 residents to front of data set*/
	order MD_PC
			
	/* save the new data */ 
		save "$data/data-for-analysis.dta", replace
			
		
			
			
			
			