pragma solidity >=0.5.0 <0.9.0;

contract Auction{
  address payable public owner;
  uint public startBlock;
  uint public endBlock;
  string public ipfsHash;

  enum State{Started, Running, Ended, Canceled}
  State public auctionState;

  unit public higestBidingBid;
  address payable public higestBidder;

  mapping(address=> unit) public bids;

  uint bidIncrement;

  constructor(){
    owner= payable (msg.sender);
    auction state = State.Running;
    startBlock = block.number;
    //Auction will run for a week
    endBlock = startBlock + 4320;
    ipfsHash = "";
    bidIncrement = 100;

  }
  modifier notOwner(){
    require(msg.sender != owner);
    _;
  }

  modifier afterStart(){
    require(block.number>=startBlock);
    _;
  }

  modifier beforeEnd(){
    require(block.number<=endBlock);
    _;
  }
  function placeBid() public payable notOwner afterStart beforeEnd{

    require (auctionState == Sate.running);
    require(msg.value >= 100);

  }
}
