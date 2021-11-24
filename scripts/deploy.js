const hre = require('hardhat');

async function main() {
  const LITxRewards = await hre.ethers.getContractFactory('LITxRewards');
  const contract = await hre.upgrades.deployProxy(
    LITxRewards, 
    ['0xC45dE4128E3099adF3dbd6b0465b6fED09CE9820']);

  await contract.deployed();

  console.log('LITxRewards deployed to:', contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
