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

    function getNumOfVoters() public view returns (uint) {
        return numOfVoters;
    }

    function getNumOfCandidates() public view returns (uint) {
        return numOfCandidates;
    }

    function getCandidate(uint candidateId) public view returns (uint, bytes32, bytes32) {
        return (candidateId, candidateList[candidateId].name, candidateList[candidateId].party);
    }

    function getLeader() public view returns (uint, uint) {
        uint numOfVotes = 0;
        uint winnerId;
        for (uint i = 0; i < numOfCandidates; i++) {
            uint currCandidateId = i;
            uint currNumOfVotes = 0;
            for (uint x = 0; x < numOfVoters; x++) {
                if (voterList[x].candidateId == currCandidateId) {
                    currNumOfVotes++;
                }
            }
            if (currNumOfVotes >= numOfVotes) {
                numOfVotes = currNumOfVotes;
                winnerId = currCandidateId;
            } 
        }
        return (winnerId, numOfVotes);
    }
}