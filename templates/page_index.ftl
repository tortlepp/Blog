<!DOCTYPE html>
<html lang="${blog.language}">
 <head>
  <meta charset="UTF-8">
  <meta name="author" content="${blog.author}">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>${blog.title}</title>
  <link rel="stylesheet" href="${basedir}style/style.css">
  <link rel="shortcut icon" type="image/x-icon" href="${basedir}favicon.ico">
  <link rel="alternate" type="application/atom+xml" href="${basedir}blog.xml" title="${blog.title} (Atom Feed)">
 </head>
 <body>
  <div id="content">
   <#include "include_header.ftl">

   <#list posts as post>
    <article class="post">
     <header><h1><a href="${post.link}">${post.title}</a></h1></header>
     ${post.content}
     <footer><p>Published on ${post.created?date?string.long} at ${post.created?time?string.short} by <a href="${basedir}about/thorsten.html">${blog.author}</a> | Categories:&nbsp;<#list post.categories as category><a href="${category.path}">${category.name}</a>&nbsp;&nbsp;</#list></p></footer>
    </article>
   </#list>

   <article>
    <p id="nav">
     <#if index_newer?has_content><a href="${index_newer}">Newer Posts</a><#else>Newer Posts</#if>
     &nbsp;&nbsp;&ndash;&nbsp;&nbsp;
     <#if index_older?has_content><a href="${index_older}">Older Posts</a><#else>Older Posts</#if>
    </p>
   </article>

   <#include "include_footer.ftl">
  </div>
 </body>
</html>
