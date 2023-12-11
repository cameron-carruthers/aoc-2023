const fs = require('node:fs');

const calibrateCalibrationValue = (word) => {
  const letterMap = {
    o: [['ne', 1]],
    t: [['wo', 2], ['hree', 3]],
    f: [['our', 4], ['ive', 5]],
    s: [['ix', 6], ['even', 7]],
    e: [['ight', 8]],
    n: [['ine', 9]]
  }

  const { firstNumber, lastNumber } = word.split('').reduce((acc, curr, i) => {
    // Check for integers
    const exp = new RegExp('[0-9]');
    if (exp.test(curr)) {
      acc.lastNumber = curr;
      if (!acc.firstNumber) {
        acc.firstNumber = curr;
      }
    }
    // Check for word letters
    if (letterMap[curr]) {
      letterMap[curr].forEach((possibleWord) => {
        if (possibleWord[0] === word.slice(i + 1, i + 1 + possibleWord[0].length)) {
          acc.lastNumber = possibleWord[1];
          if (!acc.firstNumber) {
            acc.firstNumber = possibleWord[1];
          }
        }
      })
    }
    return acc;
  }, { firstNumber: null, lastNumber: null });

  return `${firstNumber}${lastNumber}`
}

const calculateSum = (input) => {
  const words = input.split('\n');

  return words.reduce((acc, curr) => {
    const calibrationValue = calibrateCalibrationValue(curr);
    acc += Number(calibrationValue);
    return acc;
  }, 0)
}

try {
  const input = fs.readFileSync('day_one/input.txt', 'utf8');54094
  const result = calculateSum(input);
  console.log({ result });
} catch (err) {
  console.error(err);
}