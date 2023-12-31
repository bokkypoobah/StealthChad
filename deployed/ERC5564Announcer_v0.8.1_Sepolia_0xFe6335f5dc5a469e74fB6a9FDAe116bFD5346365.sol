/**
 *Submitted for verification at Etherscan.io on 2024-01-07
*/

pragma solidity ^0.8.19;

// ----------------------------------------------------------------------------
// ERC5564Announcer v0.8.1 - Experiments in ERC-5564: Stealth Addresses
//
// From https://eips.ethereum.org/EIPS/eip-5564
//
// Deployed to Sepolia 0xFe6335f5dc5a469e74fB6a9FDAe116bFD5346365
//
// https://github.com/bokkypoobah/StealthChad
//
// SPDX-License-Identifier: MIT
//
// Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2024
// ----------------------------------------------------------------------------

/// @notice Interface for announcing when something is sent to a stealth address.
interface IERC5564Announcer {
  /// @dev Emitted when sending something to a stealth address.
  /// @dev See the `announce` method for documentation on the parameters.
  event Announcement(uint256 indexed schemeId, address indexed stealthAddress, address indexed caller, bytes ephemeralPubKey, bytes metadata);

  /// @dev Called by integrators to emit an `Announcement` event.
  /// @param schemeId The integer specifying the applied stealth address scheme.
  /// @param stealthAddress The computed stealth address for the recipient.
  /// @param ephemeralPubKey Ephemeral public key used by the sender.
  /// @param metadata An arbitrary field MUST include the view tag in the first byte.
  /// Besides the view tag, the metadata can be used by the senders however they like,
  /// but the below guidelines are recommended:
  /// The first byte of the metadata MUST be the view tag.
  /// - When sending/interacting with the native token of the blockchain (cf. ETH), the metadata SHOULD be structured as follows:
  ///     - Byte 1 MUST be the view tag, as specified above.
  ///     - Bytes 2-5 are `0xeeeeeeee`
  ///     - Bytes 6-25 are the address 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE.
  ///     - Bytes 26-57 are the amount of ETH being sent.
  /// - When interacting with ERC-20/ERC-721/etc. tokens, the metadata SHOULD be structured as follows:
  ///   - Byte 1 MUST be the view tag, as specified above.
  ///   - Bytes 2-5 are a function identifier. When a function selector (e.g.
  ///     the first (left, high-order in big-endian) four bytes of the Keccak-256
  ///     hash of the signature of the function, like Solidity and Vyper use) is
  ///     available, it MUST be used.
  ///   - Bytes 6-25 are the token contract address.
  ///   - Bytes 26-57 are the amount of tokens being sent/interacted with for fungible tokens, or
  ///     the token ID for non-fungible tokens.
  function announce(uint256 schemeId, address stealthAddress, bytes memory ephemeralPubKey, bytes memory metadata) external;
}


/// @notice Announcing when something is sent to a stealth address.
contract ERC5564Announcer is IERC5564Announcer {
  function announce(uint256 schemeId, address stealthAddress, bytes memory ephemeralPubKey, bytes memory metadata) external {
    emit Announcement(schemeId, stealthAddress, msg.sender, ephemeralPubKey, metadata);
  }
}
