const PartyToken = artifacts.require("PartyToken");

module.exports = function (deployer) {
  deployer.deploy(PartyToken, '0x81b42dF04Bfd9329Ab897de2aE1b2543d68209Ce');
};
