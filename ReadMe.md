# ErrorHandling Smart Contract

This Solidity smart contract demonstrates basic error handling mechanisms such as `require`, `revert`, and `assert` within the Ethereum Virtual Machine (EVM). It is designed to manage grades for students, allowing only the teacher to assign, change, or remove grades.

## Overview

The `ErrorHandling` contract includes functionalities to assign grades to students based on their marks, retrieve grades, change the teacher, and remove a student's grade. It utilizes Solidity's error handling statements to ensure that only valid operations are performed.

## Features

- **Assign Grades:** Assigns grades to students based on their marks.
- **Retrieve Grades:** Retrieves the grade of a specific student.
- **Change Teacher:** Allows changing the teacher to a new address.
- **Remove Grade:** Removes a student's grade.

## Functions

### `assignGrade(address student, uint marks)`

Assigns a grade to a student based on the marks provided.

- **Parameters:**
  - `student` (address): The address of the student.
  - `marks` (uint): The marks obtained by the student.
- **Error Handling:**
  - Uses `require` to ensure the marks are within the range of 0 to 100.
  - Only the teacher can assign grades.

### `getGrade(address student)`

Retrieves the grade of a specific student.

- **Parameters:**
  - `student` (address): The address of the student.
- **Returns:**
  - `grade` (string): The grade of the student.
- **Error Handling:**
  - Uses `require` to ensure the student has a grade assigned.

### `otherTeacher(address newTeacher)`

Changes the teacher to a new address.

- **Parameters:**
  - `newTeacher` (address): The address of the new teacher.
- **Error Handling:**
  - Uses `require` to ensure the new teacher's address is valid.
  - Only the current teacher can change the teacher.

### `removeGrade(address student)`

Removes the grade of a specific student.

- **Parameters:**
  - `student` (address): The address of the student.
- **Error Handling:**
  - Uses `revert` if the student does not have a grade assigned.
  - Only the teacher can remove grades.

## Deployment

To deploy this contract, ensure you have Truffle and Ganache installed and set up. Compile the contract using `truffle compile` and deploy it to your local Ethereum blockchain using `truffle migrate`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.