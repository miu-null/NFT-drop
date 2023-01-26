// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import { Base64 } from "./libraries/Base64.sol";



contract PresentForYou is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  bool private isSaleEnded = false;
  
  string private baseURI = "ipfs://QmUXPw9CKtgxxntJuparZ9mCKWC8khsPVEsMapJCKRvLBy";
  address private approvedAddress = 0xf405535E43BeeF232e67D95F77F36E6a0B4cfAe1;

  // MAGICAL EVENTS.
event NewGiftMinted(address sender, uint256 tokenId);

  constructor() ERC721 ("present", "philia") {
    console.log("This is present for you"); 
  }


// 특정한 사람만 민팅할 수 있도록
modifier whitelistCheck {
  require (msg.sender == approvedAddress);
  _;
}

modifier saleCheck{
  require (isSaleEnded == false);
  _;
}

  function makethisForYou() public saleCheck {
    
    uint256 newItemId = _tokenIds.current();
// Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);
    isSaleEnded = true;

    
    // Return the NFT's metadata
    tokenURI(newItemId);

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();

  }


  function getIsSaleEnded() public view returns (bool) {
    return isSaleEnded;
  }

  // Set the NFT's metadata
  function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
    require(_exists(_tokenId));
    console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    return baseURI;

  }
}