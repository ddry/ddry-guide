# ddry-guide

[![Build Status](https://travis-ci.org/ddry/ddry-guide.svg?branch=master)](https://travis-ci.org/ddry/ddry-guide) [![Coverage Status](https://coveralls.io/repos/github/ddry/ddry-guide/badge.svg?branch=master)](https://coveralls.io/github/ddry/ddry-guide?branch=master) [![dependencies Status](https://david-dm.org/ddry/ddry-guide/status.svg)](https://david-dm.org/ddry/ddry-guide) [![devDependencies Status](https://david-dm.org/ddry/ddry-guide/dev-status.svg)](https://david-dm.org/ddry/ddry-guide?type=dev)

<img src="https://cloud.githubusercontent.com/assets/5163953/22628172/6b91f120-ebe0-11e6-8456-0f5b2dc3a553.png" alt="ddry logo" width="250">

This repo guides you from blank Node JS project to project containing various JS module examples fully covered with [ddry](https://www.npmjs.com/package/ddry) using all of its features. Unified harness-agnostic codebase allows running tests written once on three different test harnesses: [Mocha JS](https://www.npmjs.com/package/mocha), [TAP](https://www.npmjs.com/package/tap) and [Tape JS](https://www.npmjs.com/package/tape). And to start using all these convenient test capabilities you'll need barely more than nothing: add one package to `devDependencies` and create `ddry.json` config file with handy CLI.

### Prerequisites

To get access to `ddry`, `ddry-mocha`, `ddry-tap` and `ddry-tape` shell commands install the core package [ddry](https://www.npmjs.com/package/ddry) and its full `devDependencies` support [ddry-mocha-tape](https://www.npmjs.com/package/ddry-mocha-tape) by:

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

Then we use an easy example module containing basic cases for which earliest [ddry](https://www.npmjs.com/package/ddry) features were written for and our first mock data-driven spec file for [Initial population of `lib` and `spec` folders](https://github.com/ddry/ddry-guide/commit/0da6ef5c4c65f0b9bb591976ddfadf4133fa5f12).

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

Now we have `ddry.json` stating that `spec` is our spec folder and `lib` is our code folder. At the moment the only code module in `lib` is `numbering`, so `spec/numbering` is the folder for this module method specs. We even have `spec/numbering/ordinal.js` file containg the spec of `ordinal` method of this module. Sounds trivially, same as any good convention over configuration. I've heard somewhere that triviality is a backside of wisdom.

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

```
Method method()
  - is not defined in 'Numbering module example'
```

Notices on missing method specs are not provided.

### Injected ddry instance

At last, we are in correctly placed spec file of method defined in existent module. First of all, it is a JS module exporting function where first argument is an injected instance of [ddry](https://www.npmjs.com/package/ddry) core module `index.js`.

Through [ddry](https://www.npmjs.com/package/ddry) codebase it is reffered as `dd` standing for data-driven. It contains some methods we can use for data-driven testing and some data about the whole modular spec suite. At this point methods are much more important than anything else.

And most important of them is definitely `drive` that takes assertion object or array of assertion objects and delivers it to every test harness [ddry](https://www.npmjs.com/package/ddry) knows about in processable form to produce an actual assertion.

Before we dig too deep into it, let's mention `pending` method taking no arguments and simply producing **pending** assertion outputting module title and method it is invoked for. To make a good spec stub clearly reporting its location, create a file this way:

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

### Plain matcher

At this point our mock spec of `ordinal` method is defined this way:

```coffee
'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'plain'
    it: 'really makes a test!'
    i: undefined
    e: undefined
  ]
```

What is a little bit more than self-explaining, it is just cross-harness assertion that `i` (standing for `input`) is deep equal `e` (standing for `expected`) — let's expand these abbreviations one more last time.

However, some features of `plain` matcher are worth mentioning:
- it is the only matcher independent from spec folder convention-over-configuration context;
- it is the only matcher taking `i` without wrapping into array;
- it is the matcher used in `dd.pending` method for [TAP](https://www.npmjs.com/package/tap), unlike the other two harnesses, requires even pending assertion to be defined.

Main purpose of `plain` matcher is supporting the crucial concept that every spec is a normal JS program. Test whatever you get in your usual JS flow, even within [ddry](https://www.npmjs.com/package/ddry) convention-over-configuration context.

### Default matcher

In [Getting real. Introducing sequences](https://github.com/ddry/ddry-guide/commit/4d809fa31ab69c8c60c29f029c2cf3c1ee63102e) first of all we move from `plain` matcher to `default` one.

It takes `i`, **mandatorily wrapped into array**, applies to current module's current method and asserts that exactly `e` is returned _(Looks like we're back again to convention-over-configuration trivialities)_. It is that much completely clear, that I even see no point to describe **mandatory array wrapping of input** concept any more.

### Sequences

_This is definitely ridiculous (or peculiar at least) that whole this [ddry](https://www.npmjs.com/package/ddry) project containing by now over 2.5k of fully test covered lines of code started from refactoring of `ordinal` method spec._

To prevent any confusion, let's explain the **sequence** word usage a little deeper.

**Specs sequence** is an array of assertion objects received by `dd.drive` method.

**Sequence spec** is a special assertion object containing mandatory `it` and `data` properties and optional one `from`.

### Sequence specs

This way, here

```coffee
'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: (i, e) -> "returns #{e} for #{i}"
    data: [ '1st', '2nd', '3rd', '4th' ]
  ,
    it: (i, e) -> "returns #{e} for #{i}"
    from: 11
    data: [ '11th', '12th', '13th' ]
  ,
    it: (i, e) -> "returns #{e} for #{i}"
    from: 21
    data: [ '21st', '22nd', '23rd' ]
  ]
```

we see the _sequence specs sequence_.

To follow this code fragment's **sequence spec** self-explanation, let's state that:
- `it` is a function of `i` and `e` returning assertion message:
- inputs sent to tested method are consecutive indexes starting from 1 or specified `from`;
- range length is defined by expected values array.

I'm aware of generated assertion messages dangers, and thought many times about removing this feature completely. However, in rare cases **sequence specs** may suddenly become handy. Later we'll explore deeper features of **sequence specs**, but now please note that here only really boring input gets omitted, output is set literally. That slightly mitigates assertion message generation risks.

### Specs sequences. Cross-harness x-style skipping and mass-skipping

Let's use this **specs sequence** to learn about `x`-style skipping. It's easy: `xit` will get the assertion skipped on every test harness. You don't have to care how exactly the assertion is to be marked as pending on every certain test harness (take my word for it, it's very different between them), just `x` it. It's time to reveal that **Mocha** style is followed here fully, and `dd.drive` function recognizes also `specify` and `xspecify` keys.

Mass-skipping is much more funny. In **specs sequence** we can set additional options for all the following assertion objects.

If `dd.drive` meets the spec object not containing `it`, `i`, `e` or `it`, `data` key sets, it considers it as shared spec settings object and applies its keys to every valid spec object until the other shared spec settings object is met or **specs sequence** ends. That's how we can set the matcher for all the **specs sequence** once or mass-skip some of them.

Plainly, insert `xit: 0` shared spec settings object to start mass-skipping.

Insert empty object to clear shared spec settings.

Another cool feature of `xit` mass-skipping is that string value of this key will be considered as custom pending message. Or set value of any other type to get default pending message.

To summarize sequences topic, take a look at another sequence spec data format [here](https://github.com/ddry/ddry-guide/blob/e0cf1952026d0a4df5ad8d1a2b69a3df6709df8c/source/spec/numbering/selector.coffee). Please consider this as an answer why `it` key can not be the shared specs setting although **sequence spec** message generators are similar, sometimes identical through **spec sequence**. This would definitely be a major design error.

Also, from this point we'll stop emphasizing sequence specs and spec sequences assuming that differences between them are clear.

### CoffeeScript Sublime Text snippets

Now, when you've hopefully get acquainted with [ddry](https://www.npmjs.com/package/ddry) CoffeeScript code, take a look at [Sublime Text CoffeeScript snippets for ddry](https://github.com/ddry/ddry-sublime-coffee-snippets). We'll be able to install them via `Package Control: Install Package` as soon as my PR gets merged, but at the moment you can manually place them to your User packages.

### Injected target module context

Within spec file you may access target code module this way:

```coffee
'use strict'

module.exports = (dd) ->
  codeModule = dd.that
```

or that:

```coffee
'use strict'

module.exports = (dd, that) ->
  codeModule = that
```

With the power of default matchers set and cross-harness `before` and `after` hooks this is unlikely necessary, but for your JS freestyling you may use the approach you prefer.
