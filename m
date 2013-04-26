Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1UVgBG-0008Kx-8k
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 12:47:14 +0200
Received: by mail-vc0-f177.google.com with SMTP id gf12so1491186vcb.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=VN1XfLWVqQ4s52O2UNQM/rxd4ZjmbXh9e1mxLOrMTNE=;
	b=cL9UovGQ4yGaqfrDlkrfA53xyklVi6DlpaMv+hZ6RXMCMo0tdoD/KrETxmnRn7xqJx
	2q7Ce0HYkhO7gbjHZEmhIxH6SBkDsOJ7+LnxhRU0ovrDyUN/67K09z3sozGhmyC814uI
	UbJJn0/RHF6W9/+Fxp/fV6hnduJyy9l4VUuck904dod23Uayw6dN4e4rFqoO4Dxvlm3J
	AYhcY4IM5fLwYnHFYWI3UKi8QstnTdanReKM/5Kb86ZSBBQYb0//atYL+fFhOUE+LGz9
	IRqspSanfDVsx7GZBInr/g/4D7zPCtOJmiE81XnDbYDcLMss177obXRmrHQ+tgfMMQXO
	tJ+w==
MIME-Version: 1.0
X-Received: by 10.52.22.202 with SMTP id g10mr24191712vdf.126.1366972161334;
	Fri, 26 Apr 2013 03:29:21 -0700 (PDT)
Received: by 10.59.7.197 with HTTP; Fri, 26 Apr 2013 03:29:21 -0700 (PDT)
Date: Fri, 26 Apr 2013 11:29:21 +0100
Message-ID: <CAPhDKbFrn7ZgfXT05so7YhBus7PP45W1YafYduCg_TZwzskW+g@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [meta-oe][PATCH] python-requests: add version 1.2.0
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
X-List-Received-Date: Fri, 26 Apr 2013 10:47:44 -0000
X-Groupsio-MsgNum: 44434
Content-Type: multipart/mixed; boundary=20cf3079b6ea18253104db410264

--20cf3079b6ea18253104db410264
Content-Type: text/plain; charset=ISO-8859-1

This is what I have submitted earlier (
https://github.com/openembedded/meta-oe/pull/12)

Cheers,
-- 
Ilya

--20cf3079b6ea18253104db410264
Content-Type: application/octet-stream; 
	name="0001-python-requests-add-version-1.2.0.patch"
Content-Disposition: attachment; 
	filename="0001-python-requests-add-version-1.2.0.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hfz7x6ol0

RnJvbSA3NDI4ZTAyNDlhYWEyNGRmYTUzMjE1OTBhNDg0OWJkMjdjMjdmNWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBJbHlhIERtaXRyaWNoZW5rbyA8aWx5YS5kbWl0cmljaGVua29A
Y29zbS5jb20+CkRhdGU6IFdlZCwgMjQgQXByIDIwMTMgMTk6MzY6MDUgKzAxMDAKU3ViamVjdDog
W1BBVENIXSBweXRob24tcmVxdWVzdHM6IGFkZCB2ZXJzaW9uIDEuMi4wCgotLS0KIC4uLi9weXRo
b24vcHl0aG9uLXJlcXVlc3RzXzEuMi4wLmJiICAgICAgICAgICAgICAgIHwgICAzMSArKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAwIGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXJlcXVlc3RzXzEuMi4wLmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVxdWVzdHNfMS4yLjAuYmIgYi9tZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1yZXF1ZXN0c18xLjIuMC5iYgpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwLi4xNjI0ODg0Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVxdWVzdHNfMS4yLjAuYmIKQEAgLTAs
MCArMSwzMSBAQAorREVTQ1JJUFRJT04gPSAiUmVxdWVzdHM6IEhUVFAgZm9yIEh1bWFucyIKK0hP
TUVQQUdFID0gImh0dHA6Ly9kb2NzLnB5dGhvbi1yZXF1ZXN0cy5vcmcvZW4vbGF0ZXN0LyIKK1NF
Q1RJT04gPSAiZGV2ZWwvcHl0aG9uIgorTElDRU5TRSA9ICJBcGFjaGUtMi4wIgorCitSREVQRU5E
U18ke1BOfSA9ICJweXRob24iCitQUiA9ICJyMCIKKworU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2tlbm5ldGhyZWl0ei9yZXF1ZXN0cztwcm90b2NvbD1naXQiCisKK1MgPSAiJHtXT1JLRElS
fS9naXQvIgorCitTUkNSRVYgPSAidiR7UFZ9IgorCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9SRUFETUUucnN0O21kNT03NGM3NWIxY2E3OTMyZmZiNTRkYzJkM2QxODVkODgwMyBcCisgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9OT1RJQ0U7bWQ1PWE3ZmNmMWRjMmQxM2Y0YzFlOTAxNTY0
NzExMjQ0ZmI0IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0U7bWQ1PWM4NTg3
MDMzMzAxNjJhYTc5OTE0MTY1NWExMGZlMTIwIgorCitpbmhlcml0IHNldHVwdG9vbHMKKworIyBu
ZWVkIHRvIGV4cG9ydCB0aGVzZSB2YXJpYWJsZXMgZm9yIHB5dGhvbi1jb25maWcgdG8gd29yawor
ZXhwb3J0IEJVSUxEX1NZUworZXhwb3J0IEhPU1RfU1lTCitleHBvcnQgU1RBR0lOR19JTkNESVIK
K2V4cG9ydCBTVEFHSU5HX0xJQkRJUgorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIKKworZG9f
aW5zdGFsbF9hcHBlbmQoKSB7CisgIHJtIC1mICR7RH0ke2xpYmRpcn0vcHl0aG9uKi9zaXRlLXBh
Y2thZ2VzL3NpdGUucHkqCit9Ci0tIAoxLjcuNS40Cgo=

--20cf3079b6ea18253104db410264--
