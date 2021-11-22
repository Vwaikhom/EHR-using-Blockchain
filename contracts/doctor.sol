// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Doctor{
    mapping(uint256 => doctor) doctors;

    struct doctor{
        string doctor_name;
        string doctor_spec;
        string doctor_aadhar;
        string doctor_address;
    }
    doctor d;

    address owner;

    constructor() public{
        owner = 0x9b5390DFB6A50AE586942c5984BDB8Bf147d82cE; //hard coding address of hospital  
    }

    modifier isOwner(){
        require(msg.sender == owner, "Access Denied");
        _;
    }

    function register_doctor(uint256 doctor_id, string memory _doctor_name, string memory _doctor_spec, string memory _doctor_aadhar, string memory _doctor_address)public isOwner{
        d.doctor_name = _doctor_name;
        d.doctor_spec = _doctor_spec;
        d.doctor_aadhar = _doctor_aadhar;
        d.doctor_address = _doctor_address;

        doctors[doctor_id] = d;
    }

    function get_doctor_details(uint256 doctor_id) public view returns (string memory, string memory, string memory, string memory){
        doctor memory viewd = doctors[doctor_id];
        return(viewd.doctor_name,viewd.doctor_spec,viewd.doctor_address,viewd.doctor_address);
    }
}