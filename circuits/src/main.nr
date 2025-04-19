fn main(address: Field, contract_address: pub Field) {
    // Safety: We are using an unsafe function to get the NFT owning status
    let owns_nft = unsafe { get_nft_owning([address, contract_address]) };
    let nft_status = owns_nft[0];
    assert(nft_status == 1);
}

#[oracle(getNftOwning)]
unconstrained fn nft_owning(addresses: [Field; 2]) -> [Field; 1] {}

unconstrained fn get_nft_owning(addresses: [Field; 2]) -> [Field; 1] {
    let response = nft_owning(addresses);
    println(response);
    response
}

#[test]
fn test_nft_owning() {
    let address = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    let contract_address = 0x742d35Cc6634C0532925a3b844Bc454e4438f44e;
    println(1);
    main(address, contract_address);
}
