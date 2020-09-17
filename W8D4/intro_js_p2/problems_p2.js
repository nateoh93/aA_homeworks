// titleize

var titleize = function(arr, cb) {
    let newArr = arr.map(name => `Mx. ${name} Jingleheimer Schmidt`);

    cb(newArr);
}

// titleize(["Mary", "Brian", "Leo"], (names) => {
//     names.forEach(name => console.log(name));
// })

// constructors

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRR!!!!!!!!'`)
}

Elephant.prototype.grow = function() {
    this.height = this.height + 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    let randTrick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
    console.log(`${this.name} is ${randTrick}`)
}

// let dumbo = new Elephant('dumbo', 60, ['fly', 'fart', 'poop']);

// dumbo.trumpet();
// dumbo.grow();
// console.log(dumbo.height);
// dumbo.addTrick('shower');
// console.log(dumbo.tricks);
// dumbo.play();

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
    console.log(`${elephant.name} is trotting by!`);
}

// herd.forEach(elephant => Elephant.paradeHelper(elephant));

var dinerBreakfast = function() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);
    
    return function(food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    }
}

let bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please"
bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."