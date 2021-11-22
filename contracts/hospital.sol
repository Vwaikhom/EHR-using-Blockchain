// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hospital{
    mapping(uint256 => hospital) Hospitals;

    struct hospital{
        string hospital_name;
        string hospital_address;
        string hospital_spec;
    }
    hospital h;

    address owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier isOwner(){
        require(msg.sender == owner, "Access Denied");
        _;
    }

    function register_hospital(uint256 hospital_id, string memory _hospital_name, string memory _hospital_address, string memory _hospital_spec)public isOwner{
        h.hospital_name = _hospital_name;
        h.hospital_address = _hospital_address;
        h.hospital_spec = _hospital_spec;

        Hospitals[hospital_id] = h;
    }


    function get_hospital_details(uint256 hospital_id) public view returns (string memory, string memory, string memory){
        hospital memory viewh = Hospitals[hospital_id];
        return (viewh.hospital_name,viewh.hospital_address,viewh.hospital_spec);
    }
}