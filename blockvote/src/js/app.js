// Import libraries we need.
import { default as Web3} from "web3"
import { default as contract } from "truffle-contract"

// get build artifacts from compiled smart contract and create the truffle contract
import voteArtifacts from "../../build/contracts/Vote.json"
var VoteContract = contract(voteArtifacts)

window.App = {
    // called when web3 is set up
    start: function() { 
      // setting up contract providers and transaction defaults for ALL contract instances
      VoteContract.setProvider(window.web3.currentProvider)
      VoteContract.defaults({from: window.web3.eth.accounts[0],gas:6721975})
  
      // creates an VotingContract instance that represents default address managed by VotingContract
      VoteContract.deployed().then(function(instance){
  
        // calls getNumOfCandidates() function in Smart Contract, 
        // this is not a transaction though, since the function is marked with "view" and
        // truffle contract automatically knows this
        instance.getNumOfCandidates().then(function(numOfCandidates){
  
            for (var i = 0; i < numOfCandidates; i++ ){
                // gets candidates and displays them
                instance.getCandidate(i).then(function(data){
                    // Display candidate on html page
                })
            }
            // sets global variable for number of Candidates
            // displaying and counting the number of Votes depends on this
            window.numOfCandidates = numOfCandidates 
        })
      })
    },
  
    // Function that is called when user clicks the "vote" button
    vote: function() {
        // Comes from html page: var CandidateID = something

        // Actually voting for the Candidate using the Contract and displaying "Voted"
        VotingContract.deployed().then(function(instance){
            instance.vote(uid,parseInt(candidateID)).then(function(result){
            })
        })
    }
  }



// When the page loads, we create a web3 instance and set a provider. We then set up the app
window.addEventListener("load", function() {
    // Is there an injected web3 instance?
    if (typeof web3 !== "undefined") {
      console.warn("Using web3 detected from external source like Metamask")
      // If there is a web3 instance(in Mist/Metamask), then we use its provider to create our web3object
      window.web3 = new Web3(web3.currentProvider)
    } else {
      console.warn("No web3 detected. Falling back to http://localhost:7545. You should remove this fallback when you deploy live, as it's inherently insecure. Consider switching to Metamask for development. More info here: http://truffleframework.com/tutorials/truffle-and-metamask")
      // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
      window.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"))
    }
    // initializing the App
    window.App.start()
  })