Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LWUYz-0001lD-MA
	for openembedded-devel@openembedded.org; Mon, 09 Feb 2009 12:44:59 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id A330216DF7D
	for <openembedded-devel@openembedded.org>;
	Mon,  9 Feb 2009 12:56:17 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 81F802A41EE
	for <openembedded-devel@openembedded.org>;
	Mon,  9 Feb 2009 12:43:44 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 9 Feb 2009 12:43:45 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF642@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: subversion libtool problem
Thread-Index: AcmKq6l61KuqXcTwQIyWF/FxgHaSdQ==
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@openembedded.org>
Subject: subversion libtool problem
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
X-List-Received-Date: Mon, 09 Feb 2009 11:45:39 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

U2luY2UgdGhlIHNhdHVyZGF5ICJhcHIgKyBhcHItdXRpbDogbWVyZ2UgZnJvbSBwb2t5IiBjb21t
aXQgYnkgS29lbiBpIGFsbW9zdCByZWFjaGVkIG15IGdvYWwgdG8gYnVpbGQgYSBzdWJ2ZXJzaW9u
IGNsaWVudCBmb3IgQW5nc3Ryb20uIEFmdGVyIHBhdGNoaW5nIG5lb24gZm9yIG15c2VsZiB0aGVy
ZSBpcyBqdXN0IHRoaXMgbGFzdCBwcm9ibGVtOg0KDQpOT1RFOiBSdW5uaW5nIHRhc2sgNDIyIG9m
IDU3OCAoSUQ6IDcsIC9vcHQvb3BlbmVtYmVkZGVkL3BhY2thZ2VzL3N1YnZlcnNpb24vc3VidmVy
c2lvbl8xLjQuNS5iYiwgZG9fY29tcGlsZSkNCk5PVEU6IHBhY2thZ2Ugc3VidmVyc2lvbi0xLjQu
NTogc3RhcnRlZA0KTk9URTogcGFja2FnZSBzdWJ2ZXJzaW9uLTEuNC41LXIwOiB0YXNrIGRvX2Nv
bXBpbGU6IHN0YXJ0ZWQNCkVSUk9SOiBmdW5jdGlvbiBkb19jb21waWxlIGZhaWxlZA0KRVJST1I6
IGxvZyBkYXRhIGZvbGxvd3MgKC9ob21lL3NsZWR6L29lL3RtcC4xL3dvcmsvaTQ4Ni1hbmdzdHJv
bS1saW51eC9zdWJ2ZXJzaW9uLTEuNC41LXIwL3RlbXAvbG9nLmRvX2NvbXBpbGUuNjA4OCkNCnwg
Tk9URTogbWFrZQ0KfCAvYmluL3NoIC9ob21lL3NsZWR6L29lL3RtcC4xL3dvcmsvaTQ4Ni1hbmdz
dHJvbS1saW51eC9zdWJ2ZXJzaW9uLTEuNC41LXIwL3N1YnZlcnNpb24tMS40LjUvbGlidG9vbCAt
LXNpbGVudCAtLW1vZGU9Y29tcGlsZSBpNDg2LWFuZ3N0cm9tLWxpbnV4LWdjYyAtbWFyY2g9aTQ4
NiAtaXN5c3RlbS9ob21lL3NsZWR6L29lL3RtcC4xL3N0YWdpbmcvaTQ4Ni1hbmdzdHJvbS1saW51
eC91c3IvaW5jbHVkZSAgIC1ETElOVVg9MiAtRF9SRUVOVFJBTlQgLURfR05VX1NPVVJDRSAgLWlz
eXN0ZW0vaG9tZS9zbGVkei9vZS90bXAuMS9zdGFnaW5nL2k0ODYtYW5nc3Ryb20tbGludXgvdXNy
L2luY2x1ZGUgLWZleHBlbnNpdmUtb3B0aW1pemF0aW9ucyAtZnJlbmFtZS1yZWdpc3RlcnMgLWZv
bWl0LWZyYW1lLXBvaW50ZXIgLU8yICAgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1ETkVfTEZTICAg
ICAtSS4vc3VidmVyc2lvbi9pbmNsdWRlIC1JLi9zdWJ2ZXJzaW9uIC1JL2hvbWUvc2xlZHovb2Uv
dG1wLjEvc3RhZ2luZy9pNDg2LWFuZ3N0cm9tLWxpbnV4L3Vzci9pbmNsdWRlL25lb24gLUkvaG9t
ZS9zbGVkei9vZS90bXAuMS9zdGFnaW5nL2k0ODYtYW5nc3Ryb20tbGludXgvdXNyL2luY2x1ZGUg
ICAtSS9ob21lL3NsZWR6L29lL3RtcC4xL3N0YWdpbmcvaTQ4Ni1hbmdzdHJvbS1saW51eC91c3Iv
aW5jbHVkZSAtSS9ob21lL3NsZWR6L29lL3RtcC4xL3N0YWdpbmcvaTQ4Ni1hbmdzdHJvbS1saW51
eC91c3IvaW5jbHVkZSAgLW8gc3VidmVyc2lvbi9saWJzdm5fZGVsdGEvY2FuY2VsLmxvIC1jIHN1
YnZlcnNpb24vbGlic3ZuX2RlbHRhL2NhbmNlbC5jDQp8IC9ob21lL3NsZWR6L29lL3RtcC4xL3dv
cmsvaTQ4Ni1hbmdzdHJvbS1saW51eC9zdWJ2ZXJzaW9uLTEuNC41LXIwL3N1YnZlcnNpb24tMS40
LjUvbGlidG9vbDogbGluZSA0NjM6IENEUEFUSDogY29tbWFuZCBub3QgZm91bmQNCnwgL2hvbWUv
c2xlZHovb2UvdG1wLjEvd29yay9pNDg2LWFuZ3N0cm9tLWxpbnV4L3N1YnZlcnNpb24tMS40LjUt
cjAvc3VidmVyc2lvbi0xLjQuNS9saWJ0b29sOiBsaW5lIDExNDE6IGZ1bmNfb3B0X3NwbGl0OiBj
b21tYW5kIG5vdCBmb3VuZA0KfCBsaWJ0b29sOiBWZXJzaW9uIG1pc21hdGNoIGVycm9yLiAgVGhp
cyBpcyBsaWJ0b29sIDIuMi40LCBidXQgdGhlDQp8IGxpYnRvb2w6IGRlZmluaXRpb24gb2YgdGhp
cyBMVF9JTklUIGNvbWVzIGZyb20gYW4gb2xkZXIgcmVsZWFzZS4NCnwgbGlidG9vbDogWW91IHNo
b3VsZCByZWNyZWF0ZSBhY2xvY2FsLm00IHdpdGggbWFjcm9zIGZyb20gbGlidG9vbCAyLjIuNA0K
fCBsaWJ0b29sOiBhbmQgcnVuIGF1dG9jb25mIGFnYWluLg0KfCBtYWtlOiAqKiogW3N1YnZlcnNp
b24vbGlic3ZuX2RlbHRhL2NhbmNlbC5sb10gRXJyb3IgNjMNCnwgRkFUQUw6IG9lX3J1bm1ha2Ug
ZmFpbGVkDQo=


