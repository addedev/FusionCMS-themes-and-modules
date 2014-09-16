<center>
<br /><br />
{form_open("sql/quest/submit")}
<input type="text" name="entry" id="entry" placeholder="Entry ID" required  /></input><br />
<input type="text" name="zoneid" id="zoneid" placeholder="Zone ID - type .gps ingame" required  /></input><br />
<input type="text" name="title" id="title" placeholder="Title of quest" required  /></input><br />
<input type="text" name="start" id="start" placeholder="Start at NPC entry id" required  /></input><br />
<input type="text" name="end" id="end" placeholder="End at NPC entry id" required  /></input><br />
Type<br />
<select name="type" id="type">
	<option value="0">Normal</option>
	<option value="1">Elite</option>
	<option value="21">Life</option>
	<option value="41">PvP</option>
	<option value="62">Raid</option>
	<option value="81">Dungeon</option>
	<option value="82">World Event</option>
	<option value="83">Legendary</option>
	<option value="84">Escort</option>
	<option value="85">Heroic</option>
</select><br />
<input type="text" name="reqlvl" id="reqlvl" placeholder="Required Level" required  /></input><br />Required Complited Quest<br />
<input type="text" name="reqquest" id="reqquest" value="0"  /></input><br />Quest info<br />
<textarea type="text" rows="5" cols="91" name="details" id="details" placeholder="Details" required  /></textarea><br />
<textarea type="text" rows="5" cols="91" name="objects" id="objects" placeholder="Objectives" required  /></textarea><br />
<textarea type="text" rows="5" cols="91" name="incomp" id="incomp" placeholder="If Incomplete" /></textarea><br />
<textarea type="text" rows="5" cols="91" name="comp" id="comp" placeholder="If Complete" /></textarea><br />
Required Items<br />
<input type="text" name="reqitem1" id="reqitem1" value="0" /></input><br />
Amount of above item?<br />
<input type="text" name="amitem1" id="amitem1" value="0" /></input><br />
Required Items<br />
<input type="text" name="reqitem2" id="reqitem2" value="0" /></input><br />
Amount of above item?<br />
<input type="text" name="amitem2" id="amitem2" value="0" /></input><br />
Required Items<br />
<input type="text" name="reqitem3" id="reqitem3" value="0" /></input><br />
Amount of above item?<br />
<input type="text" name="amitem3" id="amitem3" value="0" /></input><br />
Required Items<br />
<input type="text" name="reqitem4" id="reqitem4" value="0" /></input><br />
Amount of above item?<br />
<input type="text" name="amitem4" id="amitem4" value="0" /></input><br />
Required NPC kills<br />
<input type="text" name="reqnpc1" id="reqnpc1" value="0" /></input><br />
Amount of above NPC?<br />
<input type="text" name="amnpc1" id="amnpc1" value="0" /></input><br />
Required NPC kills<br />
<input type="text" name="reqnpc2" id="reqnpc2" value="0" /></input><br />
Amount of above NPC?<br />
<input type="text" name="amnpc2" id="amnpc2" value="0" /></input><br />
Required NPC kills<br />
<input type="text" name="reqnpc3" id="reqnpc3" value="0" /></input><br />
Amount of above NPC?<br />
<input type="text" name="amnpc3" id="amnpc3" value="0" /></input><br />
Required NPC kills<br />
<input type="text" name="reqnpc4" id="reqnpc4" value="0" /></input><br />
Amount of above NPC?<br />
<input type="text" name="amnpc4" id="amnpc4" value="0" /></input><br />
Quest Rewards<br />-------------<br />
Item ID <br />
<input type="text" name="item1" id="item1" value="0" /></input><br />
Amount of above item ID<br />
<input type="text" name="amitem1" id="amitem1" value="0" /></input><br />
Item ID <br />
<input type="text" name="item2" id="item2" value="0" /></input><br />
Amount of above item ID<br />
<input type="text" name="amitem2" id="amitem2" value="0" /></input><br />
Item ID <br />
<input type="text" name="item3" id="item3" value="0" /></input><br />
Amount of above item ID<br />
<input type="text" name="amitem3" id="amitem3" value="0" /></input><br />
Item ID <br />
<input type="text" name="item4" id="item4" value="0" /></input><br />
Amount of above item ID<br />
<input type="text" name="amitem4" id="amitem4" value="0" /></input><br />


<br /><input type="submit" value="Create"/>
</form>
</center>