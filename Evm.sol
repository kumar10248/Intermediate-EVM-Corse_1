// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Twitter {
    uint16 constant Max_tweet = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint likes;
    }

    mapping(address => Tweet[]) public tweets;

    // Event for a new tweet
    event NewTweet(address indexed author, uint256 index);

    // Function to create a new tweet
    function createTweet(string memory tweet) public {
        // Ensure the tweet is not too long
        require(bytes(tweet).length <= Max_tweet, "Tweet is too long Bro!");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

        // Emit an event for the new tweet
        emit NewTweet(msg.sender, tweets[msg.sender].length - 1);
    }

    // Function to get a specific tweet
    function getTweet(uint256 i) public view returns (Tweet memory) {
        // Ensure the tweet index is within bounds
        require(i < tweets[msg.sender].length, "Invalid tweet index.");
        return tweets[msg.sender][i];
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

        // Delete the tweet and shift elements
        for (uint256 i = index; i < tweets[msg.sender].length - 1; i++) {
            tweets[msg.sender][i] = tweets[msg.sender][i + 1];
        }
        tweets[msg.sender].pop();

        // Ensure the tweet was deleted
        if (index < tweets[msg.sender].length) {
            revert("Failed to delete tweet.");
        }
    }
}
