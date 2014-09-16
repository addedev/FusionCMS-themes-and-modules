<?php

class makeQuest extends CI_Model
{
	public function submit()
	{
		$db = $this->realms->getRealm(1)->getWorld()->getConnection();
		$querys_end = $db->query("INSERT INTO creature_involvedrelation values (?, ?)", array($this->input->post('end'), $this->input->post('entry')));
		$querys_start = $db->query("INSERT INTO creature_questrelation values (?, ?)", array($this->input->post('start'), $this->input->post('entry')));
		$querys = $db->query("INSERT INTO quest_template (Id, Level, MinLevel, MaxLevel, ZoneOrSort, Type, rewardXPId, RewardHonorMultiplier, RewardItemId1, RewardItemId2, RewardItemId3, RewardItemId4, RewardItemCount1, RewardItemCount2, RewardItemCount3, RewardItemCount4, Title, Objectives, Details, RequestItemsText, CompletedText, RequiredNpcOrGo1, RequiredNpcOrGo2, RequiredNpcOrGo3, RequiredNpcOrGo4, RequiredNpcOrGoCount1, RequiredNpcOrGoCount2, RequiredNpcOrGoCount3, RequiredNpcOrGoCount4, RequiredItemId1, RequiredItemId2, RequiredItemId3, RequiredItemId4, RequiredItemCount1, RequiredItemCount2, RequiredItemCount3, RequiredItemCount4) VALUES (?, 255, ?, 0, ?, ?, 7, 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($this->input->post('entry'), $this->input->post('reqlvl'), $this->input->post('zoneid'), $this->input->post('type'),  $this->input->post('item1'), $this->input->post('item2'), $this->input->post('item3'), $this->input->post('item4'), $this->input->post('amitem1'), $this->input->post('amitem2'), $this->input->post('amitem3'), $this->input->post('amitem4'), $this->input->post('title'), $this->input->post('objects'), $this->input->post('details'), $this->input->post('incomp'), $this->input->post('comp'), $this->input->post('reqnpc1'), $this->input->post('reqnpc2'), $this->input->post('reqnpc3'), $this->input->post('reqnpc4'), $this->input->post('amnpc1'), $this->input->post('amnpc2'), $this->input->post('amnpc3'), $this->input->post('amnpc4'), $this->input->post('reqitem1'), $this->input->post('reqitem2'), $this->input->post('reqitem3'), $this->input->post('reqitem4'), $this->input->post('amitem1'), $this->input->post('amitem2'), $this->input->post('amitem3'), $this->input->post('amitem4')));
		return $querys;
		return $querys_end;
		return $querys_start;
	}
}