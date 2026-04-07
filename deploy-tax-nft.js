const hre = require("hardhat");

async function main() {
  const NFT = await hre.ethers.getContractFactory("TaxableNFT");
  const nft = await NFT.deploy("Compliance NFT", "TAX");

  await nft.waitForDeployment();
  console.log("Taxable NFT deployed to:", await nft.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
