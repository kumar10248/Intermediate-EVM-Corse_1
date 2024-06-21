// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    address public teacher;
    mapping (address => uint) private grades;

    // Modifier to restrict access to the teacher only
    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this action.");
        _;
    }

    // Constructor to set the teacher's address
    constructor() {
        teacher = msg.sender;
    }

    // Function to assign a grade to a student
    function assignGrade(address student, uint grade) public onlyTeacher {
        // Ensure the grade is between 0 and 100
        require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100.");

        grades[student] = grade;
    }

    // Function to get the grade of a student
    function getGrade(address student) public view returns (uint) {
        uint grade = grades[student];

        // Ensure the grade is valid (this is more of an example, as the grade range is already checked)
        assert(grade <= 100);

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
        if (grades[student] == 0) {
            revert("Student does not have a grade assigned.");
        }

        delete grades[student];
    }
}
