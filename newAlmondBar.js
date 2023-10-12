require('dotenv').config({path: "/home/bevel-user/bevel-samples/examples/supplychain-app/besu/smartContracts/.env"});
const Web3 = require('web3');
const fs = require('fs');
var bodyParser = require('body-parser');

// Connect to Besu Node
const web3 = new Web3(process.env.MANUFACTURER_RPC);

// Load the Contract ABI and Contract Address
const contractAbi = JSON.parse(fs.readFileSync(process.env.ABI_PATH, 'utf8'));
const contractAddress = process.env.CONTRACT_ADDR;

// Define which node is calling the function
const fromAddress = process.env.MANUFACTURER_ADDR;
// Set private key value to the private key on the node calling the function
const privateKey = process.env.MANUFACTURER_KEY;

// Define Almond Chocolate Bar
let chocolateAlmond = {
    productName: "Almond Chocolate Bar",
    misc: [
        "nuts: true"
    ],
    trackingID: process.env.ALMOND_TRACKING_ID,
    participants: [process.env.CARRIER_ADDR + ',' + process.env.CARRIER, process.env.STORE_ADDR + ',' + process.env.STORE, process.env.MANUFACTURER_ADDR + ',' + process.env.MANUFACTURER],
    lastScannedAt: process.env.MANUFACTURER
}


// Initialize the Contract Instance
const contract = new web3.eth.Contract(contractAbi, contractAddress);

// Create data for transaction
const myData = contract.methods.addProduct(chocolateAlmond.trackingID, chocolateAlmond.productName, "health", chocolateAlmond.misc, chocolateAlmond.lastScannedAt,chocolateAlmond.participants).encodeABI();

// Call transaction
web3.eth.getTransactionCount(fromAddress).then(txCount => {
    // Create transaction object
    const txObject = {
      nonce: web3.utils.toHex(txCount),
      to: contractAddress,
      value: '0x00',
      gasLimit: web3.utils.toHex(2100000),
      gasPrice: web3.utils.toHex(web3.utils.toWei('0', 'gwei')),
      data: myData  
    }
    // Sign transaction with the node's private key
    web3.eth.accounts.signTransaction(
        txObject,
        privateKey
    ).then(signedTx => {
        // Send signed transaction to the network
        web3.eth.sendSignedTransaction(
            signedTx.rawTransaction
        ).then( receipt => {
            console.log({TransactionReceipt: receipt});
        })
        .catch(e => {
            console.error('Error while creating product: ', e);
        });
    })
});


// Execute the function
web3.eth.getTransactionCount(fromAddress);