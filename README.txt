=== Directory Information ===
Creator: Trystan Koch
Date: May 2015
Tags: Dissertation, Workflow, Organization
Requires at least:
  pdflatex
  bibtex
  git
  make
Helpful:
  Natively installed latex styles


=== Acknowledgement ===

 Many of these files are cribbed directly from work done by Dorothea 
 Brosius at IREAP. Quite a few of them are unchanged. I have merely set 
 up the folder in the way that suits me and automated many of the steps.



=== Introduction ===

 When I looked at the dissertation template at IREAP, I immediately knew
 that I would have to make various changes to the given files to avoid 
 frustration. This directory splits up files semantically, and 
 simplifies the workflow using a makefile to save me (and potentially 
 you) a headache.



=== Limitations ===

 I use Ubuntu, a linux distribution. Therefore everything here assumes
 a UNIX file structure and GNUMake. I also use pdflatex. Any other 
 method of compliation will require you to understand the differences
 between your method and mine. The repository requires git.



=== Directory Structure ===

 dissertation/
   Contains only files directly pertinant to the thesis, its creation, 
   and the repository I've created for version control. Most importantly
   it contains the makefile for compiling the thesis, and the main LaTeX
   input. When make is run, it will also contain the output pdf, which 
   is ignored by the repository.
 
 dissertation/aux
   Contains all the auxiliary and output files from pdflatex. pdflatex 
   also checks this directory for information before compliation. 

 dissertation/bib
   Contains the bibliography file.

 dissertation/figures
   Contains any figures you might have.

 dissertation/headmatter
   These files are an integral part of the UMD thesis, but are in many
   ways seperate from the main content. The title page, copyright page,
   lists of contents, acknowledgments, etc., are here so you can find
   them easily, seperate from the main content of your thesis.

 dissertation/styles
   Contains '.sty' and '.cls' files for the thesis. As written, only one
   of the styles is directly called from this folder. The others are
   assumed to be installed natively. 'thesis.cls' is the document class
   which contains all of the umd-centric styling options.

 dissertation/text
   This folder contains the main text of the thesis. Any chapters and
   appendices should go here.



=== Useful Commands ===

 Type 'make' into the commandline when in the root 'dissertation/'
 folder to make the dissertation.

 Type 'make clean' to erase any temporary files, and any extraneous
 output file that landed outside of the 'aux/' folder.

 Type 'make veryclean' to erase all output files in the 'aux'/ folder
 and the final output pdf.



=== Operation Summary ===

 GNUMake will compile the 'dissertation.tex' file, which draws from
 the 'headmatter/' and 'text/' folders. Any auxfiles are sent to the 
 'aux/' folder. It will do this twice, without outputting a pdf.

 Then bibtex will run in the 'aux/' folder to compile the bibliography
 from your 'bib/dissertation.bib' file.

 Using the new auxilliary files, pdflatex is called twice more to ensure 
 that all references are correctly linked within the document and the 
 bibliography is correctly formatted. The final run of pdflatex will
 output a final pdf.

 Due to the limitations of the commandline arguments, pdflatex outputs
 all files, auxilliary and otherwise, into the 'aux/' file. The final
 command is a simple 'mv' command to take the finished pdf into the root
 'dissertation/' folder for easy access.



=== Useful, But Slightly Obscure, Configuration Options ===

 A .gitignore file is hidden in the main directory.

 hyperref, a LaTeX package, contains methods for changing pdf metadata.
 In 'dissertation.tex', there is a '\hypersetup' command that sets the
 title, author, subject, and keywords for your document. Change these 
 from my information.

 Additionally, hyperref contains flags for changing the color of the
 link boxes in the pdf. I have lightned these considerably for my own
 reasons. If you wish to change them, they are also within 
 'dissertation.tex', right below the first '\hypersetup'.

 Finally, hyperref allows you to change how programs display the final
 pdf when opened. I have included a third '\hypersetup' for this.

