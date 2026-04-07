// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title TaxableNFT
 * @dev Implements EIP-2981 for automated royalty and tax distribution.
 */
contract TaxableNFT is ERC721, ERC2981, Ownable {
    constructor(string memory _name, string memory _symbol) 
        ERC721(_name, _symbol) 
        Ownable(msg.sender) 
    {}

    /**
     * @dev Mints a new NFT and sets the royalty info.
     * @param _to The receiver of the NFT.
     * @param _tokenId Unique ID of the NFT.
     * @param _royaltyReceiver The address to receive the royalty (could be a Splitter contract).
     * @param _feeNumerator The fee in basis points (e.g., 500 = 5%).
     */
    function mint(
        address _to, 
        uint256 _tokenId, 
        address _royaltyReceiver, 
        uint96 _feeNumerator
    ) external onlyOwner {
        _safeMint(_to, _tokenId);
        _setTokenRoyalty(_tokenId, _royaltyReceiver, _feeNumerator);
    }

    /**
     * @dev Required override for EIP-2981 and ERC721 compatibility.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC2981)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
