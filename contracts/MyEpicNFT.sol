pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyEpicNFT is ERC721URIStorage {
    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Woah!");
    }

    // A function our user will hit to get their NFT.
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiRXBpY0xvcmRIYW1idXJnZXIiLAogICAgImRlc2NyaXB0aW9uIjogIkFuIE5GVCBmcm9tIHRoZSBoaWdobHkgYWNjbGFpbWVkIHNxdWFyZSBjb2xsZWN0aW9uIiwKICAgICJkYXRhIjogImRhdGE6aW1hZ2Uvc3ZnK3htbCwlM2NzdmcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSd4TWluWU1pbiBtZWV0JyB2aWV3Qm94PScwIDAgMzUwIDM1MCclM2UlM2NzdHlsZSUzZS5iYXNlICU3YiBmaWxsOiB3aGl0ZSUzYiBmb250LWZhbWlseTogc2VyaWYlM2IgZm9udC1zaXplOiAxNHB4JTNiICU3ZCUzYy9zdHlsZSUzZSUzY3JlY3Qgd2lkdGg9JzEwMCUyNScgaGVpZ2h0PScxMDAlMjUnIGZpbGw9J2JsYWNrJy8lM2UlM2N0ZXh0IHg9JzUwJTI1JyB5PSc1MCUyNScgY2xhc3M9J2Jhc2UnIGRvbWluYW50LWJhc2VsaW5lPSdtaWRkbGUnIHRleHQtYW5jaG9yPSdtaWRkbGUnJTNlV2ViM01vcmVMaWtlV2ViUGVlJTNjL3RleHQlM2UlM2Mvc3ZnJTNlIgp9");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}