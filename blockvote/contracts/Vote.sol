pragma solidity ^0.4.17;

contract Vote {

    struct Candidate {
        bytes32 name;
        bytes32 party;
    }

    struct Voter {
        bytes32 uid;
        uint candidateId;
    }

    uint numOfVoters = 0;
    uint numOfCandidates = 0;
    mapping (uint => Candidate) candidateList;
    mapping (uint => Voter) voterList;

    function addCandidate(bytes32 name, bytes32 party) public {
        uint candidateId = numOfCandidates;
        numOfCandidates++;
        candidateList[candidateId] = Candidate(name, party);
    }

    function vote(bytes32 uid, uint candidateId) public {
        uint voterId = numOfVoters;
        voterList[voterId] = Voter(uid, candidateId);
        numOfVoters++;
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

    function init() public {
        addCandidate("Hillary Clinton", "Democrats");
        addCandidate("Donald Trump", "Republicans");
    }
}