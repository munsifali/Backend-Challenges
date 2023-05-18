/* Iterate over the  array
If the owner doesn't exist in the result object, create a new array
Push the file into the owner's array
*/
const groupByOwnersService = (fileOwners) =>{
    var result = {};
    for (var file in fileOwners) {
      var owner = fileOwners[file];

      if (!result[owner]) {
        result[owner] = [];
      }
      result[owner].push(file);
    }
    return result;
  }
  
  let fileOwners = {
    "insurance.txt": "Company A",
    "letter.docx": "Company A",
    "Contract.docx": "Company B"
  };
  
  let groupedFiles = groupByOwnersService(fileOwners);
  console.log(groupedFiles);