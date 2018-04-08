Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6990174FDF
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 08:20:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w388K8a4016557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Apr 2018 01:20:08 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.147]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Sun, 8 Apr 2018 01:20:08 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] postgresql: update to 9.4.17
Thread-Index: AQHTzxFFpjgTbOLoik+Wh3Tgjt7ljaP2hhJQ
Date: Sun, 8 Apr 2018 08:20:07 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA01586C5F61@ALA-MBD.corp.ad.wrs.com>
References: <20180408080030.11697-1-jackie.huang@windriver.com>
	<80ef175c-f32f-5ba4-064e-a556df13bdab@intel.com>
In-Reply-To: <80ef175c-f32f-5ba4-064e-a556df13bdab@intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.144]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] postgresql: update to 9.4.17
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
X-List-Received-Date: Sun, 08 Apr 2018 08:20:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW51aiBNaXR0YWwgW21h
aWx0bzphbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IFNlbnQ6IFN1bmRheSwgQXByaWwgMDgsIDIw
MTggMTY6MTINCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSk7IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRD
SF0gcG9zdGdyZXNxbDogdXBkYXRlIHRvIDkuNC4xNw0KPiANCj4gT24gMDQvMDgvMjAxOCAwNDow
MCBQTSwgamFja2llLmh1YW5nQHdpbmRyaXZlci5jb20gd3JvdGU6DQo+ID4gRnJvbTogSmFja2ll
IEh1YW5nIDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+ICogUmVsZWFzZSBu
b3RlczoNCj4gPiAgIGh0dHBzOi8vd3d3LnBvc3RncmVzcWwub3JnL2RvY3MvOS40L3N0YXRpYy9y
ZWxlYXNlLTktNC0xNy5odG1sDQo+ID4NCj4gPiAqIERyb3AgdGhlIHBhdGNoIGVtb3ZlLmF1dG9j
b25mLnZlcnNpb24uY2hlY2sucGF0Y2ggc2luY2UgdGhlDQo+ID4gICByZXF1aXJlZCBhdXRvY29u
ZiB2ZXJzaW9uIGlzIHVzZWQgaW4gb2UtY29yZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEph
Y2tpZSBIdWFuZyA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+DQo+ID4gLS0tDQo+ID4gIC4u
Li9wb3N0Z3Jlc3FsL2ZpbGVzL3JlbW92ZS5hdXRvY29uZi52ZXJzaW9uLmNoZWNrLnBhdGNoIHwg
MTYgLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAuLi4ve3Bvc3RncmVzcWxfOS40LjE1LmJiID0+IHBv
c3RncmVzcWxfOS40LjE3LmJifSAgICAgICB8ICA3ICsrKy0tLS0NCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiA+ICBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS1vZS9yZWNpcGVzLWRicy9wb3N0Z3Jlc3FsL2ZpbGVzL3JlbW92ZS5hdXRvY29u
Zi52ZXJzaW9uLmNoZWNrLnBhdGNoDQo+ID4gIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtZGJzL3Bv
c3RncmVzcWwve3Bvc3RncmVzcWxfOS40LjE1LmJiID0+IHBvc3RncmVzcWxfOS40LjE3LmJifSAo
MzglKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kYnMvcG9zdGdyZXNx
bC9maWxlcy9yZW1vdmUuYXV0b2NvbmYudmVyc2lvbi5jaGVjay5wYXRjaCBiL21ldGEtb2UvcmVj
aXBlcy0NCj4gZGJzL3Bvc3RncmVzcWwvZmlsZXMvcmVtb3ZlLmF1dG9jb25mLnZlcnNpb24uY2hl
Y2sucGF0Y2gNCj4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCBiZTIzZmQ0
MTkuLjAwMDAwMDAwMA0KPiA+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1kYnMvcG9zdGdyZXNxbC9m
aWxlcy9yZW1vdmUuYXV0b2NvbmYudmVyc2lvbi5jaGVjay5wYXRjaA0KPiA+ICsrKyAvZGV2L251
bGwNCj4gPiBAQCAtMSwxNiArMCwwIEBADQo+ID4gLUluZGV4OiBwb3N0Z3Jlc3FsLTkuMi40L2Nv
bmZpZ3VyZS5pbg0KPiA+IC09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gLS0tLSBwb3N0Z3Jlc3FsLTkuMi40Lm9y
aWcvY29uZmlndXJlLmluDQo+ID4gLSsrKyBwb3N0Z3Jlc3FsLTkuMi40L2NvbmZpZ3VyZS5pbg0K
PiA+IC1AQCAtMTksMTAgKzE5LDYgQEAgbTRfcGF0dGVybl9mb3JiaWQoXlBHQUNfKWRubCB0byBj
YXRjaCB1bg0KPiA+IC0NCj4gPiAtIEFDX0lOSVQoW1Bvc3RncmVTUUxdLCBbOS40LjJdLCBbcGdz
cWwtYnVnc0Bwb3N0Z3Jlc3FsLm9yZ10pDQo+ID4gLQ0KPiA+IC0tbTRfaWYobTRfZGVmbihbbTRf
UEFDS0FHRV9WRVJTSU9OXSksIFsyLjY5XSwgW10sIFttNF9mYXRhbChbQXV0b2NvbmYgdmVyc2lv
biAyLjY5IGlzIHJlcXVpcmVkLg0KPiA+IC0tVW50ZXN0ZWQgY29tYmluYXRpb25zIG9mICdhdXRv
Y29uZicgYW5kIFBvc3RncmVTUUwgdmVyc2lvbnMgYXJlIG5vdA0KPiA+IC0tcmVjb21tZW5kZWQu
ICBZb3UgY2FuIHJlbW92ZSB0aGUgY2hlY2sgZnJvbSAnY29uZmlndXJlLmluJyBidXQgaXQgaXMg
dGhlbg0KPiA+IC0teW91ciByZXNwb25zaWJpbGl0eSB3aGV0aGVyIHRoZSByZXN1bHQgd29ya3Mg
b3Igbm90Ll0pXSkNCj4gPiAtIEFDX0NPUFlSSUdIVChbQ29weXJpZ2h0IChjKSAxOTk2LTIwMTQs
IFBvc3RncmVTUUwgR2xvYmFsIERldmVsb3BtZW50IEdyb3VwXSkNCj4gPiAtIEFDX0NPTkZJR19T
UkNESVIoW3NyYy9iYWNrZW5kL2FjY2Vzcy9jb21tb24vaGVhcHR1cGxlLmNdKQ0KPiA+IC0gQUNf
Q09ORklHX0FVWF9ESVIoY29uZmlnKQ0KPiA+IC0NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWRicy9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWxfOS40LjE1LmJiIGIvbWV0YS1vZS9yZWNp
cGVzLWRicy9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWxfOS40LjE3LmJiDQo+ID4gc2ltaWxhcml0eSBp
bmRleCAzOCUNCj4gPiByZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtZGJzL3Bvc3RncmVzcWwv
cG9zdGdyZXNxbF85LjQuMTUuYmINCj4gPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWRicy9w
b3N0Z3Jlc3FsL3Bvc3RncmVzcWxfOS40LjE3LmJiDQo+ID4gaW5kZXggZWVjMDk5YTEyLi4wNjEx
ODRhNmYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRicy9wb3N0Z3Jlc3FsL3Bv
c3RncmVzcWxfOS40LjE1LmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRicy9wb3N0Z3Jl
c3FsL3Bvc3RncmVzcWxfOS40LjE3LmJiDQo+ID4gQEAgLTEsOSArMSw4IEBADQo+ID4gIHJlcXVp
cmUgcG9zdGdyZXNxbC5pbmMNCj4gPg0KPiA+IC1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZUklHSFQ7bWQ1PTgxYjY5ZGRiMzFhOGJlNjZiYWFmZDE0YTkwMTQ2ZWUyIg0KPiA+ICtMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZUklHSFQ7bWQ1PTZkYzk1ZTYzYWE0ZDcyNTAyZmY4
MTkzZGZlMmRkZDM4Ig0KPiANCj4gWW91IGZvcmdvdCB0byBtZW50aW9uIHdoYXQgaGFzIGNoYW5n
ZWQgaW4gdGhlIGxpY2Vuc2U/DQoNCk9ubHkgdGhlIHllYXIgbnVtYmVyIGlzIGNoYW5nZWQ6DQoN
CiQgZGlmZiA5LjQuMTUtcjAvcG9zdGdyZXNxbC05LjQuMTUvQ09QWVJJR0hUIDkuNC4xNy1yMC9w
b3N0Z3Jlc3FsLTkuNC4xNy9DT1BZUklHSFQNCjRjNA0KPCBQb3J0aW9ucyBDb3B5cmlnaHQgKGMp
IDE5OTYtMjAxNywgUG9zdGdyZVNRTCBHbG9iYWwgRGV2ZWxvcG1lbnQgR3JvdXANCi0tLQ0KPiBQ
b3J0aW9ucyBDb3B5cmlnaHQgKGMpIDE5OTYtMjAxOCwgUG9zdGdyZVNRTCBHbG9iYWwgRGV2ZWxv
cG1lbnQgR3JvdXANCg0KSSB3aWxsIG1lbnRpb24gdGhpcyBpbiB0aGUgY29tbWl0IGxvZyBhbmQg
cmUtc2VuZCwgdGhhbmtzIGZvciByZW1pbmRpbmcuDQoNClRoYW5rcywNCkphY2tpZQ0KDQo+IA0K
PiBUaGFua3MsDQo+IA0KPiBBbnVqDQo=

