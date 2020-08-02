# Simpon's Paradox

## Objective
<p>In 1986, a group of urologists in London published a research paper in <em>The British Medical Journal</em> that compared the effectiveness of two different methods to remove kidney stones. Treatment A was open surgery (invasive), and treatment B was percutaneous nephrolithotomy (less invasive). When they looked at the results from 700 patients, treatment B had a higher success rate. However, when they only looked at the subgroup of patients different kidney stone sizes, treatment A had a better success rate. What is going on here? This known statistical phenomenon is called Simpon’s paradox. Simpon's paradox occurs when trends appear in subgroups but disappear or reverse when subgroups are combined. </p>
<p>This project will explore Simpon’s paradox using multiple regression and other statistical tools.
<img src="https://assets.datacamp.com/production/project_697/img/img1.jpg"></p>

## Data
The data contains three columns: treatment (A or B), stone_size (large or small) and success (0 = Failure or 1 = Success). 
|treatment|stone_size|success|
|---|---|---|
|B|large|1|
|A|large|1|
|A|large|0|
|A|large|1|
|A|large|1|
|B|large|1|

## Analysis
### Recreate the Treatment X Success summary table
<p>From the treatment and success rate descriptive table, we saw that treatment B performed better on average compared to treatment A (82% vs. 78% success rate).</p>

|treatment|success|N|Freq|
|---|---|---|---|
|A|0|77|0.220|
|A|1|273|0.780|
|B|0|61|0.174|
|B|1|289|0.826|

### Bringing stone size into the picture
<p>When stratified by stone size, treatment A had better results for both large and small stones compared to treatment B (i.e., 73% and 93% v.s. 69% and 87%).</p>
|treatment|stone_size|success|N|Freq|
|---|---|---|---|---|
|A|large|0|71|0.270|
|A|large|1|192|0.730|
|A|small|0|6|0.069|
|A|small|1|81|0.931|
|B|large|0|25|0.312|
|B|large|1|55|0.688|
|B|small|0|36|0.133|
|B|small|1|234|0.867|

<p>From the bar plot, we noticed an unbalanced distribution of kidney stone sizes in the two treatment options. 
Large kidney stone cases tended to be in treatment A, while small kidney stone cases tended to be in treatment B. </p>
<img src="2.png">

