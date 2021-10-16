import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity >=0.6.12;

contract PartyTokenV2 is ERC20("PARTY V2", "PARTY"), Ownable {
    using SafeMath for uint256;

    uint256 public constant initialSupply = 110000000000000000000000000;

    bytes32 public DOMAIN_SEPARATOR;
    bytes32 public constant PERMIT_TYPEHASH =
        0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    mapping(address => uint256) public nonces;
    
    ERC20 public oldParty;

    constructor(address initialTotalSupplyHolder, address _oldToken) public {
        uint256 chainId;
        assembly {
            chainId := chainid()
        }
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256(
                    "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
                ),
                keccak256(bytes(name())),
                keccak256(bytes("1")),
                chainId,
                address(this)
            )
        );
        _mint(initialTotalSupplyHolder, initialSupply);
        
        oldParty = ERC20(_oldToken);
    }

    // Burns the callers tokens
    function burnOwnTokens(uint256 _amount) external {
        _burn(msg.sender, _amount);
    }

    function _swapToNewParty(uint256 tokens, address from) internal {
		oldParty.transferFrom(from, address(0x01), tokens);
	    this.transfer(from, tokens);
		emit Transfer(address(0), from, tokens);
	}
	
	function swapToNewParty(uint256 tokens) public {
		_swapToNewParty(tokens, msg.sender);
	}
	
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        require(deadline >= block.timestamp, "PARTYV2: EXPIRED");
        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                DOMAIN_SEPARATOR,
                keccak256(
                    abi.encode(
                        PERMIT_TYPEHASH,
                        owner,
                        spender,
                        value,
                        nonces[owner]++,
                        deadline
                    )
                )
            )
        );
        address recoveredAddress = ecrecover(digest, v, r, s);
        require(
            recoveredAddress != address(0) && recoveredAddress == owner,
            "PARTYV2: INVALID_SIGNATURE"
        );
        _approve(owner, spender, value);
    }
}
