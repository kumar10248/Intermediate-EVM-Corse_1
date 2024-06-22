// Three Error Handling Function in Solidity 
//Require
//Assert
//Revert

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    address public teacher;
    mapping(address => string) public  grades;

    modifier Teacher() {
        require(msg.sender == teacher, "Only the teacher can Give the grade to the Student.");
        _;
    }


    constructor() {
        teacher = msg.sender;
    }

  
    function assignGrade(address student, uint marks) public Teacher {
      
        require(marks >= 0 && marks <= 100, "Marks must be between 0 and 100.");

        string memory grade;
        if (marks >= 95) {
            grade = "A+";
        } else if (95 > marks && marks >= 90) {
            grade = "A";
        } else if ( 90> marks && marks >= 80) {
            grade = "B+";
        } else if ( 80> marks &&marks >= 70) {
            grade = "B";
        } else if (70> marks &&marks >= 60) {
            grade = "C+";
             } else if (60> marks &&marks >= 50) {
            grade = "C";
        } else if (50 > marks &&marks >= 40) {
            grade = "D";
        } else {
            grade = "F";
        }

        grades[student] = grade;
    }

    function getGrade(address student) public view returns (string memory) {
        string memory grade = grades[student];

     
        require(bytes(grade).length > 0, "Student does not have a grade assigned.");
        
        return grade;
    }

  
    function otherTeacher(address newTeacher) public Teacher {
        // Ensure the new teacher address is not zero
        require(newTeacher != address(0), "New teacher's address must be valid.");

        teacher = newTeacher;
    }


    function removeGrade(address student) public Teacher {
     
        string memory grade = grades[student];
        if (bytes(grade).length == 0) {
            revert("Student does not have a grade assigned.");
        }

        delete grades[student];
    }
}
