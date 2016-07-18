Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1D660589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:10:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bP3cq-0006cG-4N for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2016 10:10:04 +0200
Received: from ni.fela.ch ([87.245.122.82])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:10:04 +0200
Received: from severin.birrer by ni.fela.ch with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:10:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Severin Birrer <severin.birrer@fela.ch>
Date: Mon, 18 Jul 2016 07:50:11 +0000 (UTC)
Message-ID: <loom.20160718T094215-224@post.gmane.org>
References: <A126740DBD3CFF4C92C08C03B00BC6C80135FD79@exch02-esl-se.Multiq2.local>,
	<A126740DBD3CFF4C92C08C03B00BC6C80135FDEE@exch02-esl-se.Multiq2.local>,
	<A126740DBD3CFF4C92C08C03B00BC6C80135FE70@exch02-esl-se.Multiq2.local>
	<A126740DBD3CFF4C92C08C03B00BC6C80135FF3C@exch02-esl-se.Multiq2.local>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 87.245.122.82 (Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:47.0) Gecko/20100101 Firefox/47.0)
Subject: Re: [meta-oe][krogoth][issue]
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
X-List-Received-Date: Mon, 18 Jul 2016 08:10:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

VG9iaWFzIEFuZGVyc3NvbiA8dG9iaWFzLmFuZGVyc3NvbiA8YXQ+IG11bHRpcS5jb20+IHdyaXRlczoKCj4gCj4gSSBoYXZlIGFuIGlzc3VlIHdpdGggcGhwLWNnaSBmYWlsaW5nIG9uIGV4ZWN1dGUgd2l0aCBlcnJvciBtc2c6Cj4gCj4gcGhwLWNnaTogcmVsb2NhdGlvbiBlcnJvcjogcGhwLWNnaTogc3ltYm9sIG15c3FsX3NlcnZlcl9pbml0LCB2ZXJzaW9uCmxpYm15c3FsY2xpZW50XzE2IG5vdCBkZWZpbmVkCj4gaW4gZmlsZSBsaWJteXNxbGNsaWVudC5zby4xOCB3aXRoIGxpbmsgdGltZSByZWZlcmVuY2UKPiAKPiBsaWJteXNxbGNsaWVudC5zby4xOCBjb21lcyBmcm9tIG1hcmlhZGIKPiBicmFuY2ggaXMga3JvZ290aAo+IAo+IE1lZCB2w6RubGlnIGjDpGxzbmluZy8gS2luZCBSZWdhcmRzCj4gCj4gVG9iaWFzIEFuZGVyc3Nvbgo+IAo+IFNvZnR3YXJlIERldmVsb3Blcgo+IAo+IERpcmVjdDogKzQ2ICgwKTEwIDIxMSA2NiAwNQo+IE9mZmljZTogKzQ2ICgwKTEwIDIxMSA2NiAwMAo+IAo+IHRvYmlhcy5hbmRlcnNzb24gPGF0PiBtdWx0aXEuY29tCj4gCj4gd3d3Lm11bHRpcS5jb20KCgpJIGhhZCB0aGUgc2FtZSBQcm9ibGVtIHdpdGggcGhwIGFuZCBteSBvd24gYnVpbHQgYXBwbGljYXRpb24gdXNpbmcgbXlzcWwuCgpJIGdldCBpdCBzb2x2ZWQgYnkgdXBkYXRpbmcgdGhlIGJpbnV0aWxzIHRvIGEgbW9yZSB1cC10by1kYXRlIHJlbGVhc2UuClRoZSBwcm9ibGVtIHdhcyBhbHNvIGRpc2N1c3NlZCBoZXJlOgpodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xOTY5OAoKSXQncyBkdWUgdG8gcHJvYmxlbSB3aXRoIHRoZSBsaW5rZXIsIHdoaWNoIHB1dHMgb2xkIHZlcnNpb24gbGlua3MgaW50byB0aGUKZXhlY3V0YWJsZS4KCkdvb2QgbHVjayBhbmQgS2luZCBSZWdhcmRzClNldmVyaW4gQmlycmVy


