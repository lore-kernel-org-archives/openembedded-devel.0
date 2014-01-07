Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.150])
	by mail.openembedded.org (Postfix) with ESMTP id EA4AD6C73F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 13:23:59 +0000 (UTC)
Received: from [85.158.139.19:29480] by server-14.bemta-5.messagelabs.com id
	DA/C5-24200-FEFFBC25; Tue, 07 Jan 2014 13:23:59 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-6.tower-178.messagelabs.com!1389101038!32370105!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8602 invoked from network); 7 Jan 2014 13:23:59 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-6.tower-178.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Jan 2014 13:23:59 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Tue, 7 Jan 2014
	13:23:58 +0000
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2014 13:23:58 +0000
Thread-Topic: [oe] Patch to fix libxml++ build failure in meta-oe
Thread-Index: Ac8LpTziiTKmXMa5RaeXmt3kn1/e7wABNILA
Message-ID: <AAE0766F5AF36B46BAB7E0EFB9273206331489E797@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB9273206331489E795@GBTWK10E001.Technology.local>
	<7aae89dde8c24d33afead65e63bf0225@CH1PRD0410HT005.namprd04.prod.outlook.com>
In-Reply-To: <7aae89dde8c24d33afead65e63bf0225@CH1PRD0410HT005.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Patch to fix libxml++ build failure in meta-oe
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
X-List-Received-Date: Tue, 07 Jan 2014 13:24:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBTT0IgbGluZSBpcyBtaXNzaW5nLCBidXQgSSd2ZSBhbHJlYWR5IGFkZGVkIGl0IG1hbnVhbGx5
IGZyb20geW91IGZpcnN0IHZlcnNpb24gb2YgdGhpcyBwYXRjaC4NCj4gaHR0cDovL3BhdGNod29y
ay5vcGVuZW1iZWRkZWQub3JnL3BhdGNoLzY0MjA3Lw0KPiBzZWVtcyB0byB3b3JrLCB2ZXJzaW9u
IHdpdGggYXR0YWNoZW1lbnQgd2Fzbid0IHBpY2tlZCBieSBwYXRjaHdvcmsNCg0KT2sgdGhhbmsg
eW91IGZvciBjb3B5aW5nIG92ZXIgdGhlIFNPQiBsaW5lIG1hbnVhbGx5DQoNCi4uLg0KPj4gKysg
ICAgICBjcCBNYWtlZmlsZSAkKERFU1RESVIpL2V4YW1wbGVzDQo+PiArKyAgICAgICQoTUtESVJf
UCkgJChERVNURElSKS9tYWNyb3MNCj4+ICsrICAgICAgY3AgLi4vbWFjcm9zL3Rlc3QtZHJpdmVy
ICQoREVTVERJUikvbWFjcm9zDQo+PiArKyAgICAgIHNlZCAtaSAtZSAnc3xeTWFrZWZpbGU6fF9N
YWtlZmlsZTp8JyArKyQoREVTVERJUikvZXhhbXBsZXMvTWFrZWZpbGUNCj4NCj4gVGhlc2UgbGFz
dCA0IGxpbmVzIGFyZSBtaXNzaW5nIGluIHRoZSBwYXRjaCB5b3UgaGF2ZSBzZW50IGFzIGF0dGFj
aGVtZW50LCB3aGljaCB2ZXJzaW9uIGlzIHRoZSByaWdodCBvbmU/DQoNClRoZSBsaW5lcyAiY3Ag
Li4uIGV4YW1wbGVzIiB0byAic2VkIC4uLiBNYWtlZmlsZSIgc2hvdWxkIGJlIHByZXNlbnQNCg0K
LS0NCk5pY2sNCg0KDQpUaGUgZGV0YWlscyBvZiB0aGlzIGNvbXBhbnkgYXJlIGFzIGZvbGxvd3M6
DQpHNFMgVGVjaG5vbG9neSBMaW1pdGVkLCBSZWdpc3RlcmVkIE9mZmljZTogQ2hhbGxlbmdlIEhv
dXNlLCBJbnRlcm5hdGlvbmFsIERyaXZlLCBUZXdrZXNidXJ5LCBHbG91Y2VzdGVyc2hpcmUgR0wy
MCA4VVEsIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCBOby4gMjM4MjMzOC4NCg0KVGhpcyBjb21tdW5p
Y2F0aW9uIG1heSBjb250YWluIGluZm9ybWF0aW9uIHdoaWNoIGlzIGNvbmZpZGVudGlhbCwgcGVy
c29uYWwgYW5kL29yIHByaXZpbGVnZWQuDQoNCkl0IGlzIGZvciB0aGUgZXhjbHVzaXZlIHVzZSBv
ZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLg0KSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKSwgcGxlYXNlIG5vdGUgdGhhdCBhbnkgZGlzdHJpYnV0aW9uLCBmb3J3YXJk
aW5nLCBjb3B5aW5nIG9yIHVzZSBvZiB0aGlzIGNvbW11bmljYXRpb24gb3IgdGhlIGluZm9ybWF0
aW9uIGluIGl0IGlzIHN0cmljdGx5IHByb2hpYml0ZWQuDQoNCkFueSBwZXJzb25hbCB2aWV3cyBl
eHByZXNzZWQgaW4gdGhpcyBlLW1haWwgYXJlIHRob3NlIG9mIHRoZSBpbmRpdmlkdWFsIHNlbmRl
ciBhbmQgdGhlIGNvbXBhbnkgZG9lcyBub3QgZW5kb3JzZSBvciBhY2NlcHQgcmVzcG9uc2liaWxp
dHkgZm9yIHRoZW0uDQoNClByaW9yIHRvIHRha2luZyBhbnkgYWN0aW9uIGJhc2VkIHVwb24gdGhp
cyBlLW1haWwgbWVzc2FnZSwgeW91IHNob3VsZCBzZWVrIGFwcHJvcHJpYXRlIGNvbmZpcm1hdGlv
biBvZiBpdHMgYXV0aGVudGljaXR5Lg0KDQpUaGlzIGUtbWFpbCBoYXMgYmVlbiBzY2FubmVkIGZv
ciBhbGwgdmlydXNlcyBieSBNZXNzYWdlTGFicy4NCg==

