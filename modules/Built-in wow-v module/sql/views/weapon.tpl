<center>
<br /><br />
{form_open("sql/weapon/submit")}
<input type="text" name="name" id="name" placeholder="Name" required  /></input><br />
<input type="text" name="display" id="display" placeholder="Display ID" required  /></input><br />
<input type="text" name="entry" id="entry" placeholder="Entry ID" required  /></input><br />
Quality<br />
<select name="quality" id="quality">
	<option value="0">Grey</option>
	<option value="1">White</option>
	<option value="2">Green</option>
	<option value="3">Blue/Rare</option>
	<option value="4">Purple/Epic</option>
	<option value="5">Orange/Legendary</option>
</select><br />Equip As<br />
<select name="equip" id="equip">
	<option value="13">One Hand</option>
	<option value="21">Main Hand</option>
	<option value="22">Off Hand</option>
	<option value="17">Two Handed</option>
	<option value="15">Bow</option>
	<option value="25">Thrown</option>
	<option value="26">Crossbow</option>
	<option value="26">Gun/Wand</option>
</select><br />Type<br />
<select name="type" id="type">
	<option value="0">1H Axe</option>
	<option value="1">2H Axe</option>
	<option value="2">Bow</option>
	<option value="3">Gun</option>
	<option value="4">1H Mace</option>
	<option value="5">2H Mace</option>
	<option value="6">Polearm</option>
	<option value="7">1H Sword</option>
	<option value="8">2H Sword</option>
	<option value="10">Staff</option>
	<option value="13">Fist Weapon</option>
	<option value="15">Dagger</option>
	<option value="16">Throwing</option>
	<option value="17">Spear</option>
	<option value="18">Crossbow</option>
	<option value="19">Wand</option>
</select><br />Bind As<br />
<select name="binds" id="binds">
	<option value="0">None</option>
	<option value="1">On Pickup</option>
	<option value="2">On Equip</option>
	<option value="3">On Use</option>
</select><br />Sheat - Where will it be shown on your character, Side/back<br />
<select name="sheat" id="sheat">
	<option value="3">One Handed</option>
	<option value="1">Two Handed</option>
	<option value="2">Staff</option>
	<option value="0">Ranged</option>
</select><br />
<input type="text" name="speed" id="speed" placeholder="Speed" required  /></input><br />
<input type="text" name="reqlvl" id="reqlvl" placeholder="Required Level" required  /></input><br />
<input type="text" name="itemlvl" id="itemlvl" placeholder="Item Level" required  /></input><br />
<input type="text" name="maxnr" id="maxnr" placeholder="Max Number Allowed. Set to 0 for unlimited" required  /></input><br />
<input type="text" name="stacks" id="stacks" placeholder="Stackable. Set to 0 for normal" required  /></input><br />
<input type="text" name="mindmg" id="mindmg" placeholder="Min Damage" required  /></input><br />
<input type="text" name="maxdmg" id="maxdmg" placeholder="Max Damage" required  /></input><br />
<select name="stype1" id="stype1">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat1" id="stat1" value="0"  /></input><br />
<select name="stype2" id="stype2">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat2" id="stat2" value="0"  /></input><br />
<select name="stype3" id="stype3">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat3" id="stat3" value="0"  /></input><br />
<select name="stype4" id="stype4">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat4" id="stat4" value="0"  /></input><br />
<select name="stype5" id="stype5">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat5" id="stat5" value="0"  /></input><br />
<select name="stype6" id="stype6">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat6" id="stat6" value="0"  /></input><br />
<select name="stype7" id="stype7">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat7" id="stat7" value="0"  /></input><br />
<select name="stype8" id="stype8">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat8" id="stat8" value="0"  /></input><br />
<select name="stype9" id="stype9">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat9" id="stat9" value="0"  /></input><br />
<select name="stype10" id="stype10">Stat Type<br />
	<option value="0">None</option>
	<option value="1">Health</option>
	<option value="3">Agility</option>
	<option value="4">Strength</option>
	<option value="5">Intellect</option>
	<option value="6">Spirit</option>
	<option value="7">Stamina</option>
	<option value="12">Defense</option>
	<option value="13">Dodge</option>
	<option value="14">Parry</option>
	<option value="15">Block</option>
	<option value="37">Expertise</option>
	<option value="35">Resilience</option>
	<option value="41">Healing Bonus</option>
	<option value="42">Damage Bonus</option>
	<option value="43">Mana Per 5 Seconds</option>
	<option value="48">Block Value</option>
	<option value="46">Health Regeneration</option>
	<option value="47">Spell Penetration</option>
	<option value="44">Armor Penetration</option>
	<option value="38">Attack Power</option>
	<option value="31">Hit Rating</option>
	<option value="33">Hit Avoidance</option>
	<option value="32">Hit Crit Rating</option>
	<option value="34">Hit Crit Avoidance</option>
	<option value="36">Hit Haste Rating</option>
	<option value="45">Spell Power</option>
	<option value="40">Feral Attack Power</option>
</select><br />
<input type="text" name="stat10" id="stat10" value="0"  /></input><br />
<input type="text" name="buyprice" id="buyprice" placeholder="Buy Price - in copper. Set to 0 for free." required  /></input><br />
<input type="text" name="sellprice" id="sellprice" placeholder="Sell Price - in copper" required  /></input><br />
Sockets<br />
<select name="gem1" id="gem1">Gem1<br />
	<option value="0">None</option>
	<option value="1">Meta</option>
	<option value="2">Red</option>
	<option value="4">Yellow</option>
	<option value="8">Blue</option>
</select>
<select name="gem2" id="gem2">Gem2<br />
	<option value="0">None</option>
	<option value="1">Meta</option>
	<option value="2">Red</option>
	<option value="4">Yellow</option>
	<option value="8">Blue</option>
</select>
<select name="gem3" id="gem3">Gem3<br />
	<option value="0">None</option>
	<option value="1">Meta</option>
	<option value="2">Red</option>
	<option value="4">Yellow</option>
	<option value="8">Blue</option>
</select>
<select name="gembonus" id="gembonus">Gem Bonus<br />
	<option value="0">No Bonus</option>
	<option value="3312">+8 Strength</option>
	<option value="3313">+8 Agility</option>
	<option value="3305">+12 Stamina</option>
	<option value="3353">+8 Intellect</option>
	<option value="2872">+9 Healing</option>
	<option value="3753">+9 Spell Power</option>
	<option value="3877">+16 Attack Power</option>
</select>
<br /><input type="submit" value="Create"/>
</form>
</center>