pragma solidity >= 0.5.0

 interface ERC20Interface {
   function totalSupply() external view returns (uint);
   function balanceOf(address tokenOwner) external view returns (uint balance);
   function transfer(address to, uint tokens) external returns (bool success);

   function allowance(address tokenOwner, address spender) external view returns (uint remaining);
   function approve(address spender, uint tokens) external returns (bool success);
   function transferForm(address form, address to, uint tokens) external returns (bool success);

   event Transfer(address indexed from, address indexed to, uint tokens);
   event Approval(address tokenOwner, address indexed spender, uint tokens);

 }

contract Cryptos is  ERC20Interface{
  string public name = "Coin";
  string public symbol = "CIN";
  uint public decimals = 0;
  uint public override totalSupply;

  address public founder;
  mapping (address => uint) public balances;

  mapping(address => mapping(address => uint)) allowed;

  constructor() {
    totalSupply = 1000000;
    founder = msg.sender;
    balances[founder] = totalSupply;
  }
     function balanceOf(address tokenOwner) public view override returns (uint balance){
       return balances[tokenOwner];
     }

     function transfer(address to, uint tokens) public override returns (bool success) {
       require(balances[msg.sender] >= tokens);

       balances[to] += tokens;
       balances[msg.sender] -= tokens;
       emit Transfer(msg.sender, to, tokens);

       return true;
     }
}
