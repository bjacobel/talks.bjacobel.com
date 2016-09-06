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
- TC39 favors year nomenclature to emphasize rolling spec (ECMA-262) <!-- .element: class="fragment" data-fragment-index="4" -->
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

foo = 'foo-ish';	// Still OK, `let` allows reassignment
bar = 'bar-ish';	// `TypeError: Assignment to constant variable.`
```
---
#### `let` and `const`
- Having a constant type is nice
	- Mutation is slow
	- Can catch errors
- Properly scoped (!)

---
#### `let` and `const`

```
// es5
var foo = 'foo';

if (foo) {
	var foo;  // redefinition?
	foo = 'not foo,';  // am I mutating, or is this foo new?

	var bar = 'bar';  // Should this be local just to this function?
}

console.log(foo, bar);  // ????? "not foo, bar"
```
---

#### `let` and `const`

```
// es6
const foo = 'foo';
let bar;

if(foo) {
	const foo = 'not foo!'; // not redefinition - a new `foo` in a new scope ("shadowing")

	const bar = 'bar';
}

console.log(foo, bar);  // foo hasn't changed, bar is scoped properly (ie, undefined here)

```
---




#### Template strings
```
// es5
var string = 'this is a " +	bleep + " dumb way to have to do this';

// es6
const string = `I can template ${anything} that implements toString`;
```
---



#### Destructuring and Rest/Spread
```
// es6
const { foo, bar } = objectWithManyKeys;	// object destructuring

const [first, ...rest] = bigArray;	//array destructuring, rest

const canTakeManyArgs = (...params) => {	// rest
	params.forEach((param) => {
		...
	});
});

requiresFiveArgs(...arrayWithFiveElements);	// spread
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
```
// es5
function Bike(gears) {};
Bike.prototype.shift = function(newGearIndex) {
	...
};

function Fixie() {};
Fixie.prototype = Object.create(Bike.prototype);

var fixie = new Fixie();
fixie.shift();
```
- Non-intuitive and messy.

---
#### Classes
```
// es6
class Bike {
	constructor(...gears) {
		this.gears = gears;
	}

	start() {
		this.currentGear = this.gears[0];
		this.riding = true;
	}

	shift(newGearIndex) {
		this.currentGear = this.gears[newGearIndex];
	}
}

const bike = new Bike(1.5, 2.7, 3.1, 4.2);
bike.start();
bike.shift(2);
```
---
#### Classes
```
class Fixie extends Bike {
	constructor() {
		super(3.4);
	}

	shift() {
		throw new Error("You're on a fixie!");
	}
}

const fixie = new Fixie();
fixie.start();
fixie.shift();	// error!
```

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
- uses presets and plugins - target specific features, or a spec version
	- e.g., `babel-preset-es2015` or `babel-plugin-transform-object-assign`
- Tightly integrated with tools like RequireJS, Karma, Webpack, etc
- No compatibility issues with old libraries, because everything runs in ES5
- Sets us up to gradually include features from ES7 and ESNext

---


#### Community support
- Most industry giants are using ES6
- Most schools/programs are teaching it
- Most documentation/examples assume you're using it
- Most new open-source JS tools are written using it
- Most JavaScript engineers are looking for jobs writing it
- Community standard for a year or more, so buying in has effects on:
	- Inclusiveness
	- Hiring
	- edX's image as a technology leader

---


#### Summary
- Think less Coffeescript, more Python 3 or C++ 14
- Gradual, compatible upgrade path (we've already started!)
- Lets us build faster, easier, and with less head-scratching
- Aligns us with the community
- Allows us to start reaching towards other modern FE tech like React
- One of the most significant things we can do to modernize Javascript at edX
