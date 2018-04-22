pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Vote.sol";

contract TestVote {
    Vote vote = Vote(DeployedAddresses.Vote());

    function testVote() public {
        vote.init();
        uint numGot = vote.getNumOfCandidates();
        uint expected = 2;
        Assert.equal(numGot, expected, "Number of candidates should be 2");

        
        uint leader;
        uint votes;
        address uid = 0x0e986d94eB1c204B63be6E6B57ECf7B3423cd513;
        vote.userVote(uid, 0);
        (leader, votes) = vote.getLeader();
        Assert.equal(leader, 0, "Leader should be 0");
        Assert.equal(votes, 1, "Votes should be 1");
    }
}