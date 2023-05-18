const findRepeatedElements = (array) => {
    var frequency = {};
    var duplicateElements = [];
  
    for (var i = 0; i < array.length; i++) {
      var currentElement = array[i];
  
      if (frequency[currentElement]) {
        if (frequency[currentElement] === 1) {
          duplicateElements.push(currentElement);
        }
        frequency[currentElement]++;
      } else {
        frequency[currentElement] = 1;
      }
    }
  
    return duplicateElements;
  }
  

  let arr = [1, 2, 3, 4, 2, 3, 5,5];
  let elmentsOccuredMoreThanOnce = findRepeatedElements(arr);
  console.log(elmentsOccuredMoreThanOnce);