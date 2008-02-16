Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JQUIi-0008IW-Ox
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2008 22:10:29 +0100
Received: by fg-out-1718.google.com with SMTP id 13so1035670fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2008 13:09:58 -0800 (PST)
Received: by 10.82.187.2 with SMTP id k2mr8066750buf.16.1203196198111;
	Sat, 16 Feb 2008 13:09:58 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Sat, 16 Feb 2008 13:09:58 -0800 (PST)
Message-ID: <74d0deb30802161309tc81cbe4g47435374aadef465@mail.gmail.com>
Date: Sat, 16 Feb 2008 22:09:58 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080216185445.22199031@widy.localdomain>
MIME-Version: 1.0
References: <E1JQBXb-0008Gs-HR@linuxtogo.org>
	<200802161730.36669.openembedded@haerwu.biz>
	<20080216185445.22199031@widy.localdomain>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: philipp.zabel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev devimage 0.1: Up a usb0 on load, now that we're modular.
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
X-List-Received-Date: Sat, 16 Feb 2008 21:10:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gRmViIDE2LCAyMDA4IDU6NTQgUE0sIFBhdWwgU29rb2xvdnNreSA8cG1pc2NtbEBnbWFpbC5j
b20+IHdyb3RlOgo+IEhlbGxvLAo+Cj4gT24gU2F0LCAxNiBGZWIgMjAwOCAxNzozMDozNSArMDEw
MAo+IE1hcmNpbiBKdXN6a2lld2ljeiA8b3BlbmVtYmVkZGVkQGhhZXJ3dS5iaXo+IHdyb3RlOgo+
Cj4gPiBEbmlhIFNhdHVyZGF5LCAxNiBvZiBGZWJydWFyeSAyMDA4LCBwZmFsY29uIGNvbW1pdCBu
YXBpc2GzOgo+ID4gPiBkZXZpbWFnZSAwLjE6IFVwIGEgdXNiMCBvbiBsb2FkLCBub3cgdGhhdCB3
ZSdyZSBtb2R1bGFyLgo+ID4KPiA+ID4gK21vZHByb2JlIGdfZXRoZXIKPiA+ID4gK2lmY29uZmln
IHVzYjAgMTkyLjE2OC4yLjIwMgo+ID4KPiA+IEkgYW0gY3VyaW91cyB3aGVuIHNvbWVvbmUgd2ls
bCBwdXNoIHVzYjAgdG8gMTkyLjE2OC4zLjIwMi4uLiBQbGVhc2UKPiA+IHVzZSBuZXRiYXNlIHN0
YW5kYXJkOiAxOTIuMTY4LjAuMjAyIGluIHlvdXIgcmVjaXBlLgo+Cj4gMTkyLjE2OC4wLjAvMjQs
IDE5Mi4xNjguMS4wLzI0IGFyZSBub3QgZ29vZCBjaG9pY2VzIGFzIHRob3NlIGFyZQo+IG9mdGVu
dGltZXMgcmVmZXIgdG8gZXhpc3RpbmcgbmV0d29ya3MgKHllcywgdGhvc2UgdmVuZG9ycyBsb3Zl
IHRvIHVzZQo+ICJzdGFuZGFyZCIgdmFsdWVzIHRvbykuIDIgaXMgb2YgY291cnNlIG5vdCBnb29k
IGVpdGhlciwgc29tZXRoaW5nIG1vcmUKPiByYW5kb20gc2hvdWxkIGJlIHVzZWQuIFdoaWNoIGV4
YWN0bHkgc2hvdWxkIGJlIHN1YmplY3Qgb2YgUkZDLiAoQW5kCj4gbm8sIHRoaXMgaXMgbm90IHJl
bGF0ZWQgdG8gbmV0YmFzZSB3aGljaCBvZmZlcnMgc29tZSB2YWx1ZSBmb3IgdXNlciB0bwo+IGVk
aXQuIFRoaXMgb25lIGlzIG5vdCBzdXBwb3NlZCB0byBiZSBlZGl0YWJsZSBieSBlbmQgdXNlci4p
CgpJIHdvbid0IGFyZ3VlIGZvciBvciBhZ2FpbnN0IGEgY2VydGFpbiB2YWx1ZSwgYmVjYXVzZSBu
b25lIG9mIHRoZW0gaXMKYSBiZXR0ZXIgY2hvaWNlIHRoYW4gYW55IG90aGVyLgooSSB1c2Ugc3Vi
bmV0cyAxOTIuMTY4LnguMC8yNCBmb3IgeCBpbiAxLDIsMyw0LDEwLDE3OCBmb3Igb3RoZXIKcHVy
cG9zZXMgYWxyZWFkeSwgMCBpcyBmcmVlIGZvciB1c2IpLgpCdXQgcGxlYXNlIG1ha2UgdGhpcyBh
bmQgdGhlIG5ldGJhc2Ugb25lIGhhdmUgdGhlIHNhbWUgdmFsdWUuCgpyZWdhcmRzClBoaWxpcHAK


