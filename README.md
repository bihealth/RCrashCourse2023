# R crash course 03/2023

The CUBI R crash course

**Notes on lectures.** Lectures are always available as two files. The
Rmarkdown file (extension .Rmd) is the source file. It is easy to browse
and to understand, just click on it to view it. You can learn a bit of
Rmarkdown with that, and also you will see exactly how all the plots and R
output are generated.

HTML files (the ready presentations) are a bit more tricky. Github does not
allow viewing these files directly, if you click on them, you will see the
HTML source.

To view HTML files, use the following links:

## Lectures

 * [Lecture 1](https://bihealth.github.io/RCrashCourse2023/Lectures/lecture_01.html): working with Rstudio; simple data types; selecting vectors
     * [Video: introduction to working with Rstudio, 11 minutes](https://youtu.be/zWt8BC1UNiQ)
     * [Video: introduction to functions, 5 minutes](https://youtu.be/rnGADz4cuBA)
     * [Video (extra): functions as values, 6 minutes](https://youtu.be/NTnLZQwKhvA)

 * [Lecture 2](https://bihealth.github.io/RCrashCourse2023/Lectures/lecture_02.html): complex data types (matrices, lists, data frames); reading data; diagnosing data problems
     * [Video: using logical vectors for selecting elements, 8 minutes](https://youtu.be/xmeZofFlp78)
     * [Video: tibbles vs data frames, 10 minutes](https://youtu.be/eWu7kvNBpyc)


 * [Lecture 3](https://bihealth.github.io/RCrashCourse2023/Lectures/lecture_03.html): Reading and cleaning data; reshaping data frames
     * [Video: wide vs long format, 9 minutes](https://youtu.be/NO1gaeJ7wtA)
     * [Video: converting from wide to long, 6 minutes](https://youtu.be/v5Y_yrnkWIU)
     * [Video: converting from long to wide, 4 minutes](https://youtu.be/jN0CI62WKs8)
     * [Video: introduction to regular expressions, 15 minutes](https://youtu.be/ukN59iCo5wc)


 * [Lecture 4](https://bihealth.github.io/RCrashCourse2023/Lectures/lecture_04.html): Searching in data; combining data frames
     * [Video: ggplot2 vs base R, 6 min](https://youtu.be/NnxJyCHrUTE)


 * [Lecture 5](https://bihealth.github.io/RCrashCourse2023/Lectures/lecture_05.html): Visualisations, rmarkdown, Freestyle
     * [Video: introduction R markdown, 15 min](https://youtu.be/vBeGakSENi8)
     * [Video: basic document formatting in Rmarkdown documents, 9 minutes](https://youtu.be/rfMTn4NBDkQ)
     * [Video: including references in Rmarkdown documents, 7 min](https://youtu.be/DUG1tEL5kXI)

## Scripts from the Course 

The scripts with analysis for each day are provided in the folder Scripts/ . They contain commands discussed during the lectures and example solutions for the exercises.

## Books and further resources

 * [Books](https://bihealth.github.io/RcrashCourse2021/Lectures/books.html) 

**Instructions for installing R and Rstudio:**

 * [Instructions for all systems](https://techvidvan.com/tutorials/install-r/)
 * [Installing R and Rstudio for Windows](https://medium.com/@GalarnykMichael/install-r-and-rstudio-on-windows-5f503f708027)
 * [Yet another guide](https://rstudio-education.github.io/hopr/starting.html)


**Advanced:** Cloning the repository using Rstudio.

All course materials are on the website [https://github.com/bihealth/RcrashCourse2023/](https://github.com/bihealth/RcrashCourse2023/). 
This webpage is a *repository*. Instead of downloading the materials one by
one, you can make a perfect copy locally (which is called "cloning") and
update it (semi-)automatically when anything changes.

If you want to save yourself some work (and learn something new at the same
time), you can directly clone the repository of the course using Rstudio. 

First, install git (follow the instructions
[here](https://support.rstudio.com/hc/en-us/articles/200532077?version=2022.07.1%2B554&mode=desktop)).

Once git is installed, open Rstudio, select File -> New Project, then choose "Version
control", "Git", and enter "https://github.com/bihealth/RcrashCourse2023/"
as the repository URL. Select a directory where you would like to clone the
repository, and click the "Create repository" button. Rstudio will download
all course materials.

In the top right corner, a new pane appears with the name "git". When you
select it, clicking the blue "down" arrow ("pull") will update your local
directory with any changes that have been made to the course repo in the
meanwhile.
