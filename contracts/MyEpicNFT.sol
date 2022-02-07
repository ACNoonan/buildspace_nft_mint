//SPDX-License-Identifier: MIT
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
        _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiQ3VycmVudFN0YXRlb2ZXZWIzIiwKICAgICJkZXNjcmlwdGlvbiI6ICJDcnlwdG8gdXNlZCB0byBiZSBhIGJhc3RpYW4gb2YgZnJlZSB0aGlua2Vycy4uLiB0aGUgdmljdGltaXphdGlvbiBpZGVudGlmaWVyIGFyZSBoZXJlIG5vdyIsCiAgICAiZGF0YSI6ICJkYXRhOmltYWdlL3N2Zyt4bWwsJTNjc3ZnIHhtbG5zPSdodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZycgcHJlc2VydmVBc3BlY3RSYXRpbz0neE1pbllNaW4gbWVldCcgdmlld0JveD0nMCAwIDM1MCAzNTAnJTNlJTNjc3R5bGUlM2UuYmFzZSAlN2IgZmlsbDogd2hpdGUlM2IgZm9udC1mYW1pbHk6IHNlcmlmJTNiIGZvbnQtc2l6ZTogMTRweCUzYiAlN2QlM2Mvc3R5bGUlM2UlM2NyZWN0IHdpZHRoPScxMDAlMjUnIGhlaWdodD0nMTAwJTI1JyBmaWxsPSdibGFjaycvJTNlJTNjdGV4dCB4PSc1MCUyNScgeT0nNTAlMjUnIGNsYXNzPSdiYXNlJyBkb21pbmFudC1iYXNlbGluZT0nbWlkZGxlJyB0ZXh0LWFuY2hvcj0nbWlkZGxlJyUzZVdlYjNNb3JlTGlrZVdlYlBlZSUzYy90ZXh0JTNlJTNjL3N2ZyUzZSIKfQ==");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}