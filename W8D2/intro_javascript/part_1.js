function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// in block; in block

function mysteryScoping2() {
    debugger
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// in block; out block

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// syntax error

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// in block; out block

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}

// syntax error

function madLib(verb, adj, noun) {
    return 'We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}';
}

function isSubstring(searchString, subString) {
    return searchString.includes(subString);
}

function fizzBuzz(array) {
    var newArr = []
    array.forEach(el => {
        if (el % 3 == 0) || (el % 5 == 0) && !((el % 3 == 0) && (el % 5 == 0)) {
            newArr.push(el);
        }
    });
}

function isPrime(n) {
    if n < 2 {
        return false;
    }

    for (let i = 2; i < n; i++) {
        if (n % i == 0) {
            return false;
        }
    }

    return true;
}