// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping (address => uint) public waveCounts;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        incrementWaveCount(msg.sender);
    }

    function awkwardUnWave() public {
        totalWaves -= 1;
        decrementWaveCount(msg.sender);
    }

    function incrementWaveCount(address _address) public {
        waveCounts[_address]++;
        console.log("%s has waived", _address);
    }

    function decrementWaveCount(address _address) public {
        require(waveCounts[_address] > 0, "You haven't waved yet. Can't unwave");
        waveCounts[_address]--;
        console.log("%s has awkwardly unwaved", address(_address));
    }

    function getWaveCount(address _address) public view returns (uint) {
        console.log("%s has waved for %d times", _address, waveCounts[_address]);
        return waveCounts[_address];
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        getWaveCount(msg.sender);
        return totalWaves;
    }
}