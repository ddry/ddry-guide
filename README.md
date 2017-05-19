# ddry-guide

[![Build Status](https://travis-ci.org/ddry/ddry-guide.svg?branch=master)](https://travis-ci.org/ddry/ddry-guide) [![Coverage Status](https://coveralls.io/repos/github/ddry/ddry-guide/badge.svg?branch=master)](https://coveralls.io/github/ddry/ddry-guide?branch=master) [![dependencies Status](https://david-dm.org/ddry/ddry-guide/status.svg)](https://david-dm.org/ddry/ddry-guide) [![devDependencies Status](https://david-dm.org/ddry/ddry-guide/dev-status.svg)](https://david-dm.org/ddry/ddry-guide?type=dev)

<img src="https://cloud.githubusercontent.com/assets/5163953/22628172/6b91f120-ebe0-11e6-8456-0f5b2dc3a553.png" alt="ddry logo" width="250">

This repo guides you from blank Node JS project to project containing various JS module examples fully covered with [ddry](https://www.npmjs.com/package/ddry) using all of its features. Unified harness-agnostic codebase allows running tests written once on three different test harnesses: [Mocha JS](https://www.npmjs.com/package/mocha), [TAP](https://www.npmjs.com/package/tap) and [Tape JS](https://www.npmjs.com/package/tape). And to start using all these convenient test capabilities you'll need barely more than nothing: add one package to `devDependencies` and create `ddry.json` config file with handy CLI.

### Prerequisites

To get access to `ddry`, `ddry-mocha`, `ddry-tap` and `ddry-tape` shell commands install the core package [ddry](https://www.npmjs.com/package/ddry) and its full `devDependcies` support [ddry-mocha-tape](https://www.npmjs.com/package/ddry-mocha-tape) by:

```sh
$ npm i -g ddry
$ npm i -g ddry-mocha-tape
```

You'll be able to run your data-driven specs against three JS testing harnesses. That probably may be useful to validate your preferences. However, if you already know, which harness you'll **never** use, there are single-harness packages [ddry-mocha](https://www.npmjs.com/package/ddry-mocha), [ddry-tap](https://www.npmjs.com/package/ddry-tap) and [ddry-tape](https://www.npmjs.com/package/ddry-tape).

Also this project uses global installation of [CoffeeScript](https://www.npmjs.com/package/coffee-script), so please provide it:

```sh
$ npm i -g coffee-script
```

### Getting started

Now you're set and ready to follow the easy steps distributed by commits of this repo quite gradually and mostly self-explaining.

```sh
$ npm init
$ npm i ddry-mocha-tape --save-dev
```

look very clear and familiar, so let's take our first stop for explaining at [Add Makefile](https://github.com/ddry/ddry-guide/commit/61b7b07166ee771bf3eaf184062f6e225f2d5fb6), where we see:

- the basic project watcher on `make c-w` command (use `make c-` to just compile the source);
- test-related harness-specific tasks relying on local `devDependencies`;
- and, most important of all, using `./node_modules/ddry/ddry.js` as service endpoint.

Then we use an easy example module containing basic cases for which earliest [ddry](https://www.npmjs.com/package/ddry) features was written for and our first mock data-driven spec file for [Initial population of `lib` and `spec` folders](https://github.com/ddry/ddry-guide/commit/0da6ef5c4c65f0b9bb591976ddfadf4133fa5f12).

And start [ddry](https://www.npmjs.com/package/ddry) magic of initializing the spec suite config file `ddry.json` by simply giving the specs folders path, target code folder path and the suite title to `ddry i` command:

```sh
$ ddry i spec/ lib/ 'ddry guide test suite'
```

Resulting config file can suddenly be seen [here](https://github.com/ddry/ddry-guide/commit/47e30020fae390209076e2dfaf1f37e1de1cd061).

Among obvious things we can see here the recognizable by `ddry titles` or `ddry t` command module title format, i.e. first block comment:

CoffeeScript:
```coffee
###
# Numbering module example
###
```

or JavaScript:
```js
/*
 * Numbering module example
 */
```

Just to say it clearly: at this point we can run our minimum viable spec suite by `make` tasks `mocha`, `tap` and `tape` against corresponding test harness and with `test` against all of them. Shell commands `ddry-mocha`, `ddry-tap` and `ddry-tape` without parameters will produce the same results.

And that is where we smoothly come from getting started to main features.

### Convention over configuration spec folder structure

Now we have `ddry.json` stating that `spec` is out spec folder and `lib` is our code folder. At the moment only code module in `lib` is `numbering`, so `spec/numbering` is the folder for this module method specs. We even have `spec/numbering/ordinal.js` file containg the spec of `ordinal` method of this module. Sounds trivially, same as any good convention over configuration. I've heard somewhere that triviality is a backside of wisdom.

However, let's mention some features of [ddry](https://www.npmjs.com/package/ddry) behavior regarding misplaced spec folder files or folders.

Spec folder of non-existent module will simply be ignored.

Non-existent spec folder for existing module (named e.g. `exists`) will result in pending spec stating

```
Module 'exists' folder missing
  - Directory 'node_modules/spec/exists' does not exist.
```

Mentioning of `node_modules` in error message reveals failing paths lookup order.

Empty module spec folders will also be mentioned this way.

Inside the folder of existing module file for method that is not defined (named e.g. `method`) will result in pending spec stating

Notices on missing method specs are not provided.

```
Method method()
  - is not defined in 'Numbering module example'
```

### Injected ddry instance

At last, we are in correctly placed spec file of method defined in existent module. First of all, it is a JS module exporting function where first argument is injected instance [ddry](https://www.npmjs.com/package/ddry) of core module `index.js`.

Through [ddry](https://www.npmjs.com/package/ddry) codebase it is reffered as `dd` standing for data-driven. It contains some methods we can use for data-driven testing and some data about the whole modular spec suite. At this point methods are much more important than anything else.

And most important of them is definitely `drive` that takes assertion object or array of assertion objects and delivers it to every test harness [ddry](https://www.npmjs.com/package/ddry) knows about in processable form to produce an actual assertion.

Before we dig too deep into it, let's mention `pending` method that takes no arguments and simply produces **pending** assertion outputting module title and method it is invoked for. To make a good spec stub clearly reporting its location, create file this way:

```coffee
'use strict'

module.exports = (dd) ->
  dd.drive [
    dd.pending()
  ]
```

At this point, being saved as `source/spec/numbering/range.coffee`, compiled to `spec/numbering/range.js` it will produce

```
range()
  - pending: Numbering module example: range()
```

That output may be handy if you have several spec stubs.

### CoffeeScript Sublime Text snippets

Take a look at [Sublime Text CoffeeScript snippets for ddry](https://github.com/ddry/ddry-sublime-coffee-snippets). We'll be able to install them via `Package Control: Install Package` as soon as my PR gets merged, but at the moment you can place them to your User packages.

### Sequences

_This is definitely ridiculous (or peculiar at least) that whole this [ddry](https://www.npmjs.com/package/ddry) project containing by now over 2.5k of fully test covered lines of code started from refactoring of `ordinal` method spec._
