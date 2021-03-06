
# sherwood

This is a set of tools I am developing to help my friend translate a website project into an ebook. The tools are organized to complete several steps

+ Mirror the existing website (Bash & wget)
    + Save of zip of the unaltered mirror
    + Convert the documents in mirrored copy to use root folder relative links
    + Correct munged filenames (e.g. filenames that contain a "?") re-link
    + Convert search boxes to an embedded browser search
+ Transform the site into content units preserving linkage (Bash and shorthand)
+ Transform content units into ePub/Mobi documents

## data organization

+ Category (paged by record count)
  + Architect
  + Building_Type
  + City
  + Country
  + Project_Name
+ Instance (group by field value, sorted by field)
  + Architect
    + Architect
    + Building_Type
    + City
    + Country
    + Project_Name
  + Building_Type
    + Architect
    + Building_Type
    + City
    + Country
    + Project_Name
  + City
    + Architect
    + Building_Type
    + City
    + Country
    + Project_Name
  + Country
    + Architect
    + Building_Type
    + City
    + Country
    + Project_Name
+ Project
  + File_No

I need to make sure that I have all projects accounted for and to identify which
images are broken and get replacement files for the eBook version and static
preservation copy.

## Requirements

+ Presumes a Linux based system like a Raspberry Pi (e.g. the sed on Mac OS X is broken for the purposes of this set of tools)
+ Bash
+ go (shorthand is written in Go)
+ NodeJS (using jsDom for some of the content extraction and validation)
+ wget
+ zip
+ [shorthand](https://github.com/rsdoiel/shorthand)
