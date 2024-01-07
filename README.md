# Stealth Chad

An implementation of [ERC-5564: Stealth Addresses](https://eips.ethereum.org/EIPS/eip-5564) and [ERC-6538: Stealth Meta-Address Registry](https://eips.ethereum.org/EIPS/eip-6538) (using `bytes32` instead of `bytes`).

Test it at [https://bokkypoobah.github.io/StealthChad/](https://bokkypoobah.github.io/StealthChad/) (WIP) connected to the Ethereum Sepolia testnet.

<br />

### How The ERC-5564: Stealth Addresses Protocol Works

* Alice wants to pay Bob in ETH/ERC-20/ERC-721 tokens
* Bob generates a *Stealth Meta-Address* and provides this to Alice
* Alice uses Bob's *Stealth Meta-Address* to compute a random *Stealth Address* that can be accessed only by Bob
* Alice transfers the tokens to this address and announces the transfers in the *ERC-5564: Stealth Address Announcer* contract
* Bob can access the private keys to their computed *Stealth Addresses*, using information included in the announcements
* The *ERC-6538: Stealth Meta-Address Registry* allows any account to publish their associated *Stealth Meta-Addresses*

<br />

### How This Dapp Works

This dapp:

* Allows Bob's web3 attached account to generate a unique Stealth Meta-Address for each unique associated phrase
* Allows Alice to compute a random Stealth Address using Bob's Stealth Meta-Address
* Allows Alice to then execute the transfer to Bob's Stealth Address and announce the transfer to the Announcer
* Retrieve all event logs published to the Announcer
* Retrieves all event logs published to the Registry

<br />

---

### Sample Screens

#### After Initial Sync

##### After Initial Sync - Addresses

<kbd><img src="images/SampleScreen_AfterInitialSync_Addresses_20240107.png " /></kbd>


<br />

---

#### Tokens Sample Screens

##### Tokens - Active Only

<kbd><img src="images/SampleScreen_Tokens_ActiveOnly_20240106.png" /></kbd>

<br />

---

## References

* [ERC-5564: Stealth Addresses](https://eips.ethereum.org/EIPS/eip-5564)
* [ERC-6538: Stealth Meta-Address Registry](https://eips.ethereum.org/EIPS/eip-6538)
* https://github.com/nerolation/stealth-wallet
  * https://stealth-wallet.xyz/
  * https://nerolation.github.io/stealth-utils/ from https://github.com/nerolation/stealth-utils
  * [StealthTransactionHelper on Sepolia](https://sepolia.etherscan.io/address/0x054Aa0E0b4C92142a583fDfa9369FF3558F8dea4#code)
* https://github.com/kassandraoftroy/erc5564-contracts
* [An incomplete guide to stealth addresses](https://vitalik.eth.limo/general/2024/01/20/stealth.html)
* [ERC-5564 Stealth Addresses](https://ethereum-magicians.org/t/erc-5564-stealth-addresses/10614)
* [EIP-5564: Improving Privacy on Ethereum through Stealth Address Wallets](https://medium.com/@toni_w/eip-5564-improving-privacy-on-ethereum-through-stealth-address-wallets-fdf3250e81a1)
* [Ethereum stealth addresses (ERC-5564) library](https://github.com/jsign/zig-stealth-addresses)
* https://github.com/paulmillr/noble-curves

<br />

---

## Deployments

* [ERC5564Announcer.sol v0.8.1](deployed/ERC5564Announcer_v0.8.1_Sepolia_0xFe6335f5dc5a469e74fB6a9FDAe116bFD5346365.sol) on Sepolia [0xFe6335f5dc5a469e74fB6a9FDAe116bFD5346365](https://sepolia.etherscan.io/address/0xFe6335f5dc5a469e74fB6a9FDAe116bFD5346365#code)
* [ERC5564Registry.sol v0.8.1](deployed/ERC5564Registry_v0.8.1_Sepolia_0x5F8ac9e3B2DD28cA2c9bc7A992Ce36c3C4929Cde.sol) on Sepolia [0x5F8ac9e3B2DD28cA2c9bc7A992Ce36c3C4929Cde](https://sepolia.etherscan.io/address/0x5F8ac9e3B2DD28cA2c9bc7A992Ce36c3C4929Cde#code)
* [StealthChad.sol v0.8.1](deployed/StealthChad_v0.8.1_Sepolia_0xA745760E9f1E425215CCD7735F932FdDE3276344.sol) on Sepolia [0xA745760E9f1E425215CCD7735F932FdDE3276344](https://sepolia.etherscan.io/address/0xA745760E9f1E425215CCD7735F932FdDE3276344#code)


<br />

<br />

Enjoy!

(c) BokkyPooBah / Bok Consulting Pty Ltd 2024. The MIT Licence.
