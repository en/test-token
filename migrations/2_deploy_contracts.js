var Migrations = artifacts.require("./TestToken.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
