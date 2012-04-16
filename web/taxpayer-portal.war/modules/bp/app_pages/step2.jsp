<div r:context="app" r:type="label">
	<table class="form section">
		<tr>
			<th width="80px">Tradename</th>
			<td>:</td>
			<td>
				#{app.info.tradename}
			</td>
		</tr>
		<tr>
			<th>Address</th>
			<td>:</td>
			<td>
				#{app.info.businessaddress}
			</td>
		</tr>
	</table>
</div>

<h3 class="section-title">
	<span class="step">2</span>
	Line(s) of Business
</h3>

<div class="main-content">
	<div class="section">
		<input r:context="app" r:name="lobsearchkey" 
			   r:suggest="searchLob" r:suggestName="searchedLob" r:suggestExpression="#{name}"
			   r:hint="Type A Line of Business Keyword Here." r:hintclass="search-hint"
			   type="text" class="search" style="width:400px"/>
	</div>

	<table r:context="app" r:items="app.lobs" r:varName="lob" r:name="selectedLob" r:varStatus="stat"
		   class="grid" cellpadding="0" cellspacing="0" width="500px">
		<thead>
			<tr>
				<th align="left">Name</th>
				<th align="left">Assessment Type</th>
				<th align="left">Year</th>
				<th align="left" width="50px">&nbsp;</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>#{lob.name}</td>
				<td>
					<span r:context="app" r:visibleWhen="#{!canEditLob(lob)}">
						#{lob.assessmenttype}
					</span>
					<span r:context="app" r:visibleWhen="#{canEditLob(lob)}" style="display:none">
						<select r:context="app" r:name="app.lobs[#{stat.index}].assessmenttype">
							<option value="RENEW">RENEW</option>
							<option value="RETIRELOB">RETIRELOB</option>
						</select>
					</span>
				</td>
				<td>#{lob.iyear}</td>
				<td align="center">
					<a r:context="app" r:name="removeLob" r:visibleWhen="#{canRemoveLob(lob)}">
						Remove
					</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>