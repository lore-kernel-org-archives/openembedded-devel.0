Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1IPXWg-00028Q-NY
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2007 07:52:40 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1825846waf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2007 22:51:02 -0700 (PDT)
Received: by 10.114.210.2 with SMTP id i2mr3345595wag.1188193862312;
	Sun, 26 Aug 2007 22:51:02 -0700 (PDT)
Received: by 10.114.145.19 with HTTP; Sun, 26 Aug 2007 22:51:02 -0700 (PDT)
Message-ID: <432beae0708262251k2a3f5492ubdc23ac8281fc280@mail.gmail.com>
Date: Sun, 26 Aug 2007 22:51:02 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1188188630.2137.23.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1188186507.2137.17.camel@localhost.localdomain>
	<432beae0708262104o6ff849cr957ad60b1584e2ca@mail.gmail.com>
	<1188188630.2137.23.camel@localhost.localdomain>
Subject: Re: I hava an idea to Make OpenEmbedded Run Faster
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2007 05:52:40 -0000
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gOC8yNi8wNywg0e7NrLflIDx5YW5ndGZAZW52aXNpb24uY29tLmNuPiB3cm90ZToKPiByZWFs
bHk/PyBCaXRiYWtlIHNhbWUgdG8gYmUgc2luZ2xlIHRocmVhZCAuIE15IE1haW4gSWRlYXIgaXMg
bGlrZSB0aGlzCj4gd2hlbiBzb21lIHRhc2sgaXMgY29tcGlsaW5nICxTb21lIHRhc2sgaXMgZmV0
Y2hpbmcgLGFuZCBvdGhlciBtYXliZQo+IGRvX2luc3RhbGxpbmcgLgo+IGJ1dCAgYml0YmFrZSBk
b24ndCBsb29rIGxpa2UgdGhpcyAuCj4KCldoYXQgdmVyc2lvbiBvZiBiaXRiYWtlIGFyZSB5b3Ug
dXNpbmc/IEkga25vdyB0aGF0IDEuOCBzdXBwb3J0cyBtdWx0aXRocmVhZGluZy4KCj4KPiDU2iAy
MDA3LTA4LTI2yNW1xCAyMTowNCAtMDcwMKOsSnVzdGluIFBhdHJpbtC0tcCjugo+Cj4gPiBPbiA4
LzI2LzA3LCDR7s2st+UgPHlhbmd0ZkBlbnZpc2lvbi5jb20uY24+IHdyb3RlOgo+ID4gPiBFdmVy
eU9uZToKPiA+ID4gICAgICAgQnkgdHdvIHdlZWsgIG9mIHVzaW5nIE9FICwgSSBoYXZhIG5vdGlj
ZSB0aGF0IHRhc2sgd2FzIHRvcG9sb2d5Cj4gPiA+IHNvcnQgdG8gYSBxdWV1ZSAuYW5kICBSdW4g
VGFzayBPbmUgQnkgT25lLgo+ID4gPiBkcmF3IG9uIHRoZSBleHBlcmllbmNlIG9mIERlc2lnbiBv
ZiBDUFUgLiB3ZSBjYW4gbWFrZSBhIG11bHRpcGx5IHRocmVhZAo+ID4gPiBydW4gb2YgaXQgIQo+
ID4gPgo+ID4gPiAgICAgICBJIG5vdGljZSB0aGF0IHRoZSBiaWdnZXN0IGJvdHRsZW5lY2sgb2Yg
T0UgaXMgZG9fZmV0Y2ggLiB0aGVuIHdlCj4gPiA+IGNhbiB1c2UgYSBtdXRpcGx5IHRocmVhZCBk
b3dubG9hZGVyIGluc3RlYWQgb2Ygd2dldAo+ID4gPiAgICAgICBBbmQgYWJvdXQgdGFzayBzY2hl
ZHVsZSAsdXNlIG1ldGhvZCBsaWtlIHRoaXM6Cj4gPiA+Cj4gPiA+ICAgICAgYmJfTm8xIGRvX2Zl
dGNoICAgZG9fcGF0Y2ggZG9fY29uZmlndXJlIGRvX2J1aWxkIGRvX2luc3RhbGwKPiA+ID4gICAg
ICBiYl9ObzIgICAgICAgICAgICAgICAgICBkb19mZXRjaCAgZG9fcGF0Y2ggICAgICAgZG9fY29u
ZmlndXJlCj4gPiA+IGRvX2J1aWxkIGRvX2luc3RhbGwKPiA+ID4gICAgICBiYl9ObzMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkb19mZXRjaCAgICAgIGRvX3BhdGNoCj4gPiA+IGRv
X2NvbmZpZ3VyZSBkb19idWlsZCBkb19pbnN0YWxsCj4gPiA+ICAgICAgYmJfTm80Cj4gPiA+IGRv
X2ZldGNoICAuLi4uLi4uCj4gPiA+Cj4gPiA+ICAgICAgSWRlYSAxIDogICAgZm9jdXMgb24gZG93
bmxvYWQgb25lIGZpbGUgb25lIHRpbWUgLGFuZCBtYWtlIGl0IG1vcmUKPiA+ID4gZmFzdCB1c2Ug
bXV0aXBseSB0aHJlYWQgZG93bmxvYWRlcgo+ID4gPiAgICAgIElkZWEgMiA6ICAgIG1ha2UgMHRo
ZXIgdGFzayBvZiBiYiBmaWxlcyAgdG8gcnVuICBhc3luY2hyb25vdXNseQo+ID4gPiAgICAgIElk
ZWEgMyA6ICAgZGVhbCB3aXRoIHRhc2sgIHRvcG9sb2d5IG1vcmUgY2FyZWZ1bGx5IHRvIG1ha2Ug
c3VyZQo+ID4gPiB0aGF0ICB0aGUgYmIgZmlsZSB0aGF0IHdhcyBkZXBlbmRlbmQgd2FzIGZpbmlz
aCBiZWZvcmUKPiA+ID4gICAgICAgICAgICAgICAgICAgICB0aGlzIG9uZSBzdGFydCB0byBkb19w
YXRjaCAoTm90aWNlIDogbm90IGJlZm9yZQo+ID4gPiBkb19mZXRjaCApCj4gPiA+ICAgICAgSWRl
YSA0IDogICBJZiB0b3BvbG9neSBjYW4ndCBtYWtlIHN1cmUgSWRlYSAzICx3ZSBtdXN0IHRlbGwg
T0UgaG93Cj4gPiA+IGFuZCB3aGVuICB0byB3YWl0Cj4gPiA+Cj4gPiA+ICAgICAgSWYgdGhlIElk
ZWEgY2FuIGNvbWUgdHJ1ZSAsVGhlIHNwZWVkIGNhbiBnbyAzIHRpbWVzIGZhc3RlciB0aGVuCj4g
PiA+IG5vdwo+ID4gPgo+ID4KPiA+IGJpdGJha2UgYWxyZWFkeSBkb2VzIHRoaXMuCj4gPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gT3BlbmVtYmVk
ZGVkLWRldmVsIG1haWxpbmcgbGlzdAo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnCj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xp
c3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbAo+CgoKLS0gCkp1c3RpbiBQYXRyaW4K


