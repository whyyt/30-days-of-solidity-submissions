// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfile {

    // 定义一个结构体来存储用户信息
    struct Profile {
        string name;
        string bio;
    }

    // 全局变量，存储当前用户的信息
    Profile public profile;

    // 保存用户信息的函数
    function saveProfile(string memory _name, string memory _bio) public {
        // 检查输入是否为空
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_bio).length > 0, "Bio cannot be empty");

        // 保存用户信息
        profile.name = _name;
        profile.bio = _bio;
    }

    // 检索用户信息的函数
    function getProfile() public view returns (string memory, string memory) {
        return (profile.name, profile.bio);
    }
}