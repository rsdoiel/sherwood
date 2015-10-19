
# sherwood

This is a set of tools I am developing to help my friend translate a website project into an ebook. The tools are organized to complete several steps

+ Mirror the existing website
    + Save of zip of the unaltered mirror
    + Convert the documents in mirrored copy to use root folder relative links
    + Correct munged filenames (e.g. filenames that contain a "?") re-link
    + Convert search boxes to an embedded browser search
+ Transform the site into content units preserving linkage
+ Transform content units into ePub/Mobi documents

## Requirements

+ Presumes a Linux based system like a Raspberry Pi (e.g. the sed on Mac OS X is broken for the purposes of this set of tools)
+ Bash
+ wget
+ zip
+ [shorthand](https://github.com/rsdoiel/shorthand)


