# Exploratory Data Analysis in R of Wine Properties and Quality Ratings

This is my submission for Udacity's Exploratory Data Analysis (EDA) in R course, part of Udacity's Data Analyst nano-degree and a two-credit piece of Western Governor University's Data Management and Data Analytics Bachelor in Science.

The purpose of the markdown document, and its HTML version, is to show my thinking as I explore data and demonstrate basic R and EDA skills. This is not meant as a finished product to communicate findings, though I hope you find it interesting if verbose to peruse.

If you're interested in wine and the data itself, I recommend skipping the narrative and skimming the plots, reading the summary sections and taking a look at the final plots.

## Files

* *dataDictionary.csv*: Variable names, units, and descriptions.
* *tools.R*: Some basic functions I used to play with R and make plots.
* *wineAnalysis.html*: The HTML document that shows my EDA, including plots and narrative, but excluding the code behind it.
* *wineAnalysis.rmd*: The R notebook containing my full EDA, including the R code.
* *wineQualityInfo.txt*: The informational document supplied with this data set by Udacity. Contains background and data dictionary.
* *wineQualityReds.csv*: The data set of red Vinho Verdes.
* *wineQualityWhites.csv*: The data set of white Vinho Verdes.

## References

### The source of the data:

P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. 
  Modeling wine preferences by data mining from physicochemical properties.
  In Decision Support Systems, Elsevier, 47(4):547-553. ISSN: 0167-9236.

  Available at: [@Elsevier](http://dx.doi.org/10.1016/j.dss.2009.05.016)
                [Pre-press (pdf)](http://www3.dsi.uminho.pt/pcortez/winequality09.pdf)
                [bib](http://www3.dsi.uminho.pt/pcortez/dss09.bib)
    
            
### Wine references:
                
* https://wetravelportugal.com/vinho-verde/
* https://winefolly.com/deep-dive/what-wines-to-drink-from-portugal-by-region/
* https://www.calwineries.com/learn/wine-chemistry/wine-acids/citric-acid
* http://www.diwinetaste.com/dwt/en2012043.php
* https://www.calwineries.com/learn/wine-chemistry/chemical-components-of-wine/sulfur-dioxide#:~:text=The%20Role%20of%20Sulfur%20Dioxide%20in%20Wine%20A,or%20less%20required%20after%20malolactic%20fermentation%20is%20complete.
* https://www.masterclass.com/articles/learn-about-alcohol-content-in-wine-highest-to-lowest-abv-wines#does-white-wine-or-red-wine-have-higher-alcohol-content


### R references:

* https://r4ds.had.co.nz/
* http://adv-r.had.co.nz/Style.html
* https://adv-r.hadley.nz/
* *Many StackOverflow posts*: https://stackoverflow.com/users/2391771/kaleb-coberly


### R packages:

* *tidyverse*: https://www.rdocumentation.org/packages/tidyverse/versions/1.3.1
* *gridExtra*: https://www.rdocumentation.org/packages/gridExtra/versions/2.3
* *diptest*: https://www.rdocumentation.org/packages/diptest/versions/0.75-7
* *GGally*: https://www.rdocumentation.org/packages/GGally/versions/1.5.0
