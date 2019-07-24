Return-Path: <aaron.chun.yew.chan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4598C7F0A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 07:09:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 00:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; d="scan'208";a="368696082"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2019 00:09:36 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.4]) by
	KMSMSX155.gar.corp.intel.com ([169.254.15.33]) with mapi id
	14.03.0439.000; Wed, 24 Jul 2019 15:09:31 +0800
From: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
Thread-Index: AQHVPsEK4NxBpe6OrkKmwhkD8w3bU6bTBMDwgABEngCABhXx4A==
Date: Wed, 24 Jul 2019 07:09:31 +0000
Message-ID: <AA9B40170ABA1047B45E714CB2B866B706BC13D5@PGSMSX103.gar.corp.intel.com>
References: <1563602668-35526-1-git-send-email-andromeda@intel.com>
	<AA9B40170ABA1047B45E714CB2B866B706BC069D@PGSMSX103.gar.corp.intel.com>
	<CAMKF1soCg3ytMiOoy63ePT+nR1kpnj8ntuNTjg0cngBKJX3NmA@mail.gmail.com>
In-Reply-To: <CAMKF1soCg3ytMiOoy63ePT+nR1kpnj8ntuNTjg0cngBKJX3NmA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmY2ZDQ5YTQtOTVlMS00NzA1LWExNjktMjI2YTA0NDlkYTVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiejRhK2s5dHRla2tVeWJISkM1dVg5aGt5V1poV0Y0YWtxa1pDdTFTY0FRYXpGeTlWWlJlSUdwREs3MXc3RmQ5YyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python3-pyatspi: Add Dbus ATSPI recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 07:09:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KVGhlIHBhcnNpbmcgZXJyb3Igd2FzIGR1ZSB0byBtaXNzaW5nIG5hdGl2ZSBz
dXBwb3J0IGZvciBweXRob24zLWRidXMtbmF0aXZlIGluIGFub3RoZXIgcGF0Y2ggSSBzdWJtaXR0
ZWQgdG9kYXkuDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVt
YmVkZGVkLWNvcmUvMjAxOS1KdWx5LzI4NDk2My5odG1sDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0gDQpTZW50
OiBTdW5kYXksIEp1bHkgMjEsIDIwMTkgMjoxMSBBTQ0KVG86IENoYW4sIEFhcm9uIENodW4gWWV3
IDxhYXJvbi5jaHVuLnlldy5jaGFuQGludGVsLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXB5dGhvbl1bUEFUQ0gg
djJdIHB5dGhvbjMtcHlhdHNwaTogQWRkIERidXMgQVRTUEkgcmVjaXBlDQoNClBhcnNpbmcgZXJy
b3JzIHNlZW4NCg0KMTg6MDc6NDAgRVJST1I6IE5vdGhpbmcgUFJPVklERVMgJ3B5dGhvbjMtZGJ1
cy1uYXRpdmUnIChidXQgL21udC9qZW5raW5zL3dvcmtzcGFjZS95b2N0by13b3JsZC9zb3VyY2Vz
L21ldGEtb3BlbmVtYmVkZGVkL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHlhdHNwaV8yLjMyLjEuYmINCkRFUEVORFMgb24gb3Igb3RoZXJ3aXNlIHJlcXVpcmVz
IGl0KS4gQ2xvc2UgbWF0Y2hlczoNCjE4OjA3OjQwICAgcHl0aG9uMy1hYnNsLW5hdGl2ZQ0KMTg6
MDc6NDAgICBweXRob24zLWdpdGRiLW5hdGl2ZQ0KMTg6MDc6NDAgICBweXRob24zLXNpeC1uYXRp
dmUNCi4uLi4uDQoNCjE4OjA3OjQxIEVSUk9SOiBOb3RoaW5nIFJQUk9WSURFUyAncHl0aG9uMy1w
eWF0c3BpJyAoYnV0IC9tbnQvamVua2lucy93b3Jrc3BhY2UveW9jdG8td29ybGQvc291cmNlcy9t
ZXRhLW9wZW5lbWJlZGRlZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5YXRzcGlfMi4zMi4xLmJiDQpSREVQRU5EUyBvbiBvciBvdGhlcndpc2UgcmVxdWlyZXMg
aXQpDQoxODowNzo0MSBObyBlbGlnaWJsZSBSUFJPVklERVJzIGV4aXN0IGZvciAncHl0aG9uMy1w
eWF0c3BpJw0KMTg6MDc6NDEgRVJST1I6IE5vdGhpbmcgUlBST1ZJREVTICdweXRob24zLXB5YXRz
cGktZGV2JyAoYnV0IC9tbnQvamVua2lucy93b3Jrc3BhY2UveW9jdG8td29ybGQvc291cmNlcy9t
ZXRhLW9wZW5lbWJlZGRlZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5YXRzcGlfMi4zMi4xLmJiDQpSREVQRU5EUyBvbiBvciBvdGhlcndpc2UgcmVxdWlyZXMg
aXQpDQoxODowNzo0MSBObyBlbGlnaWJsZSBSUFJPVklERVJzIGV4aXN0IGZvciAncHl0aG9uMy1w
eWF0c3BpLWRldicNCg0KDQpPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAxMToxNyBQTSBDaGFuLCBB
YXJvbiBDaHVuIFlldyA8YWFyb24uY2h1bi55ZXcuY2hhbkBpbnRlbC5jb20+IHdyb3RlOg0KPg0K
PiBGcm9tOiBBYXJvbiBDaGFuIDxhYXJvbi5jaHVuLnlldy5jaGFuQGludGVsLmNvbT4NCj4NCj4g
cHlhdHNwaSBwcm92aWRlIHB5dGhvbjMgc3VwcG9ydCBmb3IgQXNzaXN0aXZlIFRlY2hub2xvZ3kg
U2VydmljZSBQcm92aWRlIEludGVyZmFjZSAoQVQtU1BJMikgcHJvdG9jb2wgb3ZlciBEYnVzLg0K
Pg0KPiBUaGlzIGlzIHVzZWZ1bCBub3Qgb25seSBmb3IgQWNjZXNzaWJpbGl0eSAoYTExeSkgYnV0
IGFsc28gcHJvdmlkZXMgYSBtZWRpdW0gZm9yIGF1dG9tYXRpb24gb2YgR1VJIHRlc3RpbmcgKHN1
Y2ggYXMgcHl0aG9uMy1kb2d0YWlsKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWFyb24gQ2hhbiA8
YWFyb24uY2h1bi55ZXcuY2hhbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgLi4uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhdHNwaV8yLjMyLjEuYmIgICAgfCAxNiArKysrKysrKysr
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IA0KPiBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5YXRzcGlfMi4zMi4xLmJiDQo+DQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWF0c3BpXzIuMzIuMS5iYiANCj4gYi9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXRzcGlfMi4zMi4xLmJi
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjZkODBjMTANCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5YXRzcGlfMi4zMi4xLmJiDQo+IEBAIC0wLDAgKzEsMTYgQEANCj4gK1NVTU1BUlkg
PSAiUHl0aG9uIGJpbmRpbmdzIGZvciBEQnVzIEFULVNQSTIgYWNjZXNzaWJpbGl0eSINCj4gK0RF
U0NSSVBUSU9OID0gIkFULVNQSTIgaXMgYSBwcm90b2NvbCBvdmVyIERCdXMsIHRvb2xraXQgd2lk
Z2V0cyB1c2UgdG8gcHJvdmlkZSBjb250ZW50IHRvIHNjcmVlbiByZWFkZXJzIHN1Y2ggYXMgT3Jj
YSINCj4gK1NFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIg0KPiArSE9NRVBBR0UgPSAiaHR0cHM6Ly93
d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kvQWNjZXNzaWJpbGl0eS9BVC1TUEkyLyINCj4gK0xJQ0VO
U0UgPSAiR1BMdjIiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1l
OWYyODhiYTk4MmQ2MDUxOGYzNzViNTg5ODI4Mzg4NiBcDQo+ICsgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9DT1BZSU5HLkdQTDttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUi
DQo+ICtERVBFTkRTID0gInB5dGhvbjMtZGJ1cy1uYXRpdmUgZ2xpYi0yLjAgZGJ1cy1nbGliIGxp
YnhtbDIgYXRrIGd0aysgcHl0aG9uMy1weWdvYmplY3QiDQo+ICsNCj4gK1NSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9HTk9NRS9weWF0c3BpMi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPWdu
b21lLTMtMzIiDQo+ICtTUkNSRVYgPSAiZGM0NTY1MjA4ZmNhMDBkYTA2Yjk3MjkxNWEwODBhZDNj
NjNmNjQwZCINCj4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQo+ICsNCj4gK2luaGVyaXQgcGtnY29u
ZmlnIGF1dG90b29scyBweXRob24zbmF0aXZlDQo+ICsNCj4gK0ZJTEVTXyR7UE59ICs9ICIke1BZ
VEhPTl9TSVRFUEFDS0FHRVNfRElSfS9weWF0c3BpLyoiDQo+IC0tDQo+IDIuNy40DQo+DQo=

