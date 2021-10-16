const PartyTokenV2 = artifacts.require("PartyTokenV2");

const OLDPARTY = '0xb68Dd903198339f1818Fb3710AB4Ea2Ff85231B8';

module.exports = function (deployer) {
  deployer.deploy(PartyTokenV2, '0x3b73F15142945f260148aDa3Db15b0657D12831C', OLDPARTY);
};
