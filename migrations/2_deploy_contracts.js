const Migrations = artifacts.require("Migrations");
const hospital = artifacts.require("hospital");
const doctor = artifacts.require("doctor");
const patient = artifacts.require("patient");
const checkup = artifacts.require("checkup");
const records = artifacts.require("records");


module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(hospital);
  deployer.deploy(doctor);
  deployer.deploy(patient);
  deployer.deploy(checkup);
  deployer.deploy(records);
};