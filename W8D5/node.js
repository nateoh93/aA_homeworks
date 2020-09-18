// Tea and Biscuits

// const readline = require('readline');

// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

// function teaBiscuits() {
//     reader.question('Would you like some tea?', function(results) {
//         console.log(`You replied ${results}`);
        
//         reader.question('Would you like some biscuits?', function(results2) {
//             console.log(`You replied ${results2}`);

//             first_res = (results === 'yes') ? 'do' : 'don\'t';
//             second_res = (results2 === 'yes') ? 'do' : 'don\'t';
    
//             console.log(`So you ${first_res} want tea and you ${second_res} want biscuits.`);
//             reader.close();
//         });
//     });

// }

// teaBiscuits();


function Cat() {
    this.name = 'Markov';
    this.age = 3;
}

function Dog() {
    this.name = 'Noodles';
    this.age = 4;
}

Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();

// Noodles.chase(Markov);
// Noodles.chase.call(Markov, Noodles);
// Noodles.chase.apply(Markov, [Noodles]);