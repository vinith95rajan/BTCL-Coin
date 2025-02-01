const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();  // Get the deployer account

    console.log("Deploying contracts with the account:", deployer.address);

    // ✅ Correct way to get the balance
    const balance = await deployer.provider.getBalance(deployer.address);
    console.log("Account balance:", ethers.formatEther(balance), "ETH");

    // Deploy your contract
    const MyContract = await ethers.getContractFactory("BTCLinkedToken");
    const contract = await MyContract.deploy();
    await contract.waitForDeployment();

    console.log("Contract deployed to:", contract.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
