// SPDX-License-Identifier: AGPLv3"

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


contract LITxRewards is Context, Ownable {
    using SafeERC20 for IERC20;
    
    /**
     * @dev Emitted when owner sets reward distribution.
     *
     */
    event SetRewardDistribution(uint256[] rewardDistribution, string[] rewardUrls);
    /**
     * @dev Emitted when `value` tokens are rewarded by the contract to { to }.
     *
     */
    event Rewarded(address indexed to, uint256 value);

    IERC20 public _token;
    uint256[] public _rewardDistribution;
    string[] public _rewardUrls; 

    constructor (address token) {
        _token = IERC20(token);
    }

    function setRewards(uint256[] memory rewardDistribution, string[] memory rewardUrls) external onlyOwner() {
        require(rewardDistribution.length == rewardUrls.length, "Wrong input lengths");
        _rewardDistribution = rewardDistribution;
        _rewardUrls = rewardUrls;
        emit SetRewardDistribution(rewardDistribution, rewardUrls);
    }

    /**
     * @dev Reward the tokens.
     *
     */
    function reward() external onlyOwner {
        uint256 balance = _token.balanceOf(address(this));

    }
}