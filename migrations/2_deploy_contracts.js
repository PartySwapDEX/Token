const PartyTokenV2 = artifacts.require("PartyTokenV2");

// const OLDPARTY = '0x69A61f38Df59CBB51962E69C54D39184E21C27Ec'; //MAINNET
const OLDPARTY = '0xb68Dd903198339f1818Fb3710AB4Ea2Ff85231B8'; //FUJI
const HOLDER = '0x3b73F15142945f260148aDa3Db15b0657D12831C'; //FUJI
// const HOLDER = '0x81b42dF04Bfd9329Ab897de2aE1b2543d68209Ce'; //MAINNET

module.exports = function (deployer) {
  deployer.deploy(PartyTokenV2, HOLDER, OLDPARTY);
};
