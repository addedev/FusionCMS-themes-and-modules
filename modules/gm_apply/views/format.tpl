<center>
	{form_open("gm_apply/submit")}
		<input type="text" htmlspecialchars name="name" placeholder="Name" required ></input><br />
		<input type="text" htmlspecialchars name="age" placeholder="Age" required ></input><br />
		<input type="text" htmlspecialchars name="country" placeholder="Country" required ></input><br /><br />
		{$info1}<br /><br />
		<input type="text" htmlspecialchars name="info1" placeholder="Example: Months-Weeks-Days" required ></input><br /><br />
		{if $questionnr >= 2}
		{$info2}<br /><br />
		<textarea type="text" htmlspecialchars name="info2" rows="5" cols="90" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 3}
		{$info3}<br /><br />
		<textarea type="text" htmlspecialchars name="info3" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 4}
		{$info4}<br /><br />
		<textarea type="text" htmlspecialchars name="info4" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 5}
		{$info5}<br /><br />
		<textarea type="text" htmlspecialchars name="info5" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 6}
		{$info6}<br /><br />
		<textarea type="text" htmlspecialchars name="info6" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 7}
		{$info7}<br /><br />
		<textarea type="text" htmlspecialchars name="info7" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 8}
		{$info8}<br /><br />
		<textarea type="text" htmlspecialchars name="info8" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 9}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info9" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 10}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info10" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 11}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info11" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 12}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info12" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 13}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info13" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 14}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info14" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		{if $questionnr >= 15}
		{$info9}<br /><br />
		<textarea type="text" htmlspecialchars name="info15" rows="5" cols="90" value="" required  ></textarea><br /><br />
		{else}
		{/if}
		<br />
		<input type="submit" value="Submit"/>
	</form>
<br /><br />
</center>