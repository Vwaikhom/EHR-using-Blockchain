# EHR-using-Blockchain
A blockchain based EHR (Electronic Health Record) management system implemented using smart contracts in Ethereum.
Three agents viz. hospital, doctor and patient are the actors of this project. The medical records of a patient are recorded and stored using smart contracts.
ERC 721 NFT is used to mint the record to the particular patient ID so as to give a uniqueness to every patient record.
## How to run this project.
* Clone this repository in your local machine. 
* Run ```npm install``` to install all the node modules.
* Download ganache and create a new workspace.
* Install truffle suite.
* Install metamask in your chrome browser.
* Open your truffle cli by running this command ```truffle develop```
* To compile and migrate the contracts, run this command from your truffle cli ```truffle migrate``` 
* Note down the contract addresses by running this command ```networks``` from your truffle cli.
* A new directory called build will be created and the json files of all the contracts are available. These are abis (Application Binary Interface) to interact with our front end.
* In the views\ directory change all the abis in the script accordingly.
* Similarly, change the contract addresses in the script.
* Connect the application:
  * Run ```nodemon app.js```
  * Open ```localhost:3000```
* We are now connected.
