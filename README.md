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

And that is where we smoothly come from getting started to main features.

### Sequences

_This is definitely ridiculous (or peculiar at least) that whole this [ddry](https://www.npmjs.com/package/ddry) project containing by now over 2.5k of fully test covered lines of code started from refactoring of `ordinal` method spec._
