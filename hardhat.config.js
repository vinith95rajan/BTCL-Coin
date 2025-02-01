
require("@nomicfoundation/hardhat-ethers");
require("@nomicfoundation/hardhat-toolbox");



module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    sepolia: {
      url: 'https://eth-sepolia.g.alchemy.com/v2/IIhJHf22ayN2SbzDCyOsqr-eacVEgpx5', // Ensure this is correct
      accounts: ['00757d300a4b4bc35fc5ea9590beac74bc2a942909337c7be02885ae45350d7b'], // Ensure your private key is correct
    },
  },
};
