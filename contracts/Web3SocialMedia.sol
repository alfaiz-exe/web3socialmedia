// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Web3SocialMedia {
    struct Post {
        uint id;
        address author;
        string content;
        uint timestamp;
    }

    mapping(uint => Post) public posts;
    uint public postCount;

    mapping(address => string) public usernames;

    event PostCreated(uint id, address author, string content, uint timestamp);
    event UsernameUpdated(address user, string newUsername);

    // Function to create a post
    function createPost(string calldata _content) external {
        postCount++;
        posts[postCount] = Post(postCount, msg.sender, _content, block.timestamp);
        emit PostCreated(postCount, msg.sender, _content, block.timestamp);
    }

    // Function to get a post by ID
    function getPost(uint _id) external view returns (Post memory) {
        require(_id > 0 && _id <= postCount, "Invalid Post ID");
        return posts[_id];
    }

    // Function to set or update username
    function setUsername(string calldata _username) external {
        usernames[msg.sender] = _username;
        emit UsernameUpdated(msg.sender, _username);
    }
}
