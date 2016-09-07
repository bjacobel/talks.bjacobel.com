### ES2015 @ edX

![](assets/es2015.png)

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

#### ES2015 is not any of those things.

- the next generation of the Javascript you already know
- works with existing tools, doesn't add any complexity to development process
- All the same stuff you already know how to do, just:
	- cleaner
	- easier
	- more predictable

---

#### Terminology
- ECMAScript is the spec (Python)
- JavaScript is an implementation (CPython, PyPy)
- ES5 is what we write now
- ES2015 is the next jump forward
	- Used to be called ES6, changed to emphasize yearly model
- TC39 will approve ES2016 this fall (not ES7!) <!-- .element: class="fragment" data-fragment-index="2" -->
- Future versions (ES2017), approval/cutoff process <!-- .element: class="fragment" data-fragment-index="3" -->
	- sometimes called ESNext <!-- .element: class="fragment" data-fragment-index="3" -->

---



#### `let` and `const`
```
// ES5
var foo = 'foo';
var bar = 'bar':

foo = 'foo-ish;
bar = 'bar-ish';
```
```
// ES2015
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
// ES5
var foo = 'foo';

if (foo) {
	var foo;  // redefinition?
	foo = 'not foo,';  // am I mutating, or is this foo new?

	var bar = 'bar';  // Should this be local just to this block?
}

console.log(foo, bar);  // ????? "not foo, bar"
```
---

#### `let` and `const`

```
// ES2015
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
// ES5
var string = 'this is a " +	bleep + " dumb way to have to do this';

// ES2015
const string = `I can template ${anything} that implements toString`;
```
---



#### Destructuring and Rest/Spread
```
// ES2015
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
// ES5
var getFoo = function(obj) {
	return obj.foo;
};
```
```
// ES2015
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
// ES5
var render = function() {
	var self = this;

	var beforeRender = function() {
		preprocess(self);
	};
}
```
```
// ES2015
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
// ES5
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
// ES2015
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
- `Array.map`, `.filter`, `.find`, `.includes` (ES2016)
- `for (... of ...)`
- `Map` / `Set`
- default parameters
- Modules
---

#### Browsers

- Browser vendors are slow.
- Most "good" browsers implement 80%+ of ES2015 spec
	- Outliers: Safari 8, IE11
- We can't write ES2015 and ship it to production, _yet_
	- In the meantime, we'll use Babel

---

#### Babel

- "Transpiles" code - e.g., ES2016 into ES5
- uses presets and plugins - target specific features, or a spec version
	- e.g., `babel-preset-es2015` or `babel-plugin-array-includes`
- Tightly integrated with tools like RequireJS, Karma, Webpack, etc
- No compatibility issues with old libraries, because everything runs in ES5
- Sets us up to gradually include features from ES2016 and ESNext

---


#### Community support
- Most industry giants are using ES2015
- Most schools/programs are teaching it
- Most documentation/examples assume you're using it
- Most popular open-source JS tools are written using it
- Most JavaScript engineers are looking for jobs writing it
- Community standard for a year or more, so buying in has effects on:
	- Inclusiveness
	- Hiring
	- edX's image as a technology leader

---


#### Summary
- Not a different language, just a better version of it
- Gradual, compatible upgrade path (we've already started!)
- Lets us build faster, easier, and with less head-scratching
- Aligns us with the community
- Allows us to start reaching towards other modern FE tech like React
- One of the most significant things we can do to modernize front-end tech at edX
