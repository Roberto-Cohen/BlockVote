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
    }
}