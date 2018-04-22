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

    uint numOfVoters;
    uint numOfCandidates = 2;
    mapping (uint => Candidate) candidateList;
    mapping (uint => Voter) voterList;


    function vote(bytes32 uid, uint candidateId) public {
        uint voterId = numOfVoters + 1;
        voterList[voterId] = Voter(uid, candidateId);
    }

    function candidateNumOfVotes(uint candidateId) public view returns (uint) {
        uint candidateVotes = 0;
        for (uint i = 0; i < numOfVoters; i++) {
            if (voterList[i].candidateId == candidateId) {
                candidateVotes++;
            }
        }
        return candidateVotes;
    }
}