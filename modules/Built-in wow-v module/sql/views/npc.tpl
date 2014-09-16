<center>
<br /><br />
{form_open("sql/npc/submit")}
<input type="text" name="name" id="name" placeholder="Name" required  /></input><br />
<input type="text" name="subname" id="subname" placeholder="Subname" /></input><br />
<input type="text" name="entry" id="entry" placeholder="Entry ID" required  /></input><br />
<input type="text" name="display" id="display" placeholder="Display ID" required  /></input><br />
Rank<br />
<select name="rank" id="rank">
	<option value="0">Normal</option>
	<option value="1">Elite</option>
	<option value="2">Rare Elite</option>
	<option value="3">World Boss</option>
	<option value="4">Rare</option>
</select><br />
<input type="text" name="faction" id="faction" placeholder="Faction ID" required  /></input><br />
Type<br />
<select name="type" id="type">
	<option value="10">Not Specified</option>
	<option value="1">Beast</option>
	<option value="2">Dragonkin</option>
	<option value="3">Demon</option>
	<option value="4">Elemental</option>
	<option value="5">Giant</option>
	<option value="6">Undead</option>
	<option value="7">Humanoid</option>
	<option value="8">Critter</option>
	<option value="9">Mechanical</option>
	<option value="11">Totem</option>
	<option value="13">Gas Cloud</option>
	<option value="12">Non-Combat Pet</option>
</select><br />Family<br />
<select name="family" id="family">
	<option value="0">No Family</option>
	<option value="1">Wolf</option>
	<option value="2">Cat</option>
	<option value="3">Spider</option>
	<option value="4">Bear</option>
	<option value="5">Boar</option>
	<option value="6">Crocolisk</option>
	<option value="7">Carrion Bird</option>
	<option value="8">Crab</option>
	<option value="9">Gorilla</option>
	<option value="11">Raptor</option>
	<option value="12">Tallstrider</option>
	<option value="15">Felhunter</option>
	<option value="16">Voidwalker</option>
	<option value="17">Succubus</option>
	<option value="19">Doomguard</option>
	<option value="20">Scorpid</option>
	<option value="21">Turtle</option>
	<option value="23">Imp</option>
	<option value="24">Bat</option>
	<option value="25">Hyena</option>
	<option value="26">Owl</option>
	<option value="27">Wind Serpent</option>
	<option value="28">Remote Control</option>
	<option value="29">Felguard</option>
	<option value="30">Dragonhawk</option>
	<option value="31">Ravager</option>
	<option value="32">Warp Stalker</option>
	<option value="33">Sporebat</option>
	<option value="34">Nether Ray</option>
	<option value="35">Serpent</option>
	<option value="36">Sea Lion</option>
</select><br />
<input type="text" name="scale" id="scale" placeholder="Scale" required  /></input><br />
<input type="text" name="armor" id="armor" placeholder="Armor" required  /></input><br />
<input type="text" name="health" id="health" placeholder="Health - how much health should the creature have?" required  /></input><br />
<input type="text" name="mana" id="mana" placeholder="Mana" required  /></input><br />
<input type="text" name="minlvl" id="minlvl" placeholder="Min Level" required  /></input><br />
<input type="text" name="maxlvl" id="maxlvl" placeholder="Max Level" required  /></input><br />
<input type="text" name="mindmg" id="mindmg" placeholder="Min Damage" required  /></input><br />
<input type="text" name="maxdmg" id="maxdmg" placeholder="Max Damage" required  /></input><br />
<input type="text" name="Speed" id="Speed" placeholder="Attack Speed" required  /></input><br />
<input type="text" name="drop" id="drop" placeholder="Gold Drop in copper" required  /></input><br />


<input type="submit" value="Create"/>
</form>
</center>