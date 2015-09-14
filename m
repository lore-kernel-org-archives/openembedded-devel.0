Return-Path: <henry.bruce@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D44CE6E26B
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 22:36:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2015 15:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,531,1437462000"; 
	d="scan'208,217";a="805140835"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2015 15:35:32 -0700
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.156]) by
	ORSMSX109.amr.corp.intel.com ([169.254.2.154]) with mapi id
	14.03.0224.002; Mon, 14 Sep 2015 15:35:30 -0700
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: icetead7-native build failure with Yocto 1.8 on fedora-22 
Thread-Index: AdDvPaY+cuhs3ocjSWmA8KAol18/Aw==
Date: Mon, 14 Sep 2015 22:35:30 +0000
Message-ID: <F81DC1078564A34BB4DA30CAE03814D12D4A26C1@ORSMSX104.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: icetead7-native build failure with Yocto 1.8 on fedora-22
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Sep 2015 22:36:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLA0KDQoNCg0KSSBoYXZlIGJlZW4gc3VjY2Vzc2Z1bGx5IGJ1aWxkaW5nIG9wZW5qZGstNyB3
aXRoIFlvY3RvIDEuOCBvbiBhIEZlZG9yYSAyMCBtYWNoaW5lLg0KDQpJIHJlY2VudGx5IHVwZ3Jh
ZGVkIHRvIEZlZG9yYSAyMiBhbmQgYnVpbGQgZmFpbGVkIGR1ZSB0byBrZXJuZWwgdmVyc2lvbiBj
aGVjayB3aGljaCBJIHN1Y2Nlc3NmdWxseSBwYXRjaGVkDQoNCmFzIHBlciBodHRwczovL2J1Z3Mu
b3Blbmpkay5qYXZhLm5ldC9icm93c2UvSkRLLTgwNzQzMTIuDQoNClRoZSBJIGhpdCBhIGJ1aWxk
IGVycm9yIHRoYXQgSSBjYW7igJl0IHJlc29sdmUgYXMgYnVpbGQgZmFpbHVyZSByZWZlcnMgdG8g
Y29tcGlsZXIgb3V0cHV0IHRoYXQgZG9lc27igJl0IGV4aXN0IChzZWUgYmVsb3cpLg0KDQpJIGdl
dCB0aGUgc2FtZSByZXN1bHQgaWYgb3BlbmluZyBhIGRldnNoZWxsIGFuZCBydW5uaW5nIOKAmG1h
a2UgaWNlZHRlYeKAmQ0KDQpBbnkgaWRlYXM/DQoNCg0KDQpUaGFua3MsDQoNCg0KDQpIZW5yeSBC
cnVjZQ0KDQoNCg0KDQoNCnwgLWJhbm5lcjoNCg0KfCAgICAgIFtlY2hvXSArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KDQp8ICAgICAgW2VjaG9dICsgU3RhcnRpbmcg
YW50IHByb2plY3QgamF4cCArDQoNCnwgICAgICBbZWNob10gKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsNCg0KfA0KDQp8IC1qYXZhYy1qYXItZXhpc3RzOg0KDQp8DQoN
Cnwgc2FuaXR5Og0KDQp8ICAgICAgW2VjaG9dIFNhbml0eSBTZXR0aW5nczoNCg0KfCAgICAgIFtl
Y2hvXSBudC5ob21lPS9wYXRoL3RvL2J1aWxkL3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNy
L3NoYXJlDQoNCnwgICAgICBbZWNob10gYW50LnZlcnNpb249QXBhY2hlIEFudCB2ZXJzaW9uIDEu
OC4xIGNvbXBpbGVkIG9uIEZyaSwgMTQgQXVnIDIwMTUgMTE6Mjg6MTIgLTA3MDANCg0KfCAgICAg
IFtlY2hvXSBhbnQuamF2YS52ZXJzaW9uPTEuNg0KDQp8ICAgICAgW2VjaG9dIGphdmEuaG9tZT0v
cGF0aC90by9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvaWNlZHRlYTctbmF0aXZlLzIuMS4z
LXIxLjAvaWNlZHRlYS0yLjEuMy9idWlsZC9vcGVuamRrLmJ1aWxkLWJvb3QvajJzZGstaW1hZ2Uv
anJlDQoNCnwgICAgICBbZWNob10gamF2YS52ZXJzaW9uPTEuNy4wXzANCg0KfCAgICAgIFtlY2hv
XSBvcy5uYW1lPUxpbnV4DQoNCnwgICAgICBbZWNob10gb3MuYXJjaD1hbWQ2NA0KDQp8ICAgICAg
W2VjaG9dIG9zLnZlcnNpb249NC4xLjYtMjAwLmZjMjIueDg2XzY0DQoNCnwgICAgICBbZWNob10g
Ym9vdHN0cmFwLmRpcj0vcGF0aC90by9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvaWNlZHRl
YTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEuMy9idWlsZC9vcGVuamRrLmJ1aWxkL2xh
bmd0b29scy9kaXN0L2Jvb3RzdHJhcA0KDQp8ICAgICAgW2VjaG9dIGphdmFjLmphcj0vcGF0aC90
by9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvaWNlZHRlYTctbmF0aXZlLzIuMS4zLXIxLjAv
aWNlZHRlYS0yLjEuMy9idWlsZC9vcGVuamRrLmJ1aWxkL2xhbmd0b29scy9kaXN0L2Jvb3RzdHJh
cC9saWIvamF2YWMuamFyDQoNCnwgICAgICBbZWNob10gamF2YWMubWVtb3J5SW5pdGlhbFNpemU9
MjU2bQ0KDQp8ICAgICAgW2VjaG9dIGphdmFjLm1lbW9yeU1heGltdW1TaXplPTUxMm0NCg0KfCAg
ICAgIFtlY2hvXSBqYXZhYy5zb3VyY2U9Nw0KDQp8ICAgICAgW2VjaG9dIGphdmFjLmRlYnVnPXRy
dWUNCg0KfCAgICAgIFtlY2hvXSBqYXZhYy50YXJnZXQ9Nw0KDQp8ICAgICAgW2VjaG9dIGphdmFj
LnZlcnNpb24ub3B0PQ0KDQp8ICAgICAgW2VjaG9dIGphdmFjLmxpbnQub3B0cz0NCg0KfCAgICAg
IFtlY2hvXSBqYXZhYy5uby5qZGsud2FybmluZ3M9LVhEaWdub3JlLnN5bWJvbC5maWxlPXRydWUN
Cg0KfCAgICAgIFtlY2hvXSBvdXRwdXQuZGlyPS9wYXRoL3RvL2J1aWxkL3RtcC93b3JrL3g4Nl82
NC1saW51eC9pY2VkdGVhNy1uYXRpdmUvMi4xLjMtcjEuMC9pY2VkdGVhLTIuMS4zL2J1aWxkL29w
ZW5qZGsuYnVpbGQvamF4cA0KDQp8ICAgICAgW2VjaG9dIGJ1aWxkLmRpcj0vcGF0aC90by9idWls
ZC90bXAvd29yay94ODZfNjQtbGludXgvaWNlZHRlYTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRl
YS0yLjEuMy9idWlsZC9vcGVuamRrLmJ1aWxkL2pheHAvYnVpbGQNCg0KfCAgICAgIFtlY2hvXSBk
aXN0LmRpcj0vcGF0aC90by9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvaWNlZHRlYTctbmF0
aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEuMy9idWlsZC9vcGVuamRrLmJ1aWxkL2pheHAvZGlz
dA0KDQp8ICAgICAgW2VjaG9dIGRyb3AuZGlyPSR7ZHJvcC5kaXJ9DQoNCnwgICAgICBbZWNob10g
ZHJvcHMuZGlyPS9qYXZhL2RldnRvb2xzL3NoYXJlL2pkazctZHJvcHMNCg0KfCAgICAgIFtlY2hv
XQ0KDQp8DQoNCiA8c25pcD4NCg0KfA0KDQp8IC1pbml0LXNyYy1kaXJzOg0KDQp8ICAgICAgW2Vj
aG9dIFVzaW5nIHByaW1hcnkuc3JjLmRpcj0uL3NvdXJjZXMvamF4cF9zcmMvc3JjDQoNCnwgICAg
ICBbZWNob10gVXNpbmcgc3JjLmRpci5pZD0vcGF0aC90by9idWlsZC90bXAvd29yay94ODZfNjQt
bGludXgvaWNlZHRlYTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEuMy9idWlsZC9vcGVu
amRrL2pheHAvc291cmNlcy9qYXhwX3NyYy9zcmMNCg0KfA0KDQp8IGNvbXBpbGU6DQoNCnwgICAg
IFtqYXZhY10gQ29tcGlsaW5nIDk3OCBzb3VyY2UgZmlsZXMgdG8gL3BhdGgvdG8vYnVpbGQvdG1w
L3dvcmsveDg2XzY0LWxpbnV4L2ljZWR0ZWE3LW5hdGl2ZS8yLjEuMy1yMS4wL2ljZWR0ZWEtMi4x
LjMvYnVpbGQvb3Blbmpkay5idWlsZC9qYXhwL2J1aWxkL2NsYXNzZXMNCg0KfA0KDQp8IEJVSUxE
IEZBSUxFRA0KDQp8IC9wYXRoL3RvL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9pY2VkdGVh
Ny1uYXRpdmUvMi4xLjMtcjEuMC9pY2VkdGVhLTIuMS4zL2J1aWxkL29wZW5qZGsvamF4cC9idWls
ZC54bWw6MTM0OiBDb21waWxlIGZhaWxlZDsgc2VlIHRoZSBjb21waWxlciBlcnJvciBvdXRwdXQg
Zm9yIGRldGFpbHMuDQoNCnwNCg0KfCBUb3RhbCB0aW1lOiAyIG1pbnV0ZXMgMTQgc2Vjb25kcw0K

