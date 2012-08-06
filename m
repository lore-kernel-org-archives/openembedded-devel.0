Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1SyN1D-0006Za-V9
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 15:06:48 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q76CqHgO017772
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2012 07:52:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q76CqHet017187
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2012 07:52:17 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 6 Aug 2012 07:52:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] ltrace: Fix make error
Thread-Index: AQHNc7ifCLwCk4KhKEOeNB72vI98HJdMuVSQ
Date: Mon, 6 Aug 2012 12:52:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C282DA7@DFLE30.ent.ti.com>
References: <1343934541-12253-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C2801F0@DFLE30.ent.ti.com>
	<jvnsto$81o$1@dough.gmane.org>
In-Reply-To: <jvnsto$81o$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-oe][PATCH] ltrace: Fix make error
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
X-List-Received-Date: Mon, 06 Aug 2012 13:06:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

S29lbiwNCg0KTW9zdCBvZiBteSBwYXRjaGVzIHdlcmUgZm9yIG9uZSBicmFuY2ggb3IgYW5vdGhl
ciBidXQgZGlkbid0IGFwcGx5IGNsZWFubHkgZm9yIGJvdGguIEkgd2Fzbid0IHF1aXRlIHN1cmUg
d2hhdCBhcHByb2FjaCB0byB0YWtlIGFuZCAgSWYgeW91ciBzdWdnZXN0aW5nIHRoYXQgSSBzaG91
bGQgYWx3YXlzIHNlbmQgc2VwYXJhdGUgcG9zdCBmb3IgZWFjaCBicmFuY2ggdGhlbiBJIGNhbiBk
byB0aGF0LiBUaGFua3MgZm9yIGNsZWFyaW5nIGl0IHVwLg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS29lbiBLb29pIFttYWlsdG86a29lbkBkb21pbmlvbi50aHJ1aGVyZS5u
ZXRdIA0KU2VudDogTW9uZGF5LCBBdWd1c3QgMDYsIDIwMTIgMjo1MCBBTQ0KVG86IG9wZW5lbWJl
ZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0
YS1vZV1bUEFUQ0hdIGx0cmFjZTogRml4IG1ha2UgZXJyb3INCg0KLS0tLS1CRUdJTiBQR1AgU0lH
TkVEIE1FU1NBR0UtLS0tLQ0KSGFzaDogU0hBMQ0KDQpPcCAwMi0wOC0xMiAyMTowNiwgQ29vcGVy
IEpyLiwgRnJhbmtsaW4gc2NocmVlZjoNCj4gUGxlYXNlIHB1bGwgdGhpcyBwYXRjaCBpbnRvIHRo
ZSBkZW56aWwgYnJhbmNoIGFsc28uDQoNClRoYXQncyBub3QgaG93IGl0IHdvcmtzIGFuZCB5b3Ug
a25vdyB0aGF0Lg0KDQotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQ0KVmVyc2lvbjogR251
UEcgdjEuNC41IChEYXJ3aW4pDQpDb21tZW50OiBHUEdUb29scyAtIGh0dHA6Ly9ncGd0b29scy5v
cmcNCg0KaUQ4REJRRlFIM2NhTWt5R002NFJHcEVSQWwwQUFLQ2QrZTJXZlFIdmN5dHBIejBsa0Qw
Q25YdkFzUUNmUTQ1eg0KMjhNRXh6TmYySy9kWGhsYnZPOTlZbWc9DQo9Q2dkbw0KLS0tLS1FTkQg
UEdQIFNJR05BVFVSRS0tLS0tDQoNCg0KDQo=


