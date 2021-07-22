const YAYToken = artifacts.require("YAYToken");

module.exports = function (deployer) {
  deployer.deploy(YAYToken, '0x3b73F15142945f260148aDa3Db15b0657D12831C');
};
