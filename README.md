# Verifiable Trade Event Protocol · 可验证贸易履约事件协议

> **将可信第三方产生的标准化贸易事件，转换成可验证的付款条件。**
> *Turning standardized, third-party trade events into verifiable payment conditions.*

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Stage: Research](https://img.shields.io/badge/stage-Research-blue.svg)](docs/RESEARCH.md)
[![Scope: Public research](https://img.shields.io/badge/scope-Public%20research-purple.svg)](whitepaper.html)
[![Standard: DCSA T&T](https://img.shields.io/badge/standard-DCSA%20Track%20%26%20Trace-yellow.svg)](https://dcsa.org/standards/track-and-trace)

---

## 这是什么 / What this is

一个**公开的研究型开源项目**：研究如何把国际贸易中已经标准化、由可信第三方产生的数字事件（装船、卸货、eBL 签发、银行入账、单据相符），转化为可编程资金托管的自动放款条件。

> **核心判断：** 最值得优先验证的，不是让 AI 自动判定货物质量，而是将已经标准化、由可信第三方产生的数字事件转化为自动放款条件。建议从 **DCSA Track & Trace → TEE 验证 → USDC Escrow** 切入。

*An open research project on converting standardized third-party trade events into verifiable payment conditions for programmable escrow — starting from DCSA Track & Trace, not from "AI judges cargo quality".*

**本仓库不是**：已上线产品、已完成的安全审计、法律意见，或对第三方数据接入可用性的承诺。文中所有金额与里程碑比例均为设计示例。

---

## 三层架构 / Three layers

| 层 | 作用 | 主要手段 |
| --- | --- | --- |
| **事实层** Facts | 读取可信数据源的物流、单据、支付、交付状态 | 承运人 / eBL / 银行 / 签发机构的可信事件 API |
| **证明层** Proof | 验证来源与业务规则，必要时隐藏敏感字段 | 可信 API / 签名数据 + TEE 远程证明 + 结构化签名；后续可选 ZKP |
| **结算层** Settlement | 依经验证的事件释放、冻结或退回资金 | Peer 式 Escrow / `MilestoneOrchestrator` / USDC |

**三种能力必须区分**（见白皮书 §一）：数据来源认证 ≠ TEE 远程证明 ≠ ZKP。第一版不必同时引入 TEE 与 ZKP。

---

## 本仓库内容 / Repository map

| 路径 | 内容 |
| --- | --- |
| [`index.html`](index.html) | 协议首页：定位、三层架构、核心判断、首要研究题目 |
| [`whitepaper.html`](whitepaper.html) | 完整白皮书（九章 + 参考资料），网页可读版 |
| [`architecture.html`](architecture.html) | 技术架构、证明数据结构、链上可检查约束、安全边界 |
| [`scenarios.html`](scenarios.html) | 环节评级表、三个应用场景、多里程碑托管协议 |
| [`roadmap.html`](roadmap.html) | P0 / P1 / P2 优先级、商业效果与不会天然提供的能力 |
| [`peer.html`](peer.html) | Peer / ZKP2P 参考组件映射、不能直接照搬之处、参考资料 |
| [`docs/RESEARCH.md`](docs/RESEARCH.md) | 研究文档原文（Markdown，Source of Truth） |
| [`contracts/TradeEventProof.sol`](contracts/TradeEventProof.sol) | 示意数据结构，**仅用于说明，未审计、不可部署** |

社区文件：`CONTRIBUTING.md` · `CODE_OF_CONDUCT.md` · `SECURITY.md`

---

> 在线站点 Live site：**https://sinyu1998-eng.github.io/verifiable-trade-events/** （GitHub Pages）

## 快速开始 / Quick start

纯静态站点，无构建步骤、无外部 CDN 依赖。

```bash
python3 -m http.server 8000
# 打开 http://localhost:8000/index.html
```

部署到 GitHub Pages 时，直接把 **Source 指向仓库根目录 / 主分支**即可；所有链接均为相对路径。


---

## 与 CloudSail 商业产品的关系 / Relationship to CloudSail

> 这一条很重要，避免两套东西被混为一谈。

本仓库是**独立的研究与协议规范项目**，与商业化产品 **CloudSail（AI 全托管外贸运营）** 分离：

- **本仓库**：公开研究文档、协议数据结构示意、开源讨论与社区反馈；MIT 许可。
- **CloudSail 商业产品**：闭源的运营系统、客户数据、收款与链上放款实现；**不包含在本仓库**。

研究结论可供任何一方参考，但**不代表商业产品已实现对应能力**，也不构成其路线图承诺。反之，商业产品的运营数据不会进入本仓库。

---

## 边界 / Boundaries

写进设计里、也请写进任何对外表述里：

- **装船 ≠ 质量合格**；承运人记录已装船，不等于箱内货物符合合同质量要求。
- **单据内部一致 ≠ 交易真实**；若文件仅由卖家自行上传、无可信签发者，只能证明文件之间一致。
- **TEE 处理过 API 响应 ≠ 响应未被伪造**；TLS 终端认证、数据源签名、会话安全与输入来源证明必须纳入威胁模型。ZKP 也不能弥补错误的原始数据。
- **Escrow ≠ 信用证**；不默认提供银行信用背书、融资、成熟的国际争议制度或法律执行网络。
- **Incoterms 不设定付款时间**；FOB / CIF 等术语下的付款触发器仍需在具体合同中单独约定。

---

## 参考资料 / References

- [Peer / ZKP2P 开源合约](https://github.com/zkp2p/zkp2p-contracts)
- [DCSA Track & Trace](https://dcsa.org/standards/track-and-trace) · [Implementation Guides](https://reference.dcsa.org/content/standards/guidelines/implementation-guides/implementing-track-and-trace)
- [DCSA Electronic Bill of Lading](https://dcsa.org/standards/bill-of-lading)
- [UNCITRAL MLETR：电子可转让记录示范法](https://uncitral.un.org/en/texts/ecommerce/modellaw/electronic_transferable_records)

---

*本文基于公开技术标准与协议设计思路提出研究框架，不是已完成的系统安全审计、法律意见或第三方数据接入可用性承诺。文中所有金额、里程碑比例均为示例。*

## License

[MIT](LICENSE) © 2026 Qianru (Carol Qianru Huang)
