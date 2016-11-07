<!DOCTYPE html>
<html lang="${blog.language}">
 <head>
  <meta charset="UTF-8">
  <meta name="author" content="${blog.author}">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>${post.title}</title>
  <link rel="stylesheet" href="${basedir}style/style.css">
  <link rel="shortcut icon" type="image/x-icon" href="${basedir}favicon.ico">
  <link rel="alternate" type="application/atom+xml" href="${basedir}blog.xml" title="${blog.title} (Atom Feed)">
 </head>
 <body>
  <#include "include_header.ftl">
  <div id="content">

   <article>
    <header><h1>${post.title}</h1></header>
    ${post.content}
    <footer><p>Published on ${post.created?date?string.long} at ${post.created?time?string.short} by <a href="${basedir}about/thorsten.html">${blog.author}</a> | Categories:&nbsp;<#list post.categories as category><a href="${category.relativePath}">${category.name}</a>&nbsp;&nbsp;</#list></p></footer>
   </article>

   <article>
    <p id="nav">
     <#if post.next?has_content><a href="${post.next}">Newer Post</a><#else>Newer Post</#if>
     &nbsp;&nbsp;&ndash;&nbsp;&nbsp;
     <#if post.previous?has_content><a href="${post.previous}">Older Post</a><#else>Older Post</#if>
    </p>
   </article>

   <#include "include_footer.ftl">
  </div>
 </body>
</html>
