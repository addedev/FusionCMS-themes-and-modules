<center>
<br /><br />
{form_open("sql/loot/submit")}
<input type="text" name="entry" id="entry" placeholder="Creature Entry ID" required  /></input><br />
<input type="text" name="item" id="item" placeholder="Item Id" /></input><br />Drop Chance?(0-100) Leave at 0 for always droping<br/>
<input type="text" name="chance" id="chance" value="0"  /></input><br />Loot Group id - <br />
If you add 2 items with same Group id, only 1 of these will drop <br />(cant drop at same time, even with 100% on both)<br />
So in order to have more than 1 item drop u make the groupid unique id. (not same as before)<br />
<input type="text" name="groupid" id="groupid" value="0" /></input><br />
Min Drop Count<br />
<input type="text" name="minc" id="minc" placeholder="Min Count" value="0" /></input><br />
Max Drop Count<br />
<input type="text" name="maxc" id="maxc" placeholder="Max Count" value="0" /></input><br />

<br /><input type="submit" value="Create"/>
</form>
</center>