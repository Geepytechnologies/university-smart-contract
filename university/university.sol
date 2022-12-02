// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract University {
    address payable public registrar;
    address public VC;
    uint public numofstudents;
    address[] public admittedstudents;
    uint256 public schoolfees = 1.5 ether;
    uint256 public registrarsalary = 2 ether;
    uint256 public HODsalary = 1.5 ether;
    uint256 public lecturersalary = 1 ether;


    struct lecturer {
        string name;
        string department;
        bool hod;
        string faculty;
        bool dean;
        bool courseAdviser;
        uint yearofstudents; 
    }

    struct student{
        string name;
        uint256 regnumber;
        string faculty;
        string department;
        bool feespaid;
        bool active;
        bool courseRep;
        uint256 yearOfAdmission;
        uint256 yearOfGraduation;
        uint256 GradePoint;
    }
    mapping(address => student) public students;
    mapping(address => lecturer) public lecturers;

    event feespaid(address indexed from, uint256 amount);

    

    constructor(address payable _registrar){
        registrar = _registrar;
        VC = msg.sender;
    }
    function addLecturer(address _addr, string memory name, string memory department, bool hod, string memory faculty, bool dean, bool courseAdviser, uint yearofstudents) public {
      lecturers[_addr] =  lecturer(name, department, hod, faculty, dean, courseAdviser, yearofstudents);
    }

    function addStudent(string memory _name, uint256 _regnumber, string memory _department, address _addr, uint256 _yearOfAdmission) public {
        students[_addr].name = _name;
        students[_addr].regnumber = _regnumber;
        students[_addr].department = _department;
        students[_addr].feespaid = false;
        students[_addr].active = true;
        students[_addr].courseRep = false;
        students[_addr].yearOfAdmission = _yearOfAdmission;
        students[_addr].yearOfGraduation = _yearOfAdmission + 4;
        students[_addr].GradePoint = 0;
        admittedstudents.push(_addr);
        numofstudents++;
        
    }

    function admitted(address _from) public view returns (bool){
        for (uint i = 0; i < admittedstudents.length; i++) {
            if (admittedstudents[i] == _from) {
                return true;
            }
    }
    return false;
    }

    function paySchoolFees (address _from) payable external{
       require(admitted(_from) == true, "you have not been admitted");
       emit feespaid(_from, msg.value);
       students[_from].feespaid = true;
    }
    
    function payregistar() payable external {
        require(VC == msg.sender, "You are not the VC");
        require(address(this).balance >= registrarsalary, "Insufficient Funds");
        
    }

}