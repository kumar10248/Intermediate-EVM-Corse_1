// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    address public teacher;
    mapping(address => string) private grades;

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can Give the grade to the Student.");
        _;
    }


    constructor() {
        teacher = msg.sender;
    }

    // Function to assign a grade based on marks
    function assignGrade(address student, uint marks) public onlyTeacher {
      
        require(marks >= 0 && marks <= 100, "Marks must be between 0 and 100.");

        // Determine the grade based on the marks
        string memory grade;
        if (marks >= 90) {
            grade = "A+";
        } else if (marks >= 80) {
            grade = "A";
        } else if (marks >= 70) {
            grade = "B+";
        } else if (marks >= 60) {
            grade = "B";
        } else if (marks >= 50) {
            grade = "C";
        } else if (marks >= 40) {
            grade = "D";
        } else {
            grade = "F";
        }

        grades[student] = grade;
    }

    // Function to get the grade of a student
    function getGrade(address student) public view returns (string memory) {
        string memory grade = grades[student];

        // Ensure the grade is not empty
        require(bytes(grade).length > 0, "Student does not have a grade assigned.");
        
        return grade;
    }

    // Function to change the teacher
    function changeTeacher(address newTeacher) public onlyTeacher {
        // Ensure the new teacher address is not zero
        require(newTeacher != address(0), "New teacher's address must be valid.");

        teacher = newTeacher;
    }

    // Function to remove a student's grade
    function removeGrade(address student) public onlyTeacher {
        // Ensure the student has a grade assigned
        string memory grade = grades[student];
        if (bytes(grade).length == 0) {
            revert("Student does not have a grade assigned.");
        }

        delete grades[student];
    }
}
