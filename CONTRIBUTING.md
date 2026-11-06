# 贡献指南 · Contributing Guide

感谢你关注 **Verifiable Trade Event Protocol**。这是一个**公开研究型项目**：最缺的不是代码，而是对真实贸易链路的严谨反馈。

## 最欢迎的贡献

- **指出某个"可验证条件"其实不可验证**：数据源、法律控制权、事件绑定、撤销与回滚——这类反驳比 PR 更有价值。
- **真实业务约束**：某个法域的海关 / eBL / 银行接口实际怎么运作、有哪些权限与成本门槛。
- **标准引用**：DCSA、MLETR、Incoterms 等标准的准确出处与版本差异。
- **威胁模型补充**：TLS 终端、数据源签名、会话安全、nullifier 防重放、争议期攻击面。

请开 Issue，附上**出处或场景描述**即可。

## 不通过公开 Issue 讨论的内容

- 任何真实订单、客户、单据中的敏感数据；
- 第三方平台的凭据、接口密钥、未公开文档；
- 涉及真实资金的安全问题 → 走 [SECURITY.md](SECURITY.md) 私下渠道。

## 文档与代码约定

1. Fork 并建分支：`git checkout -b docs/your-topic`
2. 保持口径：**区分"能验证什么"与"不能验证什么"**，任何放款条件都要写明数据源与边界；不把示例金额写成行业规则。
3. 修改研究结论请同步更新 [`docs/RESEARCH.md`](docs/RESEARCH.md)（Source of Truth）与对应网页版，避免两处不一致。
4. 网页为纯静态 HTML，共用 `style.css`；新增页面请沿用现有 class 与中英双语约定（中文在上、英文斜体在下）。
5. `contracts/` 下的代码仅为**示意结构**，提交时请保留 `ILLUSTRATIVE / NOT AUDITED` 标注，不要引入可部署逻辑。
6. Commit 信息用英文祈使句（`Add ... / Fix ... / Update ...`）。

## 行为准则

参与即同意遵守 [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)。
