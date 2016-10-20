### ES2015 @ edX

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png)

---

- Overview
- High-level motivations
- Technical exploration
- Path to adoption

---

### Overview: Terminology
- JavaScript is an implementation of the ECMAScript spec
- ES5 (2009) is what we write now
- ES2015 is the next jump forward <!-- .element: class="fragment" data-fragment-index="1" -->
	- Previously called ES6 <!-- .element: class="fragment" data-fragment-index="1" -->
- ES2016, 2017 <!-- .element: class="fragment" data-fragment-index="2" -->

---

### Overview: Guiding principles
- 100% backwards compatibility
- Refine, don't reinvent
- Draw on good ideas from JS community
	- Beefing up stdlib (Underscore) <!-- .element: class="fragment" data-fragment-index="2" -->
	- Need for friendlier inheritance (Coffeescript) <!-- .element: class="fragment" data-fragment-index="3" -->

---

### Overview: History
- Coffeescript 😬😷
	- In use at edX ~2011-2015, currently being removed
	- Promised many of the same things as ES2015
	- Ultimately failed
- ES2015 borrows Coffeescript's best ideas
- Went through the right process, has the community's support

---

### Motivations: Community
- Industry leaders are using ES2015
	- Google, Apple, Facebook, Airbnb, Uber
	- Coursera, Udemy
- Most documentation/examples assume you're using it
- Most JavaScript engineers are looking for jobs writing it
- Community standard for a year or more

---

http://stateofjs.com/2016/flavors/ <!-- .element: class="light" -->

![](https://i.bjacobel.com/20161020-z2uzs.png) <!-- .element: height="85%" -->

---

### Motivations: Development

- Works with existing tools
- Doesn't add any complexity to development process
- Produces code that's:
	- cleaner to read
	- easier to write
	- more predictable to execute

---

## Technical exploration: inside ES2015 <!-- .element: class="imp"-->

---

#### `let` and `const`

```
// ES5
var foo = 'foo';
var bar = 'bar':
```
<!-- .element: class="left-code" -->

```
// ES2015
let foo = 'foo';
const bar = 'bar';
```
<!-- .element: class="right-code" -->

```
foo = 'foo-ish';
bar = 'bar-ish';
```
<!-- .element: class="left-code fragment" data-fragment-index="1" -->

```
// OK, `let` allows reassignment
foo = 'foo-ish';

// `TypeError: Assignment to constant variable.`
bar = 'bar-ish';
```
<!-- .element: class="right-code fragment" data-fragment-index="1" -->

---

#### `let` and `const`
- Having a constant type is nice
	- Could catch an error
- Properly block-scoped (!)

![](https://i.bjacobel.com/20161020-i1w9p.png) <!-- .element: height="450px" -->

---

#### `let` and `const`

```
// ES5
var foo = 'foo';

if (true) {
	var foo = 'bar'
}

console.log('foo is', foo);
// ->> foo is bar
// ??!!!!
```
<!-- .element: class="left-code" -->

```
// ES2015
let foo = 'foo';

if (true) {
	let foo = 'bar';
}

console.log('foo is', foo);
// ->> foo is foo
// 👌
```
<!-- .element: class="left-code" -->

---

#### Arrow functions
```
// ES5
var getFoo = function(obj) {
	return obj.foo;
};
```
<!-- .element: class="left-code" -->

```
// ES2015
const getFoo = (obj) => {
	return obj.foo;
};
```
<!-- .element: class="right-code"-->

```
// Shorthand!
const getFoo = obj => obj.foo;
```
<!-- .element: class="right-code fragment" data-fragment-index="1" -->

---
#### Arrow functions

- It's shorter (especially with the shorthand)
- Pass `this` lexically, removes a major source of confusion

```
// ES5
var render = function() {
	var self = this;

	var beforeRender = function() {
		preprocess(self);
	};
}
```
<!-- .element: class="left-code"-->

```
// ES2015
const render = () => {
	const beforeRender = () => {
		preprocess(this);
	}
};
```
<!-- .element: class="right-code"-->

---

#### Template strings
```
// ES5
var site = 'edx.org';
var name = 'Brian';
console.log('Welcome to ' + site + ', ' + name + '!');

// ES2015
const site = 'edx.org';
const name = 'Brian';
console.log(`Welcome to ${site}, ${name}!`);
```

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
- Functions and prototypes?
- Non-intuitive and messy.
- Especially bad in our CS->JS Backbone code

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
}

class Fixie extends Bike {
	constructor() {
		super(3.4);
	}
}

const fixie = new Fixie();
fixie.start();
```

---

#### Classes
- Nothing you couldn't do before
- Cleaner syntax, smoothes over some of the idiosyncrasies of JS inheritance
- Implications for how we write UI
	- `Backbone.View`
	- `React.Component`

---

#### More goodies, further reading
![](https://cdn-images-1.medium.com/max/800/1*v9AT7ZaJc6fR2MjYljGEzg.png) <!-- .element: height="100px" -->

- [Rest](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) and [spread](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)
- [`Object.assign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)
- [`Array.prototype.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find), [`.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes)
- [`for (... of ...)`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of)
- [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) / [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set)
- [Default parameters](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)

---

#### Path to Adoption: Browsers

- Browser vendors are slow.
- Most "good" browsers implement 90%+ of ES2015 spec
	- Outliers in [edX support](http://edx.readthedocs.io/projects/edx-guide-for-students/en/latest/front_matter/browsers.html): Safari 9 (50%), IE11 (10%)
- We can't write ES2015 and ship it to production, _yet_
	- In the meantime, we'll use Babel

http://kangax.github.io/compat-table/es6/ <!-- .element: class="light" -->
![](https://i.bjacobel.com/20161020-4iigs.png)

---

### Path to Adoption: Babel

- "Transpiles" ES2015 into ES5
- Tightly integrated with tools like RequireJS, Karma, Webpack, etc
- No compatibility issues with old libraries, because everything runs in ES5
- Removable once browser support reaches Good Enough (late 2017)

![](https://raw.githubusercontent.com/babel/logo/master/babel.png) <!-- .element: height="300px" -->

---

### Path to Adoption: Next Steps

- Get involved!
	- Start learning ES2015: https://babeljs.io/docs/learn-es2015/
	- Give feedback on new styleguide version
	- Use ES2015 for new code
- ES2015 already supported:
	- edx-ecommerce
- ES2015 support WIP:
	- edx-ui-toolkit
	- edx-pattern-library
	- edx-platform
- Talk to your local friendly FedX rep

---

### Summary
- Not a different language, just a better version of it
- Gradual, compatible upgrade path (we've already started!)
- Build faster, easier, and with less head-scratching
- Aligns us with the community
- One of the most significant things we can do to modernize front-end tech at edX

---

## Questions?
<!-- .element: class="imp" -->

