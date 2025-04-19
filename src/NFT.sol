// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AwesomeNFT is ERC721, Ownable {
    uint256 private _tokenIds;

    constructor() ERC721("AWESOME NFT", "AWESOME") Ownable(msg.sender) {
        mint(msg.sender);
    }

    function mint(address recipient) public onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 newTokenId = _tokenIds;
        _mint(recipient, newTokenId);
        return newTokenId;
    }
}
