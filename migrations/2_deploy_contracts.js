const PartyTokenV2 = artifacts.require("PartyTokenV2");

module.exports = function (deployer) {
  deployer.deploy(PartyTokenV2, '0x3b73F15142945f260148aDa3Db15b0657D12831C');
};
