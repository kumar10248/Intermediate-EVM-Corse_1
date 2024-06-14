// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//Error Handling in solidity
//1. Reequire function
//2. revert function
//3. assert function


contract Twitter {
    uint16 constant Max_tweet = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint likes;
    }

    mapping(address => Tweet[]) public tweets;

    // Function to create a new tweet
    function createTweet(string memory tweet) public {
        // Ensure the tweet is not too long
        require(bytes(tweet).length <= Max_tweet, "Tweet is too long!");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    // Function to get a specific tweet
    function getTweet(uint256 index) public view returns (Tweet memory) {
        // Ensure the tweet index is within bounds
        require(index < tweets[msg.sender].length, "Invalid tweet index.");
        return tweets[msg.sender][index];
    }

    // Function to get all tweets by a specific user
    function getAllTweets(address owner) public view returns (Tweet[] memory) {
        return tweets[owner];
    }

    // Function to like a tweet
    function likeTweet(address author, uint256 index) public {
        // Ensure the tweet index is within bounds
        require(index < tweets[author].length, "Invalid tweet index.");

        Tweet storage tweetToLike = tweets[author][index];

        // Ensure the tweet to like exists
        assert(tweetToLike.author == author);

        tweetToLike.likes += 1;
    }

    // Function to delete a tweet
    function deleteTweet(uint256 index) public {
        // Ensure the tweet index is within bounds
        require(index < tweets[msg.sender].length, "Invalid tweet index.");

        // Move the last tweet to the place of the tweet to delete
        tweets[msg.sender][index] = tweets[msg.sender][tweets[msg.sender].length - 1];

        // Remove the last tweet
        tweets[msg.sender].pop();

        // Ensure the tweet was deleted
        if (index < tweets[msg.sender].length) {
            revert("Failed to delete tweet.");
        }
    }
}
