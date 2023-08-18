// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract Indian_ETH is ERC721A{

    address public owner;

    // Maximum number of tokens that can be minted
    uint256 public maxQuantity = 5;

    // Base url for the nfts
    string baseUrl = "https://gateway.pinata.cloud/ipfs/QmbEDdFhobfcLFkS63jGu8jR5UK61eFRo1BTwfgd1BDazZ/?_gl=1*1s22ymt*_ga*MjU2NTUxNDcuMTY5MDY3ODU2Mw..*_ga_5RMPXG14TE*MTY5MjIzODA3MS42LjEuMTY5MjIzOTk1MS41NC4wLjA.";

    // URL for the prompt description
    string public prompt =
        "Create a visually captivating NFT artwork that pays homage to an Indian hero from folklore, mythology, or history.";

    constructor() ERC721A("Indian", "IND") {
        owner = msg.sender;
    }

    // Modifier that only allows the owner to execute a function
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action!");
        _;
    }

    // Function to mint NFT which only owner can perform
    function mint(uint256 quantity) external payable onlyOwner{
        require(totalSupply() + quantity <= maxQuantity ,"You can not mint more than 5");
        _mint(msg.sender, quantity);
    }

    // Override the baseURI function to return the base URL for the NFTs
    function _baseURI() internal view override returns (string memory){
        return baseUrl;
    }

    // Return the URL for the prompt description
    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}
