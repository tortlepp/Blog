;;title=JavaFX deployment with Gradle
;;created=2016-11-27 17:48
;;category=Java, JavaFX, Gradle

Some weeks ago [I released SimpleTaskList 1.0](2016/simpletasklist_1_0.html). And when I started to prepare the release I also experimented with [JavaFX deployment](https://docs.oracle.com/javase/8/docs/technotes/guides/deploy/self-contained-packaging.html) to release a comfortable installer for Windows users. Basically, I followed the [Part 7 of the JavaFX 8 Tutorial](http://code.makery.ch/library/javafx-8-tutorial/part7/) by Marco Jakob. But I had to do some customizations to run it conjunction with Gradle.

I started with an existing Gradle project, but the "official" build process is based on Apache Ant. So the first thing you needed is the build.xml for the deployment process. If you use Eclipse with the [e(fx)clipse plugin](http://www.eclipse.org/efxclipse/index.html), you can create a new one with the new project wizard. See the tutorial mentioned above for details. Alternatively, you can use my [build.xml](https://github.com/tortlepp/SimpleTaskList/blob/master/fxbuild/build.xml) from SimpleTaskList as a basis.

In the next step I created a new folder `fxbuild` in my project directory and placed the build.xml file in that directory. Very likely you have to adjust some parameters and options in the build.xml now, for example, in many cases the paths to sources, resources, etc. need to be fixed. I recommend to take a good look at the file and its contents.

To create a nice looking installer, we still need two icons, `TheAppName.ico` and `TheAppName-setup-icon.bmp`. In my build.xml I extended the task *setup-staging-area* to copy the icons from a resource directory into `fxbuild/package/windows`. But in my project I stumbled upon the issue, that the installer never used these icons. It turned out that in the task *init-fx-tasks* the `<taskdef>` command used a wrong classpath. After I changed it to `classpath="${basedir}"` it worked like a charm.

Now you need to import the Ant tasks into Gradle. So open your project's build.gradle and add

    ant.importBuild "fxbuild/build.xml"

to the file. In Eclipse you need to refresh the Gradle project now.

Finally, we are ready to launch the deployment process. To do so, you have to run the Ant task *do-deply* from Gradle. The deployment process will take some time, on my machine about 80 seconds. In the fxbuild directory you will find a couple of new directories, the Windows installer is created in `deploy/bundles`.
