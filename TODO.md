+ Instances (city, country) are not getting processed correctly
+ Need to rewrite Category, Project, Instances into their own folders and adjust URLs appropriately
+ Remove the "admin" link from all pages
+ Replace search box with call to page that uses [Lunr.js](http://lunrjs.com) to process search results
+ Look at golang.org/x/net/html and github.com/PuerkitoBio/goquery and see if this will be helpful in extracting content and normalizing in JSON structructures
+ Figure out how to generate a Lunr.js index file, look at Bleve as an option of creating a service that could run on Roger's computer for editing and extending his content
+ See what Golang packages already support rendering epubs or review the layout structure and see what templates need to be written for converting the text


