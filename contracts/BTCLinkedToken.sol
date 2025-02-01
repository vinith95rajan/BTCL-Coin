// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract BTCLinkedToken is ERC20 {
    AggregatorV3Interface internal priceFeed;
    address public owner;

    constructor() ERC20("BTCLinkedCoin", "BTCL") {
        owner = msg.sender;
        _mint(msg.sender, 1000000 * 10**18); // Initial supply
        priceFeed = AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7); // Chainlink BTC/USD Oracle
    }

    function getLatestBTCPrice() public view returns (int) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return price / 10**8; // Convert to USD price
    }

    function adjustTokenSupply() public {
        require(msg.sender == owner, "Only owner can adjust supply");
        int btcPrice = getLatestBTCPrice();
        uint256 newSupply = uint256(btcPrice) * 1000; // 1000 tokens per BTC
        _mint(msg.sender, newSupply);
    }
}
