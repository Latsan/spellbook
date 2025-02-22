# Optimism Contract Mapping
This repository contains all the source code for `contracts_optimism.contract_mapping` that you can use to join contract addresses on Optimism to pull our mapped project names in the `contract_project` field.

Mappings are derived from either mapping the contract deployer address to a project name `contracts_optimism.contract_creator_address_list`, reading from Dune's decoded contracts or manually overriding when the creator is not deterministic (i.e. the deployer creates contracts for multiple projects). We also use `contracts_optimism.project_name_mappings` to consolidate variations in project names. You can find the dependency graph generated by dbt [here](https://spellbook-docs.dune.com/#!/model/model.spellbook.contracts_optimism_contract_mapping).

## How to Use
Below is a simplified example of using contract mapping table to get apps creating most transactions in the last 24 hours. There are other nuances including handling Kwenta/Synthetix transactions, labelling methods and bot activities that you can reference [here](https://dune.com/queries/491942/932394).

```sql
select 
  cm.contract_project
  ,count(*) as num_txs
  ,sum(t.l1_fee + t.gas_used * t.gas_price)/1e18 as eth_fees
from optimism.transactions as t 
join contracts_optimism.contract_mapping as cm
  on t.`to` = cm.contract_address
  and not is_self_destruct
where 
  t.block_time > now() - interval '24 hours'
  and t.success
group by 1
order by 2 desc
```

## How To Contribute
1. Follow the format and add the creator address and contract project to `contracts_optimism_contract_creator_address_list.sql`
2. If you want to enforce consistent project name mapping other than Dune's decoded contract one, then add the name mapping to `contracts_optimism_project_name_mappings.sql`
3. Submit the pull request (PR) and tag [@MSilb7](https://github.com/MSilb7) or [@chuxinh](https://github.com/chuxinh) if there's any question
4. Once the PR is merged, check on Dune if your work is correctly reflected 🔴✨
