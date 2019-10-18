pragma solidity 0.5.11;


interface DharmaAccountRecoveryManagerInterface {
  // Fires an event whenever a user signing key is recovered for an account.
  event Recovery(
    address indexed wallet, address oldUserSigningKey, address newUserSigningKey
  );

  // Fire an event whenever account recovery is disabled for an account.
  event RecoveryDisabled(address wallet);

  function initiateAccountRecovery(
    address smartWallet, address userSigningKey, uint256 extraTime
  ) external;

  function initiateAccountRecoveryDisablement(
    address smartWallet, uint256 extraTime
  ) external;

  function recover(address wallet, address newUserSigningKey) external;

  function disableAccountRecovery(address wallet) external;

  function accountRecoveryDisabled(
    address wallet
  ) external view returns (bool hasDisabledAccountRecovery);

  function initiateModifyTimelockInterval(
    bytes4 functionSelector, uint256 newTimelockInterval, uint256 extraTime
  ) external;

  function modifyTimelockInterval(
    bytes4 functionSelector, uint256 newTimelockInterval
  ) external;

  function initiateTimelockExpiration(
    bytes4 functionSelector, uint256 newTimelockExpiration, uint256 extraTime
  ) external;

  function modifyTimelockExpiration(
    bytes4 functionSelector, uint256 newTimelockExpiration
  ) external;
}