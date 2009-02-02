Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LU0xu-0006fi-PY
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2009 16:44:02 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 1567016DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 16:48:19 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 12D162A4203
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 16:36:04 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 2 Feb 2009 16:35:42 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF61D@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: config/compile problem with apr-1.2.12
Thread-Index: AcmFS/UvDS8k7+GTSNqQljH5HhSAag==
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: config/compile problem with apr-1.2.12
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
X-List-Received-Date: Mon, 02 Feb 2009 15:44:02 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SSdtIG5vdCByZWFsbHkgc3VyZSB3aGF0J3MgdGhlIHByb2JsZW0gaGVyZSwgbWF5YmUgaXQgaGFz
IHRoZSBzYW1lIGJhY2tncm91bmQgbGlrZSA8aHR0cDovL2J1Z3MuZ2VudG9vLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MjI2NTc3Pi4gQ2FuIHNvbWVvbmUgaGVscD8NCg0KRVJST1I6IGxvZyBkYXRhIGZv
bGxvd3MgKC9ob21lL3NsZWR6L29lL3RtcC4xL3dvcmsvaTQ4Ni1hbmdzdHJvbS1saW51eC9hcHIt
MS4yLjEyLXIwL3RlbXAvbG9nLmRvX2NvbXBpbGUuMzA0NTQpDQp8IE5PVEU6IG1ha2UNCnwgbWFr
ZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvaG9tZS9zbGVkei9vZS90bXAuMS93b3JrL2k0ODYt
YW5nc3Ryb20tbGludXgvYXByLTEuMi4xMi1yMC9hcHItMS4yLjEyJw0KfCAvYmluL2Jhc2ggL2hv
bWUvc2xlZHovb2UvdG1wLjEvd29yay9pNDg2LWFuZ3N0cm9tLWxpbnV4L2Fwci0xLjIuMTItcjAv
YXByLTEuMi4xMi9saWJ0b29sIC0tc2lsZW50IC0tbW9kZT1jb21waWxlIGk0ODYtYW5nc3Ryb20t
bGludXgtZ2NjIC1tYXJjaD1pNDg2ICAgLWlzeXN0ZW0vaG9tZS9zbGVkei9vZS90bXAuMS9zdGFn
aW5nL2k0ODYtYW5nc3Ryb20tbGludXgvdXNyL2luY2x1ZGUgLWZleHBlbnNpdmUtb3B0aW1pemF0
aW9ucyAtZnJlbmFtZS1yZWdpc3RlcnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLU8yIC1ESEFWRV9D
T05GSUdfSCAtRExJTlVYPTIgLURfUkVFTlRSQU5UIC1EX0dOVV9TT1VSQ0UgIC1pc3lzdGVtL2hv
bWUvc2xlZHovb2UvdG1wLjEvc3RhZ2luZy9pNDg2LWFuZ3N0cm9tLWxpbnV4L3Vzci9pbmNsdWRl
IC1JLi9pbmNsdWRlIC1JL2hvbWUvc2xlZHovb2UvdG1wLjEvd29yay9pNDg2LWFuZ3N0cm9tLWxp
bnV4L2Fwci0xLjIuMTItcjAvYXByLTEuMi4xMi9pbmNsdWRlL2FyY2gvdW5peCAtSS4vaW5jbHVk
ZS9hcmNoL3VuaXggLUkvaG9tZS9zbGVkei9vZS90bXAuMS93b3JrL2k0ODYtYW5nc3Ryb20tbGlu
dXgvYXByLTEuMi4xMi1yMC9hcHItMS4yLjEyL2luY2x1ZGUgIC1vIHBhc3N3ZC9hcHJfZ2V0cGFz
cy5sbyAtYyBwYXNzd2QvYXByX2dldHBhc3MuYyAmJiB0b3VjaCBwYXNzd2QvYXByX2dldHBhc3Mu
bG8NCnwgL2hvbWUvc2xlZHovb2UvdG1wLjEvd29yay9pNDg2LWFuZ3N0cm9tLWxpbnV4L2Fwci0x
LjIuMTItcjAvYXByLTEuMi4xMi9saWJ0b29sOiBsaW5lIDQ2MDogQ0RQQVRIOiBjb21tYW5kIG5v
dCBmb3VuZA0KfCAvaG9tZS9zbGVkei9vZS90bXAuMS93b3JrL2k0ODYtYW5nc3Ryb20tbGludXgv
YXByLTEuMi4xMi1yMC9hcHItMS4yLjEyL2xpYnRvb2w6IGxpbmUgMTEzODogZnVuY19vcHRfc3Bs
aXQ6IGNvbW1hbmQgbm90IGZvdW5kDQp8IGxpYnRvb2w6IFZlcnNpb24gbWlzbWF0Y2ggZXJyb3Iu
ICBUaGlzIGlzIGxpYnRvb2wgMi4yLjQsIGJ1dCB0aGUNCnwgbGlidG9vbDogZGVmaW5pdGlvbiBv
ZiB0aGlzIExUX0lOSVQgY29tZXMgZnJvbSBhbiBvbGRlciByZWxlYXNlLg0KfCBsaWJ0b29sOiBZ
b3Ugc2hvdWxkIHJlY3JlYXRlIGFjbG9jYWwubTQgd2l0aCBtYWNyb3MgZnJvbSBsaWJ0b29sIDIu
Mi40DQp8IGxpYnRvb2w6IGFuZCBydW4gYXV0b2NvbmYgYWdhaW4uDQp8IG1ha2VbMV06ICoqKiBb
cGFzc3dkL2Fwcl9nZXRwYXNzLmxvXSBFcnJvciA2Mw0KfCBtYWtlWzFdOiBMZWF2aW5nIGRpcmVj
dG9yeSBgL2hvbWUvc2xlZHovb2UvdG1wLjEvd29yay9pNDg2LWFuZ3N0cm9tLWxpbnV4L2Fwci0x
LjIuMTItcjAvYXByLTEuMi4xMicNCnwgbWFrZTogKioqIFthbGwtcmVjdXJzaXZlXSBFcnJvciAx
DQp8IEZBVEFMOiBvZV9ydW5tYWtlIGZhaWxlZA0K


