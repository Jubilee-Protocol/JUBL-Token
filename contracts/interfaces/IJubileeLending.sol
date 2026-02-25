// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

/**
 * @title IJubileeLending
 * @dev Interface for cross-repo integration with Jubilee Lending protocol.
 */
interface IJubileeLending {
    function isHealthy(address user) external view returns (bool);
}
