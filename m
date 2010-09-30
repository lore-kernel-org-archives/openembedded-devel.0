Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P1IxD-00084s-OL
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 15:13:46 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8UDDTdC021148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 08:13:29 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o8UDDSdp007365
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 08:13:28 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8UDDSAG021115
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 08:13:28 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 30 Sep 2010 08:13:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Sep 2010 08:13:26 -0500
Thread-Topic: [oe] [PATCHv2] am-benchmarks: update to latest version
Thread-Index: ActgMED3wPa9NWTEQsuUeK83XZ2sggAb+dhA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310F20D5C@dlee06.ent.ti.com>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
	<1285803797.5168.3.camel@mattotaupa>
In-Reply-To: <1285803797.5168.3.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Thu, 30 Sep 2010 13:13:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IFBhdWwg
TWVuemVsDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI5LCAyMDEwIDY6NDMgUE0NCj4g
VG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbb2VdIFtQQVRDSHYyXSBhbS1iZW5jaG1hcmtzOiB1cGRhdGUgdG8gbGF0ZXN0IHZlcnNp
b24NCj4gDQo+IERlYXIgQ2hhc2UsDQo+IA0KPiANCj4gQW0gTWl0dHdvY2gsIGRlbiAyOS4wOS4y
MDEwLCAxMjozNyAtMDUwMCBzY2hyaWViIENoYXNlIE1hdXBpbjoNCj4gPiAqIFVwZGF0ZWQgdGhl
IFNSQ1JFViB0byB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgdGhpcyBwcm9qZWN0DQo+ID4gICB3aGlj
aCBpbmNsdWRlcyBzdXBwb3J0IGZvciBtdWx0aXBsZSBwbGF0Zm9ybXMuDQo+ID4gKiBBZGQgQ09N
UEFUSUJMRV9NQUNISU5FIHNldHRpbmcgZm9yIHJlY2lwZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoYXNlIE1hdXBpbiA8Y2hhc2UubWF1cGluQHRpLmNvbT4NCj4gDQo+IGl0IHdvdWxkIGJl
IGdyZWF0IGlmIHlvdSBjb3VsZCBicmllZmx5IG5vdGUgd2hhdCBjaGFuZ2VkIGJldHdlZW4gdGhl
DQo+IHBhdGNoIGl0ZXJhdGlvbnMgYWZ0ZXIgYSAtLS0gbGluZSwgc28gdGhhdCBpdCB3aWxsIGdl
dCByZW1vdmVkIHdoZW4gaXQNCj4gaXMgY29tbWl0dGVkLiB2MSDihpIgdjINCg0KUGF1bCwNCg0K
U29ycnksIEknbSBub3QgZXhhY3RseSBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4gIEFyZSB5b3Ug
c2F5aW5nIEkgc2hvdWxkIGRvOg0KDQotLS0NCldoYXQgSSBjaGFuZ2VkIGluIHRoZSB2MiB2ZXJz
aW9uDQoNCj4gDQo+IFBsZWFzZSBhbHNvIHJlbWVtYmVyIHRvIHVwZGF0ZSB0aGUgcGF0Y2ggcXVl
dWUgWzFdIGFzIHBpY2tlZCBhbGwgcGF0Y2hlcw0KPiBmcm9tIHRoZSBxdWV1ZSBhbmQgdGhlbiBo
YWQgdG8gcmVtb3ZlIHRoZSBmaXJzdCB2ZXJzaW9uIHNpbmNlIGl0IHdhcw0KPiBzdGlsbCBsaXN0
ZWQuDQoNCldpbGwgZG8uICBJIHdhcyB3YWl0aW5nIGZvciBpdCB0byBzaG93IHVwIGluIHBhdGNo
d29yayBhbmQgdGhlbiBpdCBzbGlwcGVkIG15IG1pbmQuICBTb3JyeSBhYm91dCB0aGF0Lg0KDQo+
IA0KPiA+IC0tLQ0KPiA+ICByZWNpcGVzL3RpL2FtLWJlbmNobWFya3Nfc3ZuLmJiIHwgICAxMyAr
KysrKysrKysrLS0tDQo+ID4gIDEgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzL3RpL2FtLWJlbmNobWFy
a3Nfc3ZuLmJiIGIvcmVjaXBlcy90aS9hbS0NCj4gYmVuY2htYXJrc19zdm4uYmINCj4gPiBpbmRl
eCA1MWFjNmFmLi42YWIyOWY1IDEwMDY0NA0KPiA+IC0tLSBhL3JlY2lwZXMvdGkvYW0tYmVuY2ht
YXJrc19zdm4uYmINCj4gPiArKysgYi9yZWNpcGVzL3RpL2FtLWJlbmNobWFya3Nfc3ZuLmJiDQo+
ID4gQEAgLTQsMTUgKzQsMjIgQEAgTElDRU5TRSA9ICJCU0QiDQo+ID4gIFNFQ1RJT04gPSAic3lz
dGVtIg0KPiA+ICBQUklPUklUWSA9ICJvcHRpb25hbCINCj4gPg0KPiA+IC1TUkNSRVYgPSAiMzMi
DQo+ID4gLVBWID0gIjEuMCINCj4gPiArU1JDUkVWID0gIjU2Ig0KPiA+ICtQViA9ICIxLjEiDQo+
ID4gIFBSID0gInIxK3N2bnIke1NSQ1BWfSINCj4gPg0KPiA+ICtDT01QQVRJQkxFX01BQ0hJTkUg
PSAiKGRtMzY1fG9tYXBsMTM4fG9tYXAzfHRpODE2eCkiDQo+ID4gKw0KPiA+ICtBUkNISVRFQ1RV
UkVfZG0zNjUgPSAiYXJtOSINCj4gPiArQVJDSElURUNUVVJFX29tYXBsMTM4ID0gImFybTkiDQo+
ID4gK0FSQ0hJVEVDVFVSRV9vbWFwMyA9ICJjb3J0ZXgtYTgiDQo+ID4gK0FSQ0hJVEVDVFVSRV90
aTgxNnggPSAiY29ydGV4LWE4Ig0KPiA+ICsNCj4gPiAgSU5TQU5FX1NLSVBfJHtQTn0gPSAiVHJ1
ZSINCj4gPg0KPiA+ICBTUkNfVVJJID0NCj4gInN2bjovL2dmb3JnZS50aS5jb20vc3ZuL2FtX2Jl
bmNobWFya3MvO21vZHVsZT10cnVuaztwcm90bz1odHRwczt1c2VyPWFub24NCj4geW1vdXM7cHN3
ZD0nJyINCj4gPg0KPiA+IC1TID0gIiR7V09SS0RJUn0vdHJ1bmsiDQo+ID4gK1MgPSAiJHtXT1JL
RElSfS90cnVuay8ke0FSQ0hJVEVDVFVSRX0iDQo+ID4NCj4gPiAgZG9fY29tcGlsZSgpIHsNCj4g
PiAgCSMgZG9uJ3QgYnVpbGQgZGVidWcgdmVyc2lvbg0KPiANCj4gSSBnZXQgdGhlIGZvbGxvd2lu
ZyBlcnJvciB3aXRoIG1pbmltYWwtdWNsaWJjLiBUaGUgb3RoZXIgZGlzdHJpYnV0aW9ucw0KPiBz
dGlsbCBidWlsZC4gVGhlIGVycm9yIGxvb2tzIGdlbmVyaWMgdGhvdWdoLg0KPiANCj4gICAgICAg
ICBFUlJPUjogJ29lL29wZW5lbWJlZGRlZC9yZWNpcGVzL3RpL2FtLWJlbmNobWFya3Nfc3ZuLmJi
JyBmYWlsZWQNCj4gICAgICAgICBFUlJPUjogRnVuY3Rpb24gZG9fY29tcGlsZSBmYWlsZWQNCj4g
ICAgICAgICBb4oCmXQ0KPiAgICAgICAgIExvZyBkYXRhIGZvbGxvd3M6DQo+ICAgICAgICAgfCBt
YWtlOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCBgcmVsZWFzZScuICBTdG9wLg0KPiAgICAg
ICAgIHwgRVJST1I6IEZ1bmN0aW9uIGRvX2NvbXBpbGUgZmFpbGVkDQo+ICAgICAgICAgTk9URTog
cGFja2FnZSBhbS1iZW5jaG1hcmtzLTEuMS1yMStzdm5yNTY6IHRhc2sgZG9fY29tcGlsZTogRmFp
bGVkDQo+IA0KDQpXaGF0IGRldmljZSB3YXMgdGhpcyBidWlsdCBmb3I/ICBEb2VzIHRoaXMgaXNz
dWUgb2NjdXIgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHJlY2lwZT8NCg0KSSBvbmx5
IGV2ZXIgdXNlIEFuZ3N0cm9tLiAgQ2FuIHlvdSBwcm92aWRlIHNvbWUgZGV0YWlscyBvbiBob3cg
SSBjYW4gcmVwZWF0IHlvdXIgYnVpbGQ/DQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IFBhdWwNCj4g
DQo+IA0KPiBbMV0gaHR0cDovL3dpa2kub3BlbmVtYmVkZGVkLm5ldC9pbmRleC5waHAvUGF0Y2h3
b3JrDQo=


