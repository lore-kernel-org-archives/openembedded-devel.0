Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ka6sox@gmail.com>) id 1PRWrC-0007xV-2J
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 22:19:54 +0100
Received: by gxk21 with SMTP id 21so3052627gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 13:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:x-rim-org-msg-ref-id
	:message-id:content-transfer-encoding:reply-to:x-priority:references
	:in-reply-to:sensitivity:importance:subject:to:from:date
	:content-type:mime-version;
	bh=3zJX6zNCsbr539Kiyez6ayr94llzUjEik1Qfs58XytY=;
	b=ImOnzMGIH3t4hI178i9dXfcT/JlM9Klo0NF0aph13Y/sX2vtwpme89lBuCG4Ihdzcb
	o9nMg75wuoTtOJbG0h0+q7cCZ9EFlc5JkhwJbfNuTVqNHoAWY2R1NkuZhnD/m7kzVb2x
	aVdr/bTyZ9sj6+p8hCQ2kXOUoJ6G+qcmSbifM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=x-rim-org-msg-ref-id:message-id:content-transfer-encoding:reply-to
	:x-priority:references:in-reply-to:sensitivity:importance:subject:to
	:from:date:content-type:mime-version;
	b=PUU0E9Dt2MIFOCTnFohw8Q6YYi/8wzdDnJg3uktURH3L7ku26/CdflovFKHjIx6dFZ
	WnxSveOfS/gPoDM2gjEIRW1zOIHsDzINTdqIG6cJ4YMfxdBXPyK75Ed++mFuMzniqweC
	OmGeDObOz1qIndk/zKdVOWVP70232yAYsL6bk=
Received: by 10.150.177.9 with SMTP id z9mr3617702ybe.148.1292102295472;
	Sat, 11 Dec 2010 13:18:15 -0800 (PST)
Received: from bda228.bisx.prod.on.blackberry
	(bda-67-223-82-40.bise.na.blackberry.com [67.223.82.40])
	by mx.google.com with ESMTPS id u10sm1357769yba.1.2010.12.11.13.18.13
	(version=SSLv3 cipher=RC4-MD5); Sat, 11 Dec 2010 13:18:14 -0800 (PST)
X-rim-org-msg-ref-id: 1605966256
Message-ID: <1605966256-1292102291-cardhu_decombobulator_blackberry.rim.net-1937449162-@bda2712.bisx.prod.on.blackberry>
X-Priority: Normal
References: <mailman.3252.1292097260.24873.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.3252.1292097260.24873.openembedded-devel@lists.openembedded.org>
Sensitivity: Normal
Importance: Normal
To: openembedded-devel@lists.openembedded.org
From: ka6sox@gmail.com
Date: Sat, 11 Dec 2010 21:12:22 +0000
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: ka6sox@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,MIME_BASE64_TEXT,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openembedded-devel Digest, Vol 53, Issue 57
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
X-List-Received-Date: Sat, 11 Dec 2010 21:19:54 -0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="Windows-1252"

SSBzdXBwb3J0IHRoaXMgcHJvcG9zYWwuICAgVG9tDQpTZW50IGZyb20gbXkgQmxhY2tCZXJyea4g
c21hcnRwaG9uZSB3aXRoIE5leHRlbCBEaXJlY3QgQ29ubmVjdA0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsLXJlcXVlc3RAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KU2VuZGVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQpEYXRlOiBTYXQsIDExIERlYyAyMDEwIDIwOjU0OjIwIA0KVG86IDxvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClJlcGx5LVRvOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogT3BlbmVtYmVkZGVk
LWRldmVsIERpZ2VzdCwgVm9sIDUzLCBJc3N1ZSA1Nw0KDQpTZW5kIE9wZW5lbWJlZGRlZC1kZXZl
bCBtYWlsaW5nIGxpc3Qgc3VibWlzc2lvbnMgdG8NCglvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KDQpUbyBzdWJzY3JpYmUgb3IgdW5zdWJzY3JpYmUgdmlhIHRoZSBX
b3JsZCBXaWRlIFdlYiwgdmlzaXQNCglodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmlu
L21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRldmVsDQoNCm9yLCB2aWEgZW1haWwsIHNl
bmQgYSBtZXNzYWdlIHdpdGggc3ViamVjdCBvciBib2R5ICdoZWxwJyB0bw0KCW9wZW5lbWJlZGRl
ZC1kZXZlbC1yZXF1ZXN0QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCg0KWW91IGNhbiByZWFjaCB0
aGUgcGVyc29uIG1hbmFnaW5nIHRoZSBsaXN0IGF0DQoJb3BlbmVtYmVkZGVkLWRldmVsLW93bmVy
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCg0KV2hlbiByZXBseWluZywgcGxlYXNlIGVkaXQgeW91
ciBTdWJqZWN0IGxpbmUgc28gaXQgaXMgbW9yZSBzcGVjaWZpYw0KdGhhbiAiUmU6IENvbnRlbnRz
IG9mIE9wZW5lbWJlZGRlZC1kZXZlbCBkaWdlc3QuLi4iDQoNCg==



