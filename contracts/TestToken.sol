pragma solidity ^0.4.4;

import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract TestToken is DetailedERC20("TestToken", "TT", 18) {
  using SafeMath for uint256;

  uint256 _totalSupply;

  mapping(address => uint256) balances;
  mapping(address => mapping(address => uint256)) allowed;

  constructor() public {
    _totalSupply = 1000000000 * 10 ** uint256(decimals);
    balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
  }

  function() public payable {
    revert();
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address who) public view returns (uint256) {
    return balances[who];
  }

  function transfer(address to, uint256 value) public returns (bool) {
    balances[msg.sender] = balances[msg.sender].sub(value);
    balances[to] = balances[to].add(value);
    emit Transfer(msg.sender, to, value);
    return true;
  }

  function allowance(address owner, address spender) public view returns (uint256) {
    return allowed[owner][spender];
  }

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    balances[from] = balances[from].sub(value);
    allowed[from][msg.sender] = allowed[from][msg.sender].sub(value);
    balances[to] = balances[to].add(value);
    emit Transfer(from, to, value);
    return true;
  }

  function approve(address spender, uint256 value) public returns (bool) {
    allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
}
