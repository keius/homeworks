function fizzbuzz(array) {
  const result = []
  array.forEach (el => {
    if ((el%3 === 0) ^ (el%5 === 0)) {
      result.push(el);
    }
  })
  return result
}

function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes (n) {
  let sum = 0
  let num = 2
  let count = 0

  while (count < n) {
    if isPrime(num) {
      sum += num;
      count++;
    }
    num++;
  }

  return sum;
}
