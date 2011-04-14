Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QAU05-0003lx-Hd
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 23:22:56 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJN00C3KV9LAIM4@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	14 Apr 2011 16:20:14 -0500 (CDT)
Received: from localhost (unknown [70.36.246.130])
	by gandalf.denix.org (Postfix) with ESMTPA id D8E6314AF51; Thu,
	14 Apr 2011 17:20:07 -0400 (EDT)
Date: Thu, 14 Apr 2011 14:21:58 -0700
Message-id: <qx9nxw1mnesn7kwslh1f2781.1302815917376@email.android.com>
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
MIME-version: 1.0
Cc: Carlos Hernandez <c-hernandez8@ti.com>
Subject: Re: [PATCH 2/2] ltp-ddt: New recipe to build ltp-ddt test tool.
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
X-List-Received-Date: Thu, 14 Apr 2011 21:22:57 -0000
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: base64

U29ycnkgZm9yIHRvcC1wb3N0aW5nIC0gSSdtIHdyaXJpbmcgaXQgb24gbXkgcGhvbmUuLi4KCkNh
cmxvcywKCklzIHRoZXJlIGFueSByZWFzb24gdG8gbm90IGFkaGVyZSB0byBGSFMgaHR0cDovL3d3
dy5wYXRobmFtZS5jb20vZmhzLwoKRGVueXMKCgpDYXJsb3MgSGVybmFuZGV6IDxjYXJoZXJAZ21h
aWwuY29tPiB3cm90ZToKCj5sdHAtZGR0IGlzIGFuIG9wZW4gc291cmNlIHRlc3QgYXBwbGljYXRp
b24gZm9yIGVtYmVkZGVkIGxpbnV4IGRldmljZXMuCj5JdCBpcyBiYXNlZCBvbiB0aGUgbGludXgg
dGVzdCBwcm9qZWN0IChsdHApIGJ1dCBpdCBoYXMgYSBzbWFsbGVyIGZvb3RwcmludAo+YW5kIGl0
IGZvY3VzIG1haW5seSBvbiBkcml2ZXIgYW5kIHN5c3RlbSBwZXJmb3JtYW5jZS4KPkRlc2lnbiBI
aWdobGlnaHRzOgo+ICogQmFzZWQgb24gTFRQIGh0dHA6Ly9sdHAuc291cmNlZm9yZ2UubmV0Lwo+
ICogVGVzdCBjYXNlcyBhcmUgc3VpdGFibGUgZm9yIGVtYmVkZGVkIGRldmljZXMgdy8gYSBsaW1p
dGVkIHNoZWxsLgo+ICogU3VwcG9ydCBkeW5hbWljIHNlbGVjdGlvbi9maWx0ZXJpbmcgb2YgdGVz
dCBjYXNlcyBiYXNlZCBvbiBwbGF0Zm9ybS4KPiAqIFN1cHBvcnQgdGVzdCBwYXJhbWV0ZXJzIG92
ZXJyaWRlcyBiYXNlZCBvbiBwbGF0Zm9ybS4KPgo+U2lnbmVkLW9mZi1ieTogQ2FybG9zIEhlcm5h
bmRleiA8Yy1oZXJuYW5kZXo4QHRpLmNvbT4KPi0tLQo+IHJlY2lwZXMvbHRwLWRkdC9sdHAtZGR0
XzAuMC4xLmJiIHwgICA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
IDEgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKPiBjcmVh
dGUgbW9kZSAxMDA2NDQgcmVjaXBlcy9sdHAtZGR0L2x0cC1kZHRfMC4wLjEuYmIKPgo+ZGlmZiAt
LWdpdCBhL3JlY2lwZXMvbHRwLWRkdC9sdHAtZGR0XzAuMC4xLmJiIGIvcmVjaXBlcy9sdHAtZGR0
L2x0cC1kZHRfMC4wLjEuYmIKPm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj5pbmRleCAwMDAwMDAwLi4x
NTdlZTA3Cj4tLS0gL2Rldi9udWxsCj4rKysgYi9yZWNpcGVzL2x0cC1kZHQvbHRwLWRkdF8wLjAu
MS5iYgo+QEAgLTAsMCArMSw1NCBAQAo+K0RFU0NSSVBUSU9OID0gIkVtYmVkZGVkIExpbnV4IERl
dmljZSBEcml2ZXIgVGVzdHMgYmFzZWQgb24gTGludXggVGVzdCBQcm9qZWN0Igo+K0hPTUVQQUdF
ID0gImh0dHA6Ly9hcmFnby1wcm9qZWN0Lm9yZy9naXQvcHJvamVjdHMvP3A9dGVzdC1hdXRvbWF0
aW9uL2x0cC1kZHQuZ2l0O2E9c3VtbWFyeSIKPitMSUNFTlNFID0gIkdQTCIKPitTRUNUSU9OID0g
ImNvbnNvbGUvdXRpbHMiCj4rREVQRU5EUyArPSAiemlwLW5hdGl2ZSB2aXJ0dWFsL2tlcm5lbCIK
PitQUiA9ICJyMCIKPisKPitpbmhlcml0IGF1dG90b29scwo+Kwo+K0JSQU5DSCA/PSAibWFzdGVy
Igo+K1RBRyA/PSAibHRwLWRkdF8ke1BWfSIKPisKPitTUkNfVVJJID0gIlwKPitnaXQ6Ly9hcmFn
by1wcm9qZWN0Lm9yZy9naXQvcHJvamVjdHMvdGVzdC1hdXRvbWF0aW9uL2x0cC1kZHQuZ2l0O3By
b3RvY29sPWdpdDtcCj4rYnJhbmNoPSR7QlJBTkNIfTtcCj4rdGFnPSR7VEFHfVwKPisiCj4rUyA9
ICIke1dPUktESVJ9L2dpdCIKPisKPitFWFRSQV9PRU1BS0VfYXBwZW5kID0gInByZWZpeD0vdXNy
L2x0cCBDUk9TU19DT01QSUxFPSR7SE9TVF9QUkVGSVh9IFNLSVBfSURDSEVDSz0xIEtFUk5FTF9J
TkM9JHtTVEFHSU5HX0tFUk5FTF9ESVJ9L2luY2x1ZGUiCj4rCj4rRklMRVNfJHtQTn0tZGJnICs9
ICJcCj4rIC91c3IvbHRwLy5kZWJ1ZyBcCj4rIC91c3IvbHRwL2Jpbi8uZGVidWcgXAo+KyAvdXNy
L2x0cC9ydW50ZXN0Ly5kZWJ1ZyBcCj4rIC91c3IvbHRwL3Rlc3RjYXNlcy9iaW4vLmRlYnVnIFwK
PisgL3Vzci9sdHAvdGVzdGNhc2VzL2Jpbi8qL2Jpbi8uZGVidWcgXAo+KyAvdXNyL2x0cC90ZXN0
Y2FzZXMvYmluLyovdGVzdC8uZGVidWcgXAo+KyAvdXNyL2x0cC90ZXN0Y2FzZXMvYmluL2RkdC8u
ZGVidWcgXAo+KyAvdXNyL2x0cC90ZXN0Y2FzZXMvYmluL2RkdC8qL2Jpbi8uZGVidWcgXAo+KyAv
dXNyL2x0cC90ZXN0Y2FzZXMvYmluL2RkdC8qL3Rlc3QvLmRlYnVnIFwKPisiCj4rCj4rRklMRVNf
JHtQTn0gKz0gIlwKPisgL3Vzci9sdHAvKiBcCj4rIC91c3IvbHRwL2Jpbi8qIFwKPisgL3Vzci9s
dHAvcnVudGVzdC8qIFwKPisgL3Vzci9sdHAvdGVzdGNhc2VzL2Jpbi8qIFwKPisgL3Vzci9sdHAv
dGVzdGNhc2VzL2Jpbi8qL2Jpbi8qIFwKPisgL3Vzci9sdHAvdGVzdHNjcmlwdHMvKiBcCj4rIgo+
Kwo+K2RvX2NvbmZpZ3VyZSgpewo+KyAgICAgICAgY3AgJHtTfS9pbmNsdWRlL2NvbmZpZy5oLmRl
ZmF1bHQgJHtTfS9pbmNsdWRlL2NvbmZpZy5oCj4rCWNwICR7U30vaW5jbHVkZS9tay9jb25maWcu
bWsuZGVmYXVsdCAke1N9L2luY2x1ZGUvbWsvY29uZmlnLm1rCj4rCWNwICR7U30vaW5jbHVkZS9t
ay9mZWF0dXJlcy5tay5kZWZhdWx0ICR7U30vaW5jbHVkZS9tay9mZWF0dXJlcy5tawo+KwllY2hv
ICIke1RBR30iID4gJHtTfS9DaGFuZ2VMb2cKPit9Cj4rCj4rZG9faW5zdGFsbCgpewo+KyAgICAg
ICAgb2VfcnVubWFrZSBERVNURElSPSR7RH0gaW5zdGFsbAo+K30KPisKPisKPi0tIAo+MS43LjAu
NAo+Cj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj5P
cGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0Cj5PcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZwo+aHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWls
bWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbAo=



