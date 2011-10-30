Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitap@ti.com>) id 1RKSM5-0007mp-HT
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 11:11:06 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9U9x2ul016363
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 30 Oct 2011 04:59:02 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9U9x26W025010;
	Sun, 30 Oct 2011 04:59:02 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9U9x13W002491;
	Sun, 30 Oct 2011 04:59:02 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Sun, 30 Oct 2011 10:59:00 +0100
From: "Preskovsky, Vita" <vitap@ti.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Sun, 30 Oct 2011 10:58:55 +0100
Thread-Topic: [oe] [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
Thread-Index: AcyIIpehFBx6YjDzSBO9KQX94Y680wMnnQAQ
Message-ID: <AC090B9732AB2B4DB7FF476E907FE660013BAEBD36@dnce02.ent.ti.com>
References: <1318324122-16951-1-git-send-email-vitap@ti.com>
	<1318343515.14384.8.camel@mattotaupa>
In-Reply-To: <1318343515.14384.8.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
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
X-List-Received-Date: Sun, 30 Oct 2011 10:11:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGF1bCwNClBsZWFzZSBzZWUgbXkgYW5zd2VycyBiZWxsb3cuDQoNClJlZ2FyZHMsVml0YS4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBhdWwgTWVuemVsIFttYWlsdG86cGF1
bGVwYW50ZXJAdXNlcnMuc291cmNlZm9yZ2UubmV0XSANClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIg
MTEsIDIwMTEgNDozMiBQTQ0KVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQpDYzogUHJlc2tvdnNreSwgVml0YQ0KU3ViamVjdDogUmU6IFtvZV0gW1BBVENIXSBi
bHVlejRfNC45NS5iYjogbmV3IHJlY2lwZSBmb3IgYnVpbGRpbmcgYmx1ZXotNC45NQ0KDQpEZWFy
IFZpdGEsDQoNCg0KdGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLg0KDQpBbSBEaWVuc3RhZywgZGVu
IDExLjEwLjIwMTEsIDExOjA4ICswMjAwIHNjaHJpZWIgVml0YSBQcmVza292c2t5Og0KDQpVc2lu
Zw0KDQogICAgICAgIGJsdWV6NDogQWRkIHZlcnNpb24gNC45NQ0KDQphcyB0aGUgY29tbWl0IHN1
bW1hcnkgd291bGQgYmUgY2xlYW5lci4gVXNlIGBnaXQgY29tbWl0IC0tYW1lbmRgIHRvIGNoYW5n
ZSB0aGF0Lg0KDQpBZGRpdGlvbmFsbHkgeW91IHNob3VsZCBlbGFib3JhdGUgbW9yZSBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2Ugd2hhdCB0aGUgcGF0Y2ggaXMgZG9pbmcuDQoNCjEuIEhhdmUgeW91IHRl
c3RlZCBpdD8gSXMgaXQganVzdCBhbiB1cGdyYWRlIGJlY2F1c2Ugb2Ygb3IgZG9lcyB2ZXJzaW9u
DQoNCg0KNC45MSBpbiB0aGUgcmVwb3NpdG9yeSBoYXZlIGFueSBzaG9ydCBjb21pbmdzIHNvIHRo
YXQgaXQgc2hvdWxkIGJlIHJlbW92ZWQ/DQpJIHRlc3RlZCB0aGlzIHJlY2lwZSwgYW5kIHRoZSBy
ZWFzb24gSSBhZGRlZCB0aGlzIHZlcnNpb24gaXMgdGhhdCB3ZSB3YW50IHRvIHVzZSB0aGlzIHZl
cnNpb24gb2YgQmx1ZXogaW4gb3VyIHJlbGVhc2UuDQoNCj4gU2lnbmVkLW9mZi1ieTogVml0YSBQ
cmVza292c2t5IDx2aXRhcEB0aS5jb20+DQo+IC0tLQ0KPiAgcmVjaXBlcy9ibHVlei9ibHVlejRf
NC45NS5iYiB8ICAgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZSAx
MDA2NDQgDQo+IHJlY2lwZXMvYmx1ZXovYmx1ZXo0XzQuOTUuYmINCj4gDQo+IGRpZmYgLS1naXQg
YS9yZWNpcGVzL2JsdWV6L2JsdWV6NF80Ljk1LmJiIA0KPiBiL3JlY2lwZXMvYmx1ZXovYmx1ZXo0
XzQuOTUuYmIgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggDQo+IDAwMDAwMDAuLmE2ODJkNmEN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9yZWNpcGVzL2JsdWV6L2JsdWV6NF80Ljk1LmJiDQo+
IEBAIC0wLDAgKzEsMzAgQEANCj4gK3JlcXVpcmUgYmx1ZXo0LmluYw0KPiArU1JDX1VSSSA9ICJc
DQo+ICsgIGh0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvYmx1ZXRvb3RoL2JsdWV6LSR7
UFZ9LnRhci5neiBcDQoNCjIuIEFzIGZhciBhcyBJIGtub3cga2VybmVsLm9yZyBhZnRlciB0aGUg
Y29tcHJvbWlzZSBwcmVzZW50bHkgZG9lcyBub3QgcHJvdmlkZSB0aGF0IGFyY2hpdmUuIFNvIHRo
ZSByZWNpcGUgd2lsbCBub3QgYnVpbGQgdW5sZXNzIHRoZXJlIGlzIGEgbWlycm9yIHNvbWV3aGVy
ZS4gRG8geW91IGtub3cgb2YgYSBtaXJyb3I/DQoNClRoZXJlIGFyZSB0d28gcG9zc2libGUgbG9j
YXRpb25zIGZvciB0aGlzIHBhY2thZ2U6DQoJaHR0cDovL3d3dy5taXJyb3JzZXJ2aWNlLm9yZy9z
aXRlcy9mdHAua2VybmVsLm9yZy9wdWIvbGludXgvYmx1ZXRvb3RoL2JsdWV6LTQuOTUudGFyLmd6
DQogCWh0dHA6Ly93d3cuYW5nc3Ryb20tZGlzdHJpYnV0aW9uLm9yZy91bnN0YWJsZS9zb3VyY2Vz
L2JsdWV6LTQuOTUudGFyLmd6DQpJIGNoYW5nZWQgdGhlIFNSQ19VUkkgaW4gbXkgd29ya2luZyBk
aXJlY3RvcnkgZm9yIHRoZSBmaXJzdCBsb2NhdGlvbiBhbmQgaXQgd29ya2VkIGZpbmUuIFNvIHdp
dGggd2hhdCBsb2NhdGlvbiBkbyB5b3UgcHJlZmVyIHRoZSByZWNpcGUgd2lsbCBiZSByZWxlYXNl
ZD8NCg0KPiArIGZpbGU6Ly9ibHVldG9vdGguY29uZiBcDQo+ICsiDQo+ICsNCj4gK1NSQ19VUklb
bWQ1c3VtXSA9ICIzNDEyOTRiMjg0OWEwNGE0YWZmZjVjOTZiZmJmMzBiMiINCj4gK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJkNmVhOWRlNDEwZmMyYmNkMjYyMGQ3MDljMjIwMjg5M2IyMThlMmU2YTU1
YzNjMGNlNmJlYmQyN2ZhNDEyMGY2Ig0KPiArDQo+ICtERUZBVUxUX1BSRUZFUkVOQ0UgPSAiLTEi
DQoNCjMuIFdoeT8NCj4gK0RFRkFVTFRfUFJFRkVSRU5DRV9hbmdzdHJvbSA9ICIxIg0KDQo0LiBI
YXZlIHlvdSB0YWxrZWQgdG8gdGhlIMimbmdzdHLDtm0gbWFpbnRhaW5lcnM/DQoNCg0KVGhlc2Ug
dHdvIHZhcmlhYmxlcyBhcmUgZGVmaW5lZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBvZiBibHVl
ejQgcmVjaXBlOiBibHVlejRfNC44OS5iYi4gV2l0aG91dCB0aGVzZSB0d28gZGVmaW5pdGlvbnMg
aW4gbXkgcmVjaXBlIGJpdGJha2UgcHJlZmVycyB0aGUgb2xkIHJlY2lwZSB1cG9uIG1pbmUsIHdo
aWNoIGRvZXNuJ3QgbGVhdmUgbWUgYSBjaG9pY2UgYnV0IHRvIGRlZmluZSB0aGVzZSB2YXJpYWJs
ZXMuDQoNCj4gKw0KPiArREVQRU5EUyArPSAibGlic25kZmlsZTEiDQo+ICsNCj4gK1BSID0gIiR7
SU5DX1BSfS4wIg0KPiArDQo+ICsjIE5vdCBhbGwgZGlzdHJvcyBoYXZlIGEgcmVjZW50IGVub3Vn
aCB1ZGV2IEJUVURFViA9ICIgDQo+ICstLWRpc2FibGUtdWRldnJ1bGVzIg0KPiArQlRVREVWX2Fu
Z3N0cm9tID0gIiAtLWVuYWJsZS11ZGV2cnVsZXMiDQo+ICtCVFVERVZfc2hyID0gIiAtLWVuYWJs
ZS11ZGV2cnVsZXMiDQo+ICsNCj4gK0VYVFJBX09FQ09ORiArPSAiJHtCVFVERVZ9Ig0KPiArZG9f
Y29uZmlndXJlX2FwcGVuZCgpew0KPiArCWVjaG8gIiNkZWZpbmUgTElCVURFVl9JX0tOT1dfVEhF
X0FQSV9JU19TVUJKRUNUX1RPX0NIQU5HRSIgPj4gDQo+ICske1N9L2NvbmZpZy5oIH0NCj4gKw0K
PiArRklMRVNfJHtQTn0tZGJnICs9ICJcDQo+ICsgICR7YmFzZV9saWJkaXJ9L3VkZXYvLmRlYnVn
IFwNCj4gKyAgJHtsaWJkaXJ9LyovLmRlYnVnIFwNCj4gKyINCg0KT3RoZXJ3aXNlIHRoaXMgcmVj
aXBlIGxvb2tzIGdvb2QuIElzIGl0IHBsYW5uZWQgZm9yIGJyYW5jaCAyMDExLjAzLW1haW50ZW5h
bmNlPw0KDQoNClRoYW5rcywNCg0KUGF1bA0K


