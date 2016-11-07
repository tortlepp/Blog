;;title=A new static blog generator
;;created=2016-08-01 19:22
;;category=Java, Blog, Project

About a year ago I started my first attempt to write my own static website generator. I tried out [JBake](http://jbake.org/) and liked it on the one hand, but on the other hand there were also some features and behaviors I disliked. Because of this I started my own static website generator called "mdpages". After a short time my program was working quite well, so I published it on GitHub and from time to time I did some small improvements. But some weeks ago I ultimately decided to stop the project and to start a new static generator from scratch.

When I began the work on mdpages I had an idea what my static website generator should be able to do and what features I needed. I implemented these features and it was just fine. But recently I discovered some weakness: a) I implemented lots of features and extra stuff &ndash; that was nice, but a good number of these features were unnecessary and unused; instead the source code was blown up. b) I supported Java 6 &ndash; and left out the useful features of recent Java versions. c) I used Ant + Ivy to manage dependencies &ndash; that works well, no doubt, but the setup has far more complexity than Gradle.

Some weeks ago I started [BlogBuilder](https://github.com/tortlepp/BlogBuilder), my new static blog generator (yes - blog, not website) and so far it looks quite promising. I focused on the most important features, such as:

- Simplicity: just one template system, just one input format, no bundled JavaScript libraries
- Clean code: usage of recent Java language features, documentation & comments, code checked with FindBugs, PMD and Checkstyle
- Feature rich: blog posts, normal pages, categories, sitemap generator, ...

At the moment [version 0.5](https://github.com/tortlepp/BlogBuilder/releases/tag/v0.5) of BlogBuilder is ready for testing purposes - you can download it from GitHub. It is almost ready to use, the first stable release 0.6 is already on my agenda (after some more testing). And in the future I plan to do some more releases with some additional features (drafts, FTP publishing, ...).
