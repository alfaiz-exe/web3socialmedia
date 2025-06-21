const hre = require("hardhat");

async function main() {
  const Web3SocialMedia = await hre.ethers.getContractFactory("Web3SocialMedia");
  const contract = await Web3SocialMedia.deploy();

  await contract.deployed();

  console.log(`Web3SocialMedia deployed to: ${contract.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
