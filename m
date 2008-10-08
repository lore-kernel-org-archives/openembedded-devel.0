Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KnhFu-00018K-HX
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 00:11:43 +0200
Received: by gxk13 with SMTP id 13so8772794gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 15:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=iP4aWr8C2wysnCyLY0/qHHKtLyzVgvvGyvNYk1Cnoho=;
	b=jQszTTyZ6mG7daYFeTuKvShzp88OmYqVX/LB6G5T1cBHIGdNOj/ZS9AlNWo+ePzQV2
	ye+fEDLAJS9krHWynzs5PMPVlM9BVdfOPZ3x0wKZztz598zAcg8zwZUF8ynXJPHqVsCA
	D8zdz4Fvptxz+ikU3Ye2RykN4hYONJivhZxYo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=nn8ue94DzacYEtJKFptzABBffiT0td0fnbKXppZ0+oabkcVeBgFY7suzmLYovsY1On
	LVNWeDePDiBqBwKPkJ1PKYsFODIrEpNiozM9KqfuRjBt+N/X28bG2EVwwKI/5+vNCl4W
	y61V0npyBMA4xmw+d/NzZTSylrfFFJpItZxYg=
Received: by 10.151.123.7 with SMTP id a7mr592635ybn.73.1223503620707;
	Wed, 08 Oct 2008 15:07:00 -0700 (PDT)
Received: by 10.150.212.20 with HTTP; Wed, 8 Oct 2008 15:07:00 -0700 (PDT)
Message-ID: <48239d390810081507l19acd4ffg2f50cb3a77d140c1@mail.gmail.com>
Date: Thu, 9 Oct 2008 02:07:00 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: "Stanislav Brabec" <utx@penguin.cz>
In-Reply-To: <1223496182.3549.7.camel@utx.utx.cz>
MIME-Version: 1.0
References: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
	<1223480224.9336.12.camel@hammer.suse.cz>
	<48239d390810081234t2b5ea5c4g5fcb6f1900a274da@mail.gmail.com>
	<1223496182.3549.7.camel@utx.utx.cz>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 22:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVGh1LCBPY3QgOSwgMjAwOCBhdCAxMjowMyBBTSwgU3RhbmlzbGF2IEJyYWJlYyA8dXR4QHBl
bmd1aW4uY3o+IHdyb3RlOgo+IFNlcmdleSBMYXBpbiB3cm90ZToKPj4gT24gV2VkLCBPY3QgOCwg
MjAwOCBhdCA3OjM3IFBNLCBTdGFuaXNsYXYgQnJhYmVjIDx1dHhAcGVuZ3Vpbi5jej4gd3JvdGU6
Cj4+ID4gRm9yIGhpc3RvcmljYWwgcmVhc29ucywgSFRUUCBjaGFyYWN0ZXJzIGFyZSBjb252ZXJ0
ZWQgdG8gNyBiaXRzLgo+PiA+IElmIHlvdSBzZWUgc29tZXRoaW5nIGxpa2UgIiVDNSVCRSVDNSU5
OSVDNSVBMSIgYWZ0ZXIgdXNpbmcgd2dldCwgdGhlbiBpdAo+PiA+IGlzIG5vdCBhIGJ1ZywgaXQg
aXMgYSBmZWF0dXJlLgo+PiBObywgaXQgdHJpZXMgdG8gY29udmVydCwgYnV0IGZhaWxzLgo+PiBT
bywgYXMgSSBzZWUgYSBwcm9ibGVtIGlzIGluIHdnZXQgaXRzZWxmLgo+Cj4gQXJlIHlvdSB1c2lu
ZyBidXN5Ym94IHdnZXQgb3IgR05VIHdnZXQ/CkdOVSB3Z2V0Lgo+Cj4gV2hhdCBleGFjdGx5IGhh
cHBlbnM/ClNvbWUgY2hhcmFjdGVycyBvZiBmaWxlIG5hbWUgZWl0aGVyIHJlcGxhY2VkIHdpdGgg
dHJhc2ggb3IgbGVmdCBhcyAleHgKc29tZXRpbWVzIGl0IGlzIG1vcmUgdGhhbiBhIGhhbGYgb2Yg
ZmlsZSBuYW1lLiBBU0NJSSBjaGFyYWN0ZXJzIGFyZSBmaW5lLAp0aG91Z2guCj4KPiBXaXRoIEdO
VSB3Z2V0IHlvdSBjYW4gdHJ5IC0tcmVzdHJpY3QtZmlsZS1uYW1lcz1ub2NvbnRyb2wKQWgsIHRo
YW5rcyEgVGhpcyBvbmUgaXMgZXhhY3RseSB3aGF0IEkgbmVlZCEKCj4KPiBJIHRoaW5rIHRoYXQg
d2dldCBodHRwOi8vIHNob3VsZCBuZXZlciBwcm9kdWNlIGZpbGVzIHdpdGggbmFtZXMgd2l0aAo+
IGFjY2VudHMsIGF0IGxlYXN0IGZvciBtb3N0IHNlcnZlcnMuIO+7v3dnZXQgZnRwOi8vIGNhbiBj
cmVhdGUgc3VjaCBmaWxlcywKPiBidXQgYXMgRlRQIHByb3ZpZGVzIG5vIHN1cHBvcnQgZm9yIGNo
YXJzZXQsIHdnZXQgc2F2ZXMgdGhlbSBhcyB0aGV5IGFyZQo+IHdpdGggbm8gY29udmVyc2lvbiBh
bmQgd2l0aCBubyBpZGVhIGFib3V0IGNoYXJzZXQuCldlbGwsIHNldHRpbmcgbWVudGlvbmVkIGFi
b3ZlIHdvcmtzIGxpa2UgY2hhcm0uIFRoYW5rcyBhIGxvdCBmb3IgaW5mbyEK


