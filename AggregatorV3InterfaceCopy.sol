// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface AggregatorV3Interface {
    function latestRoundData() external view returns (
        uint80 roundID,
        int256 answer,
        uint256 startedAt,
        uint256 timestamp,
        uint80 answeredInRound
    );

    function getRoundData(uint80 _roundId) external view returns (
        uint80 roundID,
        int256 answer,
        uint256 startedAt,
        uint256 timestamp,
        uint80 answeredInRound
    );

    function latestAnswer() external view returns (int256);

    function latestTimestamp() external view returns (uint256);

    function description() external view returns (string memory);

    function version() external view returns (uint256);
}
