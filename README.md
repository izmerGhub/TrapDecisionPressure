# TrapDecisionPressure - Drosera Trap

🚨 A custom Drosera Trap that detects high pressure conditions and returns a decision string.

---

## 🔍 What It Does

TrapDecisionPressure is a smart contract Trap that:
- Queries an external response contract for a **pressure status** (`bool`).
- Retrieves a **decision string** from the response contract.
- Responds only if pressure is high **and** the decision string equals `"A"`.
- Returns a custom message acknowledging the decision when triggered.

This trap demonstrates dynamic data collection and conditional response logic on-chain, simulating pressure-sensitive decision making.

---

## 📂 Folder Structure

TrapDecisionPressure/
├── contracts/
│ ├── TrapDecisionPressure.sol # Main trap contract
│ └── DecisionResponseMock.sol # Mock response contract for testing
├── drosera.toml # Drosera configuration file
└── README.md # Project documentation (this file)

---

## 📦 Deployment Info

- **Trap Contract Path**: `out/TrapDecisionPressure.sol/TrapDecisionPressure.json`  
- **Response Contract Address**: `0x25E2CeF36020A736CF8a4D2cAdD2EBE3940F4608`  
- **Response Function**: `respondWithDecision(string)`  
- **Trap Address**: *(fill in once deployed)*

---

## ✅ Status

- Contracts compiled successfully using Foundry ✅  
- Deployed on Ethereum Hoodi testnet ✅  
- Passed trap dryrun with `shouldRespond == true` ✅  
- Logs demonstrate successful claim submissions ✅  

---

## 📝 How to Use

1. Compile contracts inside the `contracts/` folder.  
2. Deploy `DecisionResponseMock` first (for local tests).  
3. Deploy `TrapDecisionPressure` with the mock or real response contract address.  
4. Configure `drosera.toml` to point to deployed contracts and set trap parameters.  
5. Run Drosera operator and monitor logs for trap execution and claims.

---

## 🔗 Related Links

- Drosera Documentation: [https://docs.drosera.io](https://docs.drosera.io)  
- Twitter Thread: *(add your thread URL here)*  

