// SPDX-License-Identifier: AGPLv3"

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract LITxRewards is OwnableUpgradeable {
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

    /**
     * @dev See {__LITxRewards_init}.
     */
    function initialize(
        address token_
        ) public initializer {
        __LITxRewards_init(token_);
    }

    /**
     * @dev See {OwnableUpgradeable}.
     */
    function __LITxRewards_init(
        address token_
        ) internal initializer {
        __Context_init_unchained();
        __LITxRewards_init_unchained(token_);
    }

    function __LITxRewards_init_unchained(
        address token_
        ) internal initializer {
        _token = IERC20(token_);
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