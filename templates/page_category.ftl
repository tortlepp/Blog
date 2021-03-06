<!DOCTYPE html>
<html lang="${blog.language}">
 <head>
  <meta charset="UTF-8">
  <meta name="author" content="${blog.author}">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>Category ${category}</title>
  <link rel="stylesheet" href="${basedir}style/style.css">
  <link rel="shortcut icon" type="image/x-icon" href="${basedir}favicon.ico">
  <link rel="alternate" type="application/atom+xml" href="${basedir}blog.xml" title="${blog.title} (Atom Feed)">
 </head>
 <body>
  <div id="content">
   <#include "include_header.ftl">

   <p id="hint">This pages shows all posts in the category "${category}"</p>

   <#list posts as post>
    <article class="post">
     <header><h2><a href="${post.link}">${post.title}</a></h2></header>
     ${post.content?keep_before("</p>")} [...]</p>
     <p><a href="${post.link}">Continue Reading</a></p>
    </article>
   </#list>

   <#include "include_footer.ftl">
  </div>
 </body>
</html>
