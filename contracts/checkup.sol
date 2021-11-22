// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract checkup is ERC721{
    mapping(uint256 => tests) patientTests;
    mapping(uint256 => scan) scanResults;
    mapping(uint256 => system) systemExamine;
    mapping(uint256 => prev) prevDates;
    mapping(uint256 => patient) patients;

    struct patient{
        uint256 patient_id;
    } patient p;

    struct prev{
        uint256 patient_id;
        string previous;
    } prev pr;

    struct tests{
        uint256 patient_id;
        string blood_test;
        string urine_test;
        string ecg;
        string mri;
        string ct_scan;
        string xray;
        string lab_tests;
    } tests t;

    struct scan{
        uint256 patient_id;
        string built;
        string nouirishment;
        string eyes;
        string tongue;
        uint64 pulse;
        uint64 temp;
        string blood_pressure;
        uint64 respiratory_rate;
    } scan s;

    struct system{
        uint256 patient_id;
        string cns;
        string cvs;
        string rs;
        string abdomen;
    } system sys;

    address owner;

    constructor() ERC721("MedicalCoin", "MEDC") public{
        owner = 0x38Ff16B90AB4F22336549e12C615Ea5966a64EBD; //hard coding address of doctor;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Access Denied");
        _;
    }

    function namedecl() public view returns(string memory){
        return name();
    }

    function symboldecl() public view  returns (string memory) {
        return symbol();
    }

    // function totalSupplycount() public view  returns (uint256) {
    //      //calling the Built-in function in ERC721
    //     return totalSupply();
    //  }
    // function totalSupplycount() public view  returns (uint256) {
    //     return totalSupply();
    // }

    function medical_record(uint256 patient_id) public{
        _mint(msg.sender, patient_id);

        patients[patient_id] = p;
    }

    function previous_dates(uint256 patient_id, string memory _previous) public isOwner{
        pr.previous = _previous;
        prevDates[patient_id] = pr;
    }

    function get_previous_dates(uint256 patient_id)public view returns (string memory){
        prev memory viewpr = prevDates[patient_id];
        return (viewpr.previous);
    }

    function investigations(uint256 patient_id, string memory _blood_test, string memory _urine_test, string memory _ecg, string memory _mri, 
                            string memory _ct, string memory _x_ray, string memory _lab_results) public isOwner{

        t.blood_test = _blood_test;
        t.urine_test = _urine_test;
        t.ecg = _ecg;
        t.mri = _mri;
        t.ct_scan = _ct;
        t.xray = _x_ray;
        t.lab_tests = _lab_results;

        patientTests[patient_id] = t;
    }

    function get_investigations(uint256 patient_id)public view returns(string memory,string memory,string memory,string memory,string memory,string memory,string memory){
        tests memory viewt = patientTests[patient_id];
        return (viewt.blood_test,viewt.urine_test,viewt.ecg,viewt.mri,viewt.ct_scan,viewt.xray,viewt.lab_tests);
    }

    function general_examin(uint256 patient_id,string memory _built,string memory _nouirishment,string memory _eyes,string memory _tongue,
                            uint64 _pulse,string memory _blood_pressure,uint64 _temp,uint64 _respiratory_rate)public isOwner {
                        
        s.built = _built;
        s.nouirishment = _nouirishment;
        s.eyes = _eyes;
        s.tongue = _tongue;
        s.pulse = _pulse;
        s.blood_pressure = _blood_pressure;
        s.temp = _temp;
        s.respiratory_rate = _respiratory_rate;
              
              
        scanResults[patient_id] = s;
    }

    function get_general_examin(uint256 patient_id)public view returns (string memory,string memory,string memory,string memory,uint64,string memory,uint64,uint64){
              
        scan memory views = scanResults[patient_id];
              
        return (views.built,views.nouirishment,views.eyes,views.tongue,views.pulse,views.blood_pressure,views.temp,views.respiratory_rate);    
              
    }

    function sys_examin(uint256 patient_id,string memory _cvs,string memory _cns,string memory _rs,string memory _abdomen)public isOwner {
              
              
        sys.cvs = _cvs;
        sys.cns = _cns;
        sys.rs = _rs;
        sys.abdomen = _abdomen;
              
              
        systemExamine[patient_id] = sys;
              
    }

    function get_sys_examin(uint256 patient_id)public view returns (string memory,string memory,string memory,string memory){
              
        system memory viewsys = systemExamine[patient_id];
              
        return (viewsys.cvs,viewsys.cns,viewsys.rs,viewsys.abdomen);              
    }
}