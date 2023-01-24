require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
    solidity: "0.8.17",
    networks: {
        goerli: {
            url: process.env.QUICKNODE_API_KEY_URL,
            accounts: [process.env.GOERLI_PRIVATE_KEY],
        },
        mainnet: {
            chainId: 1,
            url: process.env.PROD_QUICKNODE_KEY,
            accounts: [process.env.PRIVATE_KEY],
        },
    },
};
