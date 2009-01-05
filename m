Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LJqpE-0003z4-S9
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 15:53:06 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id DEB2A16DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2009 15:58:07 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 790BF2A4145
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2009 15:47:09 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 5 Jan 2009 15:46:49 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF596@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Problem with bitbake after update
Thread-Index: AclvRHy5ySDDzoRLS0yUBfIPXLmXSQ==
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Problem with bitbake after update
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
X-List-Received-Date: Mon, 05 Jan 2009 14:53:08 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

QWZ0ZXIgbWFraW5nIGFuIHN2biB1cGRhdGUgZnJvbSBiaXRiYWtlIDEuOC4xMSAoU1ZOIHIxMDgw
KSB0byAxLjguMTMgKFNWTiByMTE1MCkgaSd2ZSBhIGxpdHRsZSBwcm9ibGVtIHdpdGggbXkgZW52
aXJvbm1lbnQuIEkgdXNlIHNvbWUgdmFycyB0byBjb25maWd1cmUgdGhlIGl0Og0KDQogZXhwb3J0
IE9FX0hPTUU9JEhPTUUvb2UNCiBleHBvcnQgT0VfUk9PVD0vb3B0L29wZW5lbWJlZGRlZA0KIGV4
cG9ydCBNWV9PRV9DT05GPSJveGU4MTAiDQogZXhwb3J0IEJCUEFUSD0kT0VfSE9NRS86JE9FX0hP
TUUvJE1ZX09FX0NPTkY6JE9FX0hPTUUvY29tbW9uOiRPRV9ST09UDQogZXhwb3J0IFBBVEg9L29w
dC9iaXRiYWtlL2JpbjokUEFUSA0KDQpJbiB0aGUgbG9jYWwuY29uZiBpIHVzZSBzb21lIG9mIHRo
ZW0gdG8gc2V0dXAgc29tZSBiYmZpbGUgY29sbGVjdGlvbnMuDQoNCiBCQkZJTEVfQ09MTEVDVElP
TlMgPSAidXBzdHJlYW0gbG9jYWxjb21tb24gbG9jYWwiDQogQkJGSUxFX1BBVFRFUk5fdXBzdHJl
YW0gPSAiXiR7T0VfUk9PVH0vcGFja2FnZXMvIg0KIEJCRklMRV9QQVRURVJOX2xvY2FsY29tbW9u
ID0gIl4ke09FX0hPTUV9L2NvbW1vbi9wYWNrYWdlcy8iDQogQkJGSUxFX1BBVFRFUk5fbG9jYWwg
PSAiXiR7T0VfSE9NRX0vb3hlODEwL3BhY2thZ2VzLyINCiBCQkZJTEVfUFJJT1JJVFlfdXBzdHJl
YW0gPSAiNSINCiBCQkZJTEVfUFJJT1JJVFlfbG9jYWxjb21tb24gPSAiOSINCiBCQkZJTEVfUFJJ
T1JJVFlfbG9jYWwgPSAiMTAiDQoNClRoaXMgd29ya2VkIGZpbmUgd2l0aCBiaXRiYWtlIDEuOC4x
MSBidXQgcmVzdWx0cyBpbiBhbiBlcnJvciB3aXRoIHRoZSBuZXdlciB2ZXJzaW9uLiA6KA0KDQog
Tk9URTogUHN5Y28gSklUIENvbXBpbGVyIChodHRwOi8vcHN5Y28uc2YubmV0KSBub3QgYXZhaWxh
YmxlLiBJbnN0YWxsIGl0IHRvIGluY3JlYXNlIHBlcmZvcm1hbmNlLg0KIEVSUk9SOiBvcGVuaW5n
ICR7T0VfUk9PVH0vcGFja2FnZXMvKi8qLmJiOiBmaWxlICR7T0VfUk9PVH0vcGFja2FnZXMvKi8q
LmJiIG5vdCBmb3VuZA0KIEVSUk9SOiBvcGVuaW5nICR7T0VfSE9NRX0vb3hlODEwL3BhY2thZ2Vz
LyovKi5iYjogZmlsZSAke09FX0hPTUV9L294ZTgxMC9wYWNrYWdlcy8qLyouYmIgbm90IGZvdW5k
DQogRVJST1I6IG9wZW5pbmcgJHtPRV9IT01FfS9jb21tb24vcGFja2FnZXMvKi8qLmJiOiBmaWxl
ICR7T0VfSE9NRX0vY29tbW9uL3BhY2thZ2VzLyovKi5iYiBub3QgZm91bmQNCg0KSG1tbW0/IFdo
YXQncyB3cm9uZyBoZXJlPw0KDQpTdGVmZmVuDQo=


