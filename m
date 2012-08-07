Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1Sylpz-0006Q8-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 17:36:52 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q77FKfow012045;
	Tue, 7 Aug 2012 10:20:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q77FKfvq008805;
	Tue, 7 Aug 2012 10:20:41 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Tue, 7 Aug 2012 10:20:41 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [for-denzil][meta-oe][PATCH] ltrace: Fix make error
Thread-Index: AQHNdLA0HEGxC8h54UiIC4ratDUNzA==
Date: Tue, 7 Aug 2012 15:20:40 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C284468@DFLE30.ent.ti.com>
References: <1344264657-9666-1-git-send-email-fcooper@ti.com>
	<jvqq24$n10$1@dough.gmane.org>
In-Reply-To: <jvqq24$n10$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [for-denzil][meta-oe][PATCH] ltrace: Fix make error
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
X-List-Received-Date: Tue, 07 Aug 2012 15:36:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBqdW1wZWQgdGhlIGd1biBhIGJpdCBidXQgSSB3aWxsIGJlIG1vcmUgY2FyZWZ1bCBpbiB0aGUg
ZnV0dXJlLiBMdHJhY2UgaGFzIG5vdyBiZWVuIHB1bGxlZCBpbnRvIG1hc3Rlci4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtvZW4gS29vaSBbbWFpbHRvOmtvZW5AZG9taW5p
b24udGhydWhlcmUubmV0XSANClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAwNywgMjAxMiA1OjE5IEFN
DQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6
IFJlOiBbb2VdIFtmb3ItZGVuemlsXVttZXRhLW9lXVtQQVRDSF0gbHRyYWNlOiBGaXggbWFrZSBl
cnJvcg0KDQotLS0tLUJFR0lOIFBHUCBTSUdORUQgTUVTU0FHRS0tLS0tDQpIYXNoOiBTSEExDQoN
Ck9wIDA2LTA4LTEyIDE2OjUwLCBGcmFua2xpbiBTIENvb3BlciBKciBzY2hyZWVmOg0KPiAqIEZp
eGVzIHRoZSBtYWtlOiBpbnZhbGlkIG9wdGlvbiAtLSAnLycgZXJyb3INCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5rbGluIFMgQ29vcGVyIEpyIDxmY29vcGVyQHRpLmNvbT4NCg0KSG93IGNhbiB0
aGlzIGJlIHByb3Bvc2VkIGZvciBkZW56aWwgd2hlbiBpdCBoYXNuJ3QgZXZlbiBoaXQgbWFzdGVy
IHlldD8hPyE/IQ0KDQotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQ0KVmVyc2lvbjogR251
UEcgdjEuNC41IChEYXJ3aW4pDQpDb21tZW50OiBHUEdUb29scyAtIGh0dHA6Ly9ncGd0b29scy5v
cmcNCg0KaUQ4REJRRlFJT3VXTWt5R002NFJHcEVSQXJST0FLQ0N1NEcxYjh6S0RUcFVianV5NTZh
aloxNzlUUUNkRXp5RQ0KL1EzMjljeW5EOHp2SzBjTDB1eVN5blU9DQo9WWFqZw0KLS0tLS1FTkQg
UEdQIFNJR05BVFVSRS0tLS0tDQoNCg0KDQo=


