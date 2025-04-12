// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.24;

contract MyFirstToekn {

    // Public variables for token details
    string public name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint256 public immutable totalSupply;


    // Mappings to track balances and allowances
    mapping(address => uint256) public _balances;
    mapping(address => mapping(address => uint256)) public _allowances;


    // Events for logging transfers and approvals
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);


    // Constructor to initialize the token details and allocate the total supply to the deployer
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply)  {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        _balances[msg.sender] = _totalSupply;
    }

    // Modifier to ensure an address is not the zero address
    modifier onlyNonZeroAddress(address addr) {
        require(addr != address(0), "Zero address not allowed"); // Zero address is invalid
        _;
    }

    // Function to check the balance of a specific address
    function balanceOf(address _owner) public view returns(uint256) {
        require(_owner != address(0), "Za!");
        return _balances[_owner]; 
    }

    // Function to transfer tokens from the caller to another address
    function transfer(address _to, uint256 _value) public returns(bool) {
        require((_balances[msg.sender] >= _value) && (_balances[msg.sender] > 0), "Bal!");
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Function to transfer tokens on behalf of another address (e.g., with allowances
    function transferfrom(address _from, address _to, uint256 _value) public returns(bool) {
        require(_allowances[msg.sender][_from] >= _value, "Alw!");
        require((_balances[_from] >= _value) && (_balances[_from] > 0), "Bal!");
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowances[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
 
     // Function to approve another address to spend tokens on behalf of the caller
    function approval(address _spender, uint256 _value) public returns(bool) {
        require(_balances[msg.sender] >= _value, "Bal!");
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value) ;
        return true;
    }

    // Function to check how much an address is allowed to spend on behalf of another
    function allowances(address _owner, address _spender) public view returns(uint256) {
        return _allowances[_spender][_owner];
    }

}