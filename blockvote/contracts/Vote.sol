pragma solidity ^0.4.17;

contract Vote {
    address[2] public cadidates;

    struct Candidate {
        bytes32 name;
        bytes32 party;
    }

    struct Voter {
        bytes32 uid;
        uint candidateId;
    }

    mapping

    function vote(uint candidateId) public returns (uint) {

    }
}