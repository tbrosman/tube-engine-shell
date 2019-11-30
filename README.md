# Overview

This project demonstrates a pattern for structuring Heaps projects and Haxe projects in general. Features:

* Multiple apps building in the same repo. Useful if you have many small example apps.
* Patterns for adding new app builds and wiring them up through VS Code. Take a look at the files in .vscode/* for details.
* Demonstrates Javascript and HashLink builds for Heaps projects, as well as a method for organizing common dependencies shared by apps.
* Build/run target for tests. Uses hx3compat by default.

# Dependency Management

We have been using local haxelibs for everything. While not strictly required, it is cleaner than a global haxelib repo. To install dependencies locally:

```
haxelib newrepo
haxelib install ./haxelib.json
```

haxelib-hashlink.json contains all HashLink-specific dependencies, and is excluded from the set of transitive dependencies a consumer inherits. This is useful if the consumer is a non-HashLink app (e.g. Javascript). Note that it cannot be installed directly because it is not named `haxelib.json` (this is a "special" name in haxelib). Either move the file to `./temp/haxelib.json` and install it from there or install the dependencies manually.