Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QMwwq-0001Ee-EU
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 08:43:04 +0200
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p4J6e95v014197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 01:40:09 -0500
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4J6e86J000510
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 01:40:09 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Thu, 19 May 2011 08:40:08 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 19 May 2011 08:40:05 +0200
Thread-Topic: Pull Request: [PATCH] ti-wifi-utils: update to use the latest
	release
Thread-Index: AcwVbFsGA5lFnHj7RmCPK3DaqAFEawAgo2mw
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F03323CEF86@dnce02.ent.ti.com>
References: <y> <1305614722-5460-1-git-send-email-eyalr@ti.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F03323CEDC7@dnce02.ent.ti.com>
	<1305730807.4389.6.camel@mattotaupa>
In-Reply-To: <1305730807.4389.6.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Pull Request: [PATCH] ti-wifi-utils: update to use the latest release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 06:43:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkNvdWxkIHlvdSBwbGVhc2UgcHVsbCB0aGUgYmVsb3cgcGF0Y2ggdG8gdGhlIDIwMTEu
MDMtbWFpbnRlbmFuY2UgYnJhbmNoLg0KDQpodHRwOi8vY2dpdC5vcGVuZW1iZWRkZWQub3JnL2Nn
aXQuY2dpL29wZW5lbWJlZGRlZC9jb21taXQvP2lkPTE2ZmNiYzZhNzZlNmRjZGQxNWYzNjE2M2Nk
NDdlNmMwNzAyYzI5ZjUNCg0KQmVzdCBSZWdhcmRzLA0KRXlhbCBSZWl6ZXINCg0KDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbC1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBQYXVsIE1lbnpl
bA0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxOCwgMjAxMSA2OjAwIFBNDQo+IFRvOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBQ
aW5nOiBbUEFUQ0hdIHRpLXdpZmktdXRpbHM6IHVwZGF0ZSB0byB1c2UgdGhlIGxhdGVzdA0KPiBy
ZWxlYXNlDQo+IA0KPiBEZWFyIEV5YWwsDQo+IA0KPiANCj4gQW0gTWl0dHdvY2gsIGRlbiAxOC4w
NS4yMDExLCAxNjozNyArMDIwMCBzY2hyaWViIFJlaXplciwgRXlhbDoNCj4gDQo+ID4gSXMgdGhl
cmUgYW55dGhpbmcgaG9sZGluZyB0aGlzIHBhdGNoIGZyb20gYmVpbmcgYWNjZXB0ZWQ/DQo+IA0K
PiBLb2VuIHB1c2hlZCBpdCBhbHJlYWR5IHllc3RlcmRheSBbMV0uDQo+IA0KPiBQbGVhc2UgdXBk
YXRlIHRoZSBzdGF0ZSBpbiBPReKAmXMgcGF0Y2ggcXVldWUgWzJdLg0KPiANCj4gDQo+IFRoYW5r
cywNCj4gDQo+IFBhdWwNCj4gDQo+IA0KPiBbMV0NCj4gaHR0cDovL2NnaXQub3BlbmVtYmVkZGVk
Lm9yZy9jZ2l0LmNnaS9vcGVuZW1iZWRkZWQvY29tbWl0Lz9pZD0xNmZjYmM2YTcNCj4gNmU2ZGNk
ZDE1ZjM2MTYzY2Q0N2U2YzA3MDJjMjlmNQ0KPiBbMl0gaHR0cDovL29wZW5lbWJlZGRlZC5vcmcv
aW5kZXgucGhwL1BhdGNod29yaw0K


