// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import { Base64 } from "./libraries/Base64.sol";



contract MyEpicNFT is ERC721URIStorage,Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  bool private isSaleEnded = false;
  bool private _isRevealed = false;
  string private _preRevealURI = "ipfs://QmRwgoiVjjehLH3gbeicR9NEGG3sVTouc9Wbg3rYmwAX5X";
  string private _postRevealBaseURI = "ipfs://QmUXPw9CKtgxxntJuparZ9mCKWC8khsPVEsMapJCKRvLBy";


  // MAGICAL EVENTS.
  event NewEpicNFTMinted(address sender, uint256 tokenId);

  constructor() ERC721 ("present", "philia") {
    console.log("This is my NEW NFT contract."); 
  }


// 특정한 사람만 민팅할 수 있도록
// modifier whitelistCheck {
//   require (msg.sender == approvedAddress);
//   _;
// }

modifier saleCheck{
  require (isSaleEnded == false);
  _;
}

  function makeAnEpicNFT() public saleCheck {
    
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
    return "ipfs://QmUXPw9CKtgxxntJuparZ9mCKWC8khsPVEsMapJCKRvLBy";

  }

  // function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
  //  if (!_isRevealed) {
  //   return _preRevealURI;
  //  } else {
    // return super.tokenURI(_tokenId);
    //  }
  // }


// function revealCollection() public  view override returns (string memory) {
//     _isRevealed = true;
//     console.log("your NFT is Revealed!");
//     return _postRevealBaseURI;
// }
//   function reveal(string memory baseURI) 
//   external 
//   onlyOwner 
//   {
//      _postRevealBaseURI = baseURI;
//      _isRevealed = true;}
//   function _baseURI() internal view override returns (string memory){
//     require(_exists(_tokenId));
//     console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
//     return "ipfs://QmRwgoiVjjehLH3gbeicR9NEGG3sVTouc9Wbg3rYmwAX5X";
  }











  //   console.log("your NFT is Revealed!");
  //   return _postRevealBaseURI;
  // }
   
   
  //   // require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
  //   // string memory baseURI = baseURI();
  //   // return bytes(baseURI).length > 0? string(abi.encodePacked(baseURI, tokenId.toString()));
    

    // require(_exists(_tokenId),
    // console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    // return "ipfs://QmRwgoiVjjehLH3gbeicR9NEGG3sVTouc9Wbg3rYmwAX5X";

    // require(_exists(_tokenId),
    // string memory baseURI = baseURI();
    // return bytes(baseURI).
    // return "ipfs://QmRwgoiVjjehLH3gbeicR9NEGG3sVTouc9Wbg3rYmwAX5X";
  // }









//     console.log("\n--------------------");
//     console.log(finalTokenUri);
//     console.log("--------------------\n");

//     _safeMint(msg.sender, newItemId);
  
//     _setTokenURI(newItemId, finalTokenUri);
  
//     _tokenIds.increment();
//     console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    
//     // EMIT MAGICAL EVENTS.
//     emit NewEpicNFTMinted(msg.sender, newItemId);
//   }
// }