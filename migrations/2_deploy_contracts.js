const PartyTokenV2 = artifacts.require("PartyTokenV2");

module.exports = function (deployer) {
  deployer.deploy(PartyTokenV2, '0x81b42dF04Bfd9329Ab897de2aE1b2543d68209Ce');
};
