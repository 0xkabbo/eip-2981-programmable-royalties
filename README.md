# Programmable Tax Compliance (EIP-2981 style)

A professional-grade implementation for financial compliance in Web3. This repository provides a standardized way for NFT marketplaces and DeFi protocols to handle royalties and tax obligations automatically. By baking these rules into the contract, creators and organizations ensure they are always compliant with secondary sale fees and jurisdictional tax requirements without manual intervention.

## Core Features
* **EIP-2981 Standard:** Universal compatibility with marketplaces like OpenSea and Rarible for royalty reporting.
* **Multi-Receiver Payouts:** Logic to split a single royalty payment between multiple entities (e.g., Artist, Studio, and a Tax Vault).
* **Immutable Fee Logic:** Ensures that secondary sale percentages cannot be manipulated after minting.
* **Flat Architecture:** Single-directory layout for the NFT Core, Royalty Engine, and Tax Distributor.

## Logic Flow
1. **Mint:** An NFT is created with a 10% royalty and a defined "Tax Receiver" address.
2. **Trade:** The NFT is sold on a marketplace for 10 ETH.
3. **Query:** The marketplace calls `royaltyInfo()` to determine the fee (1 ETH).
4. **Distribute:** 0.8 ETH is sent to the Artist, and 0.2 ETH is sent to a "Tax Compliance Vault" for end-of-year reporting.

## Setup
1. `npm install`
2. Deploy `TaxableNFT.sol`.
