<h3 class="section-title">
	<span class="step">1</span>
	Business Information
</h3>

<div class="main-content">
	<table class="form section">
		<tr>
			<th width="80px">Tradename</th>
			<td><span class="req">*</span>:</td>
			<td>
				<input type="text" r:context="app" r:name="app.info.tradename" size="60" 
					   r:textcase="upper" r:required="true" r:caption="Tradename" ${toggleInput}/>
			</td>
		</tr>
		<tr>
			<th>Address</th>
			<td><span class="req">*</span>:</td>
			<td>
				<input type="text" r:context="app" r:name="app.info.businessaddress" size="60" 
					   r:textcase="upper" r:required="true" r:caption="Business address" ${toggleInput}/>
			</td>
		</tr>
		<tr>
			<th>Administrator</th>
			<td>:</td>
			<td>
				<input type="text" r:context="app" r:name="app.info.administratorname" size="60" 
					   r:textcase="upper" ${toggleInput}/>
			</td>
		</tr>
		<tr>
			<th>Address</th>
			<td>:</td>
			<td>
				<input type="text" r:context="app" r:name="app.info.administratoraddress" size="60" 
					   r:textcase="upper" ${toggleInput}/>
			</td>
		</tr>
	</table>

	<table class="form section">
		<tr>
			<td>
				<table class="form" width="300px">
					<tr>
						<th width="80px">Organization</th>
						<td><span class="req">*</span>:</td>
						<td>
							<select r:context="app" r:name="app.info.organization" r:items="organizations" 
									style="width:100%" r:required="true" ${toggleInput}>
							</select>
						</td>
					</tr>
					<tr>
						<th>Office Type</th>
						<td><span class="req">*</span>:</td>
						<td>
							<select r:context="app" r:name="app.info.officetype" r:items="officeTypes" 
									style="width:100%" r:required="true" ${toggleInput}>
							</select>
						</td>
					</tr>
					<tr>
						<th>Barangay</th>
						<td><span class="req">*</span>:</td>
						<td>
							<select r:context="app" r:name="app.info.barangay" r:items="barangays" r:itemLabel="barangayname" 
									style="width:100%" r:required="true" ${toggleInput}>
							</select>
						</td>
					</tr>
					<tr>
						<th>BIN</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.bin" 
								   style="width:100%" ${toggleInput}/>
						</td>
					</tr>
					<tr>
						<th>PIN</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.pin"
								   style="width:100%" ${toggleInput}/>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="form" class="right-form">
					<tr>
						<th>CTC No.</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.ctcno" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<th>CTC Place Issued</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.ctcplaceissued" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<th>CTC Date Issued</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.ctcdateissued" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<th>TIN</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.tin"/>
						</td>
					</tr>
					<tr>
						<th>Contact No.</th>
						<td>:</td>
						<td>
							<input type="text" r:context="app" r:name="app.info.contactno"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>