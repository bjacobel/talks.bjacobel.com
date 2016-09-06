### ES6 @ edX

![](assets/es6.png)

---

#### The JS ecosystem in 2016

- React
- Redux
- Flow
- Jest
- Elm
- Webpack
- CommonJS
- Typescript
- ESLint
- Babel
- Mithril
- Immutable.js
- Vue
- Ramda
- Electron
- JSX
- CSS Modules
- ESNext
- Angular 2

---

"You need to rebuild your app in isomorphic Mithril with pure functional stateless components and IcedLatteScript."

---

... Why?

---

"Because it's the *future*!"

---

#### ES6 is not any of those things.

- the next generation of the Javascript you already know
- works with existing tools, doesn't add any complexity to development process
- All the same stuff you already know how to do, just:
  - cleaner
  - easier
  - more predictable

---

#### Terminology
- ES6 === ECMAScript 6
- === ES2015 === ECMAScript 2015 <!-- .element: class="fragment" data-fragment-index="1" -->
- ES7 === ES2016 <!-- .element: class="fragment" data-fragment-index="2" -->
- ES2016 !== ES6 <!-- .element: class="fragment" data-fragment-index="3" -->
- TC39 favors year nomenclature to emphasize rolling spec <!-- .element: class="fragment" data-fragment-index="4" -->
- Most people in the community call it ES6 <!-- .element: class="fragment" data-fragment-index="5" -->

---



#### `let` and `const`
```
// es5
var foo = 'foo';
var bar = 'bar':

foo = 'foo-ish;
bar = 'bar-ish';
```
```
// es6
let foo = 'foo';
const bar = 'bar';

foo = 'foo-ish';  // Still OK, `let` allows reassignment
bar = 'bar-ish';  // `TypeError: Assignment to constant variable.`
```
---
#### `let` and `const`
- Having a constant type is nice
	- Mutation is slow
	- Can catch errors
- Properly scoped!!!

---
#### `let` and `const`

```
// es5

```
---
#### `let` and `const`

```
// es6

```
---




#### Template strings
```
// es5
var string = "this is a " +  bleep + " dumb way to have to do this";

// es6
const string = `I can template ${anything} that implements toString`;
```
---



#### Destructuring and Rest/Spread
```
// es6
const { foo, bar } = objectWithManyKeys;  // object destructuring

const [first, ...rest] = bigArray;  //array destructuring, rest

const canTakeManyArgs = (...params) => {  // rest
	params.forEach((param) => {
		...
	});
});

requiresFiveArgs(...arrayWithFiveElements);  // spread
```
---



#### Arrow functions
```
// es5
var getFoo = function(obj) {
	return obj.foo;
};
```
```
// es6
const getFoo = (obj) => {
	return obj.foo;
};
```

```
// Shorthand!
const getFoo = obj => obj.foo;
```
<!-- .element: class="fragment" data-fragment-index="1" -->
---
#### Arrow functions

- It's shorter (especially with the shorthand)
- Retains scope of caller for `this`

``` 
// es5
var render = function() {
	var self = this;
  
	var beforeRender = function() {
		preprocess(self);
	};
}
```
```
// es6
const render = () => {
	const beforeRender = () => {
		preprocess(this);
	}  
};
```
<!-- .element: class="fragment" data-fragment-index="1" -->
---



#### Classes

---
#### Classes
- Nothing you couldn't do before
- Cleaner syntax, smoothes over some of the idisyncracies of JS inheritance
- Many libraries have bought heavily into classes

```
import React, { Component } from 'react';

export default class Thing extends Component {
	render() {
		return <h1>{ this.props.thingText }</h1>;
	}
}
```
<!-- .element: class="fragment" data-fragment-index="1" -->
---



#### More highlights

- `Object.keys` / `Object.values`
- `Object.assign`
- `Array.map`, `.filter`, `.find`, `.includes`
- `for (... of ...)`
- `Map` / `Set`
- default parameters
- Modules
---

#### Browsers

- Browser vendors are slow.
- ES6 spec was finalized in 2015, most "good" browsers implement 80%+ of spec
	- Outliers: Safari 8, IE11
- We can't write ES6 and ship it to production, _yet_
	- In the meantime, we'll use Babel

---

#### Babel

- "Transpiles" ES6 into ES5
- uses **presets** - target specific features, or a spec version
- Tightly integrated with tools like [RequireJS](https://github.com/mikach/requirejs-babel), Karma, etc
  - No need to generate .`gitignore`d local files

---


#### Community support
- Most industry giants are using ES6
- Most code schools are teaching it

---


## Summary
- Think less Coffeescript, more Python 3 or C++ 14
- Lets us build faster, easier, and with less head-scratching
- Aligns us with the community
- One of the most significant things we can do to modernize Javascript at edX
