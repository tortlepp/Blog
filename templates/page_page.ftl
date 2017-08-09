<!DOCTYPE html>
<html lang="${blog.language}">
 <head>
  <meta charset="UTF-8">
  <meta name="author" content="${blog.author}">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>${page.title}</title>
  <link rel="stylesheet" href="${basedir}style/style.css">
  <link rel="shortcut icon" type="image/x-icon" href="${basedir}favicon.ico">
  <link rel="alternate" type="application/atom+xml" href="${basedir}blog.xml" title="${blog.title} (Atom Feed)">
 </head>
 <body>
  <div id="content">
   <#include "include_header.ftl">

   <article>
    <header><h2>${page.title}</h2></header>
    ${page.content}
   </article>

   <#include "include_footer.ftl">
  </div>
 </body>
</html>
