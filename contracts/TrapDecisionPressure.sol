// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITrap} from "drosera-contracts/interfaces/ITrap.sol";

interface IDecisionResponse {
    function isPressureHigh() external view returns (bool);
    function getDecision() external view returns (string memory);
}

contract TrapDecisionPressure is ITrap {
    address public constant RESPONSE_CONTRACT = 0x25E2CeF36020A736CF8a4D2cAdD2EBE3940F4608;

    function collect() external view returns (bytes memory) {
        bool pressure = false;
        string memory decision = "";

        (bool success1, bytes memory data1) = RESPONSE_CONTRACT.staticcall(
            abi.encodeWithSelector(IDecisionResponse.isPressureHigh.selector)
        );
        if (success1 && data1.length >= 32) {
            pressure = abi.decode(data1, (bool));
        }

        (bool success2, bytes memory data2) = RESPONSE_CONTRACT.staticcall(
            abi.encodeWithSelector(IDecisionResponse.getDecision.selector)
        );
        if (success2 && data2.length > 0) {
            decision = abi.decode(data2, (string));
        }

        return abi.encode(pressure, decision);
    }

    function shouldRespond(bytes[] calldata data) external pure returns (bool, bytes memory) {
        require(data.length > 0, "Input data missing");

        (bool pressureHigh, string memory decision) = abi.decode(data[0], (bool, string));

        if (!pressureHigh) {
            return (false, bytes(""));
        }

        if (keccak256(bytes(decision)) != keccak256(bytes("A"))) {
            return (false, bytes(""));
        }

        string memory message = "Decision A selected under high pressure - access granted.";
        return (true, abi.encode(message));
    }

    function respondWithDecision(string calldata decision) external pure returns (string memory) {
        return string(abi.encodePacked("Response acknowledged: ", decision));
    }
}
