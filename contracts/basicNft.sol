// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity ^0.8.7;

contract basicNft is ERC721 {
    string public constant TOKEN_URI =
        "ipfs://bafybeiesackip7jboqgpmbojae3lg4ozpii7zl2jqmc7cy4kiealhoxbyi/?filename=.json";
    uint256 s_tokenCounter;

    constructor() ERC721("DRILL", "DRL") {
        s_tokenCounter = 0;
    }

    function mintNft() public returns (uint256) {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
        return s_tokenCounter;
    }

    function tokenURI(uint256 /*tokenId*/) public view override returns (string memory) {
        // require (_exists(tokenId)))
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
