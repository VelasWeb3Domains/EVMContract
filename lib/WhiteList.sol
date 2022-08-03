pragma solidity ^0.8.0;

abstract contract WhiteList is AdminControl {

    mapping(address => uint8) private _whiteList;
	
	bool public isWhiteListActive = false;

    function setWhiteListActive(bool _isWhiteListActive) external onlyOwner {
        isWhiteListActive = _isWhiteListActive;
    }

    function addWhiteLists(address[] calldata addresses, uint8 numbers) external onlyMinterController {
        for (uint256 i = 0; i < addresses.length; i++) 
		{
            _whiteList[addresses[i]] = numbers;
        }
    }
	
	function addWhiteList(address _address, uint8 numbers) external onlyMinterController {
        _whiteList[_address] = numbers;
    }
	
	function numberInWhiteList(address addr) external view returns (uint8) {
        return _whiteList[addr];
    }
	
	function chkInWhiteList(address addr) external view returns (bool) {
        return _whiteList[addr] > 0;
    }
}