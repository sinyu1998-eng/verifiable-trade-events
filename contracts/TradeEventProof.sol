// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title  TradeEventProof — ILLUSTRATIVE DATA STRUCTURE
 * @notice 仅用于研究说明，不是可部署合约，未经安全审计，请勿用于任何真实资金。
 *         ILLUSTRATIVE — NOT AUDITED — DO NOT DEPLOY.
 *
 * 来源：docs/RESEARCH.md §5「建议的统一 TEE + Escrow 技术架构」
 *
 * 实际合约还需要（原文明确列出）：
 *   - 链 ID 与合约域隔离（chainId / domain separator）
 *   - 签名者授权与验证器密钥轮换
 *   - 数据签发时间、撤销策略、过期与失效证明处理
 *   - 争议冻结、仲裁、退款与超时处理
 *   - 部分里程碑放款、资金不足、重复执行、权限变更
 *
 * 链上可检查的约束（原文 §5）：
 *   1) 来源在该订单的认可数据源集合内；
 *   2) 订单、货物/集装箱和事件存在受信任的绑定；
 *   3) 事件是实际发生状态而不是计划状态；
 *   4) 事件时间满足合同约束；
 *   5) 证明绑定到正确的合约、链、订单和里程碑；
 *   6) 证明未过期、未撤销，且结算授权未被重复使用。
 *
 * 安全重点：TEE 处理过 API 响应，不代表 API 响应没有被伪造；
 *          ZKP 也不能自动弥补错误的原始数据。
 */
struct TradeEventProof {
    bytes32 orderCommitment;         // 订单承诺
    bytes32 milestoneId;             // 里程碑标识
    bytes32 trustedSourceId;         // 可信数据源标识
    bytes32 sourceRecordCommitment;  // 源记录承诺
    bytes32 eventType;               // 事件类型（如 DCSA 实际装船）
    bytes32 policyHash;              // 业务规则版本
    bytes32 verifierVersion;         // 验证器版本
    uint256 expiry;                  // 过期时间
    bytes32 nullifier;               // 防重放标识
}

/**
 * @dev 故意不包含任何执行逻辑：本仓库是研究型项目，
 *      不提供放款、托管或验证实现。组件命名（TradeEscrow /
 *      MilestoneOrchestrator / TradeEventVerifier / DisputePolicy）
 *      仅为 README 与白皮书中的设计映射。
 */
