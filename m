Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NcneP-0008NN-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 23:24:48 +0100
Received: by yxe1 with SMTP id 1so1707839yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 14:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=3WvLLh1agMqhgUgeBkVWV6xQqdV4NAWejPeDuPVWb6I=;
	b=q6wkkbcleAQIogQYb8Y4c1NNbEUQFbfiBqFwgzK9nIoxbL1cLdD55rMZtVQemqSWgF
	PLmcdnKtIpgKx6dauML7i33gpwgiWej4SCJ1LVj538jKE8tLdO2/99vzrMdkcdEwrItW
	R6ZC/eZGvGPDTynkzTo8GSlXJid3EZdZDkXyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j7dzcsLhHV8HGE8fVKeuwWME3leoeXCtJxUNkuVl+I1CPT4fA8dZ7zDUqVrxPeZEpY
	1KP/HA62ketCVzwH5PXUJOtDkS80UzITMfVa3al3Iu30zgI/zQfcYHtbj+AcavYF5LLR
	ZSekirwKFnK0vWQ4ChpVBtu8sOMVvKNzdJ/Vg=
MIME-Version: 1.0
Received: by 10.101.164.26 with SMTP id r26mr294120ano.162.1265235736527; Wed, 
	03 Feb 2010 14:22:16 -0800 (PST)
In-Reply-To: <1265189276.5591.40.camel@mattotaupa>
References: <1265189276.5591.40.camel@mattotaupa>
Date: Wed, 3 Feb 2010 23:22:16 +0100
Message-ID: <ac9c93b11002031422t18df39f6m77de57c50241227@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IEFzdXMgRWVlIFBDIDcwMSA0RywgcGVyZm9ybWFuY2UgYW5kIGluY2x1c2lvbiBpbnRvIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Wed, 03 Feb 2010 22:24:48 -0000
X-Groupsio-MsgNum: 16444
Content-Type: multipart/mixed; boundary=0016e68edb58a203c7047eb9a67c

--0016e68edb58a203c7047eb9a67c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/3 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear Denis and OE developers,
>
>
> Denis committed support for Asus Eee PC 701 4G [2] some days ago [1].
>
> 1. Denis, could tell us something about the performance of OE on this
> netbook compared to the distribution you ran on there before.
>
> 2. Is it possible to include this machine in the =C5ngstr=F6m online buil=
der
> [3]?
>

Here is a patch for narcissus
Sorry that it is an attachment but had to beat gmails line wrapping.

Koen, can you review and apply if ok?

Thanks, Frans. (who is happy as he now has a purpose for his eeepc again)

--0016e68edb58a203c7047eb9a67c
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0002-eee701-added-machine-description-for-eeepc-701.patch"
Content-Disposition: attachment; 
	filename="0002-eee701-added-machine-description-for-eeepc-701.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g58omeiy1

RnJvbSBmMDFmYzRkMGRkZTUzZDdlZmEyZDM1NzRlMzc5NjgzZTgwMjZhMDAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBmcmFucyA8ZnJhbnNAbGludXgtc3VzZS4obm9uZSk+CkRhdGU6
IFdlZCwgMyBGZWIgMjAxMCAyMzoxNDo1MiArMDEwMApTdWJqZWN0OiBbUEFUQ0ggMi8yXSBlZWU3
MDE6IGFkZGVkIG1hY2hpbmUgZGVzY3JpcHRpb24gZm9yIGVlZXBjIDcwMQoKU2lnbmVkLW9mZi1i
eTogRnJhbnMgTWV1bGVuYnJvZWtzIDxmcmFuc21ldWxlbmJyb2Vrc0BnbWFpbC5jb20+Ci0tLQog
Y29uZi9lZWU3MDEvYXJjaC5jb25mICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5
ICsrKysrKysrKwogLi4uL2FuZ3N0cm9tLWZlZWQtY29uZmlnc18xLjAtcjkuNV9lZWU3MDEuaXBr
ICAgICAgfCAgQmluIDAgLT4gMTIyNiBieXRlcwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9lZWU3MDEvYXJj
aC5jb25mCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9lZWU3MDEvbWFjaGluZS1jb25maWcKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBjb25mL2VlZTcwMS91bnN0YWJsZS9hbmdzdHJvbS1mZWVkLWNvbmZp
Z3NfMS4wLXI5LjVfZWVlNzAxLmlwawoKZGlmZiAtLWdpdCBhL2NvbmYvZWVlNzAxL2FyY2guY29u
ZiBiL2NvbmYvZWVlNzAxL2FyY2guY29uZgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwLi43MzgxNzUzCi0tLSAvZGV2L251bGwKKysrIGIvY29uZi9lZWU3MDEvYXJjaC5jb25mCkBA
IC0wLDAgKzEsOSBAQAorYXJjaCBhbGwgMQorYXJjaCBhbnkgNgorYXJjaCBub2FyY2ggMTEKK2Fy
Y2ggaTY4NiAxNgorYXJjaCB4ODYgMjEKK2FyY2ggaTM4NiAyNgorYXJjaCBpNDg2IDMxCithcmNo
IGk1ODYgMzYKK2FyY2ggZWVlNzAxIDQxCmRpZmYgLS1naXQgYS9jb25mL2VlZTcwMS9tYWNoaW5l
LWNvbmZpZyBiL2NvbmYvZWVlNzAxL21hY2hpbmUtY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAuLmU2OWRlMjkKZGlmZiAtLWdpdCBhL2NvbmYvZWVlNzAxL3Vuc3RhYmxl
L2FuZ3N0cm9tLWZlZWQtY29uZmlnc18xLjAtcjkuNV9lZWU3MDEuaXBrIGIvY29uZi9lZWU3MDEv
dW5zdGFibGUvYW5nc3Ryb20tZmVlZC1jb25maWdzXzEuMC1yOS41X2VlZTcwMS5pcGsKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uNjM1ODQ5ZTI3ODUyZGRmZGYxYjgxYjY1OTEyOGQ5ZGYzZDI0MWIxMgpHSVQgYmluYXJ5
IHBhdGNoCmxpdGVyYWwgMTIyNgp6Y21ZJGlOaTBndnU7V1RlUDBDRW4oQG8wRU9Edzk/UzVQb0NH
QlkoWUdCJnB+MkNAd2Q0OFd1VW1eM3BuUUJWTFAKekNgak5rKGxnKm5OaTBkIURAaVFVT1JvYXpD
YW1BbyMxeVZ5ek1GJWdASTxDSjFNfU5pY1ooSilGdTNofjd5Ti1xCnpRMUhteVQ0fmNPN04oTnxq
YzxOPyQ/YXY8X2p+ZU5vbXAwWSYrJSRWQ1ZlVm9OT3FGYUBre1pUb1Q5PHx4b0N5KQp6dkMxPjgz
Nm99aSZYaWlwPXM5aXc3NnBzKStHfDJXVGNXPCNTS3I8SHR5ZGBNc3lLSWxCbWF+MGtFZ0g7Y0RN
TFUKel8lR0ctXll2eCNvcCUmfFJRJlRmYS12PlQ/UHEjIUFxViRlbzhOVygoaT1uYF81VT4xJT0+
eHolOUhjU1hgbExRCno7IW5LKUAjeUY2MyFZKXVUV291O0tBVT1DPEU8QTk2VkAlQWJZQ1RMLVBg
dCskRkg7SEB5OXI7bz8rYS1QMzdCeAp6dHJ8LSZicUY0dUMtLTtlIVFSZ1FzbkBxX1MrNlNselVJ
b2skMzZ3dT4tRXpBc3EzVkVzT1IwYVpOWEZOcEVHU08Kenp4O2heeT4kOSUpaVlBblFTIy0jUGZa
RH1kIzhRM1d0WitzU3Bge0peSmx3SFhTPVN4JSZxJWNPTWteJmx7e3c3CnpXJVg1UnxLNWt6PkRC
SmUtfSQ9VT02bjFScTFYU2xFZElCQHNvaH47IXQmbnlAUjkjRXVkZkxHYHJyS2peV1hnbQp6LUBl
UUwqbCU7TGUpZUFlenEkNHM+WWFXNSRpTSRDSGlQbHFafjYwbyNoSmpHclQwcWJVSFlIVHdJREx+
QElQT30KemtOPn5pa312dHBAeFJqS3lNM2F9eng5b3U+KEFVZiZYQDNwYk1wYlc4TmIld2BnUXJ1
ZjZIKEdSfkxNfXBZcn1fCnotRFVuZV9YVUxpQTc/a3xrTkFJN3xNbVhBKGowJXs4SzNYM3dzQFkl
V3w0TXVWYiZDQi14PUh0SUtoViMqNnw1Pwp6JmxtejI3YFQlMl5HYl5IYktuViNWQ3VCNno/UWx1
LXx3R2RBYUswJFVIcnYqMkNoeEpVNk9qbCZtVXAkNzEjZmAKemNTPldmbkFIOzlTQVZ+NlRUYHdr
e3E3eTd7O3s3YjBXPFBuQF9iZW5LS2JsUFc3aHVvWVhfZTB2SnJRVSteMUUoCnpgJXdUKGI/RFIz
TCpIKz1QZ0J8YWBCS3JtMiQlbT9fQzVibktnQ0RHPGxkdFYzO1FEOzlNMWNtQHQ2TzFfcGtRcAp6
aStuMmZDSG5DSGRIIXwoIzgpY1NEfFZYZjwqcWVZQ2hJVn1aUHw7R19jelFwXyReKnBJcX5WcitQ
UUNVbnAmaU8KemVJb3cpY2sxbiYpUzlQcjxxbXgwKHsocV9WNkwlfUtkMDtTVnZHQ2dXPENFJj8o
JShpbzI9dzdkJDdNYl9HLWh5CnpgJlZWQVV3KFNQJk81aGUkQU4ycVVYfERVaz1sMi1BKCozUWU8
akRSdEEpT3xTTTI1OV9rNnh3Xl9kSWJAXjdsSQp6SitSfExfaHc3VUtaIVN7aFB1Q1B7KE9eN248
MXB+O0olcyk5ZGBNYG1kdWtFfDEhb3FLRDIxY2pPRj11V2pXaCMKeiYzampLKnZxOyVoYkVUJHhh
K285dzdxdnRVc31sSSptOG9taGopd2FtUDFYS2dlP2wrTjMzejFWOUktWSl4WG4hCnolRHRhJUVC
ZzU2JnZlJlAlbTN8anA4YTMxYTZudElJXnV8OCVxX2ljKkBPUSRiV011KXVXQ2AweHo9aTNAM0w5
egp0PXN6fmdycjZOKWhqKGE2UEQjdVFVI2MtRFNBVld3bEw3fThSM1RXJF8mTE5gZkkpK1MwUlJt
b0dNeFliCgpsaXRlcmFsIDAKSGNtVj9kMDAwMDEKCi0tIAoxLjYuNC4yCgo=

--0016e68edb58a203c7047eb9a67c--
