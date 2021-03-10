// Phase 1

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

// console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

// Phase 2

function fizzBuzz(array) {
  let arr = [];
  for (let i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0) ^ (array[i] % 5 === 0)) {
      arr.push(array[i])
    }
  }
  return arr;
}

// console.log(fizzBuzz([1, 3, 5, 6, 10, 15]));

function isPrime(number) {
  if (number < 2) return false;
  for (let i = 2; i < number; i++) {
    if (number % i === 0) return false;
  }
  return true;
}

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumOfNPrimes(n){
  let sum = 0;
  let count = 0;
  let i = 2;
  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
