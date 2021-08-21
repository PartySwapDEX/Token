const PartyToken = artifacts.require("PartyToken");

module.exports = function (deployer) {
  deployer.deploy(PartyToken, '0x3b73F15142945f260148aDa3Db15b0657D12831C');
};
