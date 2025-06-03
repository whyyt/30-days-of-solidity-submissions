// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract PollStation {
    // 存储候选人的数组，元素值代表候选人的得票数
    uint[] public candidates;
    // 记录每个地址投票给哪个候选人的映射
    mapping(address => uint) public voterToCandidate;

    // 构造函数，初始化候选人列表
    constructor(uint _numCandidates) {
        require(_numCandidates > 0, "Number of candidates must be greater than 0");
        for (uint i = 0; i < _numCandidates; i++) {
            candidates.push(0);
        }
    }

    // 投票函数，允许用户为指定候选人投票
    function vote(uint _candidateIndex) external {
        // 检查投票者是否已经投过票
        require(voterToCandidate[msg.sender] == 0, "You have already voted.");
        // 检查候选人索引是否有效
        require(_candidateIndex < candidates.length, "Invalid candidate index.");

        // 记录投票者的选择
        voterToCandidate[msg.sender] = _candidateIndex + 1;
        // 增加对应候选人的票数
        candidates[_candidateIndex]++;
    }

    // 获取指定候选人的得票数
    function getCandidateVotes(uint _candidateIndex) external view returns (uint) {
        require(_candidateIndex < candidates.length, "Invalid candidate index.");
        return candidates[_candidateIndex];
    }

    // 获取某个投票者的投票选择
    function getVoterChoice(address _voter) external view returns (uint) {
        return voterToCandidate[_voter] - 1;
    }

    // 获取候选人的数量
    function getCandidateCount() external view returns (uint) {
        return candidates.length;
    }
}
