Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDDDE7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:16:52 +0000 (UTC)
Subject: Re: [meta-oe][PATCH 1/3] Use 7zip 2409 to replace p7zip 16.02
To: openembedded-devel@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 01:16:50 -0800
References: <20241219084758.3809790-1-hongxu.jia@windriver.com>
In-Reply-To: <20241219084758.3809790-1-hongxu.jia@windriver.com>
Message-ID: <13203.1734599810478320016@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tloCZgr64dvw9t7y32ce"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 09:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114384

--tloCZgr64dvw9t7y32ce
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Please drop this

It missed to link 7z.so in bin dir which caused '7z a xxx.7z =C2=A0yyy' fai=
led

V2 incoming
'ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so'

//Hongxu

--tloCZgr64dvw9t7y32ce
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Please drop this</div>
<div>&nbsp;</div>
<div>It missed to link 7z.so in bin dir which caused '7z a xxx.7z &nbsp;yyy=
' failed</div>
<div>&nbsp;</div>
<div>V2 incoming</div>
<div>&nbsp;'ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so'</div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--tloCZgr64dvw9t7y32ce--

