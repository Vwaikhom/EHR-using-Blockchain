// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Patient{
    mapping(uint256 => patient) patients;
    mapping(uint256 => attendant) attendants;

    struct patient{
        string patient_name;
        uint256 age;
        string gender;
        string height;
        uint256 weight;
        string patient_address;
        uint256 phone_no;
        string email_id;
        uint256 date;
        uint256 doctor_id;
        uint256 hospital_id;
    } patient p;

    struct attendant{
        uint256 patient_id;
        string attendant_name;
        string attendant_relation;
        uint256 attendant_phn_no;
    } attendant a;

    address owner;

    constructor() public{
        owner = 0x9b5390DFB6A50AE586942c5984BDB8Bf147d82cE; //hard coding address of hospital
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access Denied");
        _;
    }

    function store_patient_details(uint256 patient_id,string memory _patient_name,uint256 _age,string memory _gender,string memory _height,
                                  uint256 _weight,string memory _patient_address,uint256 _phone_no,string memory _email_id,uint256 _date)public isOwner {
                                      
        p.patient_name=_patient_name;
        p.age=_age;
        p.gender=_gender;
        p.height=_height;
        p.weight=_weight;
        p.patient_address=_patient_address;
        p.phone_no=_phone_no;
        p.email_id=_email_id;
        p.date=_date;
         
        patients[patient_id] = p;
    }

    function store_attendant_details(uint256 patient_id,string memory _attendant_name,string memory _attendant_relation, uint256 _attendant_phn_no)public isOwner {
         
        a.patient_id = patient_id;
        a.attendant_name=_attendant_name;
        a.attendant_relation=_attendant_relation;
        a.attendant_phn_no=_attendant_phn_no;
         
        attendants[patient_id] = a;
    }

    function retreive_patient_details(uint256 patient_id) public view returns (string memory,uint256,string memory,string memory,uint256,string memory,uint256,string memory,uint256){
        patient memory viewp = patients[patient_id];
         
        return (viewp.patient_name,viewp.age,viewp.gender,viewp.height,viewp.weight,viewp.patient_address,viewp.phone_no,viewp.email_id,viewp.date);
    
     }
     
    function retreive_attendant_details(uint256 patient_id) public view returns (string memory,string memory,uint256){
         
        attendant memory viewa = attendants[patient_id];
          
        return (viewa.attendant_name,viewa.attendant_relation,viewa.attendant_phn_no);
     
    }
}