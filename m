Return-Path: <lukas.weiss@janitza.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D60C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:47:45 +0000 (UTC)
Subject: Re: Problems adding cppzmq to Target-SDK
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?THVrYXMgV2Vpw58=?= <lukas.weiss@janitza.de>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (77.181.222.46)
X-Originating-Platform: Linux Chrome 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 07:47:42 -0700
References: <wUYw.1741172173148394856.1XeG@lists.openembedded.org>
In-Reply-To: <wUYw.1741172173148394856.1XeG@lists.openembedded.org>
Message-ID: <17040.1741963662509012296@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="FnGb7XzHuxLkUKIoLhhy"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 14:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115985

--FnGb7XzHuxLkUKIoLhhy
Content-Type: multipart/alternative; boundary="BalulmBhKx7IKbt9nQc1"

--BalulmBhKx7IKbt9nQc1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I found a solution, this is a problem in recipe. Patch is attached.

--BalulmBhKx7IKbt9nQc1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I found a solution, this is a problem in recipe. Patch is attached.</d=
iv>
<div>&nbsp;</div>

--BalulmBhKx7IKbt9nQc1--

--FnGb7XzHuxLkUKIoLhhy
Content-Type: text/x-patch; name="cppzmq.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="cppzmq.patch"

ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvemVyb21xL2NwcHptcV80
LjEwLjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3plcm9tcS9jcHB6bXFfNC4x
MC4wLmJiCmluZGV4IGRjZWEzMzlkZmQuLmQ1NzMyZTA0MWUgMTAwNjQ0Ci0tLSBhL21ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkvemVyb21xL2NwcHptcV80LjEwLjAuYmIKKysrIGIvbWV0YS1v
ZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS96ZXJvbXEvY3Bwem1xXzQuMTAuMC5iYgpAQCAtMTQsNyAr
MTQsNyBAQCBpbmhlcml0IGNtYWtlCiAKIEVYVFJBX09FQ01BS0UgPSAiLURDUFBaTVFfQlVJTERf
VEVTVFM9T0ZGIgogCi1QQUNLQUdFUyA9ICIke1BOfS1kZXYiCitBTExPV19FTVBUWToke1BOfSA9
ICIxIgogCiBSREVQRU5EUzoke1BOfS1kZXYgPSAiemVyb21xLWRldiB6ZXJvbXEtc3RhdGljZGV2
IgogREVWX1BLR19ERVBFTkRFTkNZID0gIiIK

--FnGb7XzHuxLkUKIoLhhy--

