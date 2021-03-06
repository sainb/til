// JS Promise Chaining (Promise.then argument returns non Promise value). 

console.log("alias x='node 20181203_Monday/20181203.js'");

// The then method retuns a Promise wich allows for method chaining.

// If the funciton passed as handler to "then" returns a Promice,
// an equivalent "Promise" will be exposed to the subsequent "than" int
// the method chain.  The below snippet simulates
// Asynchronous code with the "setTimeout" function.
// [Saturday example]

// When a value is simply returned from within a "than" handler,
// it will effectively return
// Priomise.resolve(<value returned by whichever handler was called>)

var p2 = new Promise((resolve,reject)=>resolve(1));

p2.then((value)=>{
    console.log(value); // 1
    return value + 1;
}).then((value)=>{
    console.log(`${value} - A synchronous value works`);
});

p2.then(v=>console.log(v));