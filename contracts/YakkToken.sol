//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/Pausable.sol';

contract YakkToken is ERC20, Ownable, Pausable {
    uint256 public constant MAX_SUPPLY = 1e9 * 1e18;


    constructor() ERC20 ("YakkToken", "YTT") {
        _mint(address(0x5d0174A95a8B9296ffE9FdDb7366Ff16797248Ea), 2* 10**12 * 10**18);
    }

    function mint() public payable whenNotPaused {
        uint256 amountEther = msg.value / 1 ether;
        uint256 amount = amountEther * RATE;
        require(totalSupply() + amount <= MAX_SUPPLY, "EXCEED THE MAX SUPPLY")
    }

}