Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0C5C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 11:13:34 +0000 (UTC)
Subject: Re: [meta-oe][dunfell][PATCH] c-ares: Fix forgotten PV bump to 1.16.1
To: openembedded-devel@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (49.34.194.147)
X-Originating-Platform: Linux Chrome 97
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 17 Jan 2022 03:13:33 -0800
References: 
 <0173f3da37397b1c9fb379b677310f379fba5fec.camel@lists.verisure.com>
In-Reply-To: 
 <0173f3da37397b1c9fb379b677310f379fba5fec.camel@lists.verisure.com>
Message-ID: <30882.1642418013855401778@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RJz9yRvmzNvshttSGaDt"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 11:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94899

--RJz9yRvmzNvshttSGaDt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I think during https://git.openembedded.org/meta-openembedded-contrib/commi=
t/?h=3Dstable/dunfell-nut&id=3D9ce3df8c2a10b45aa3695cf257aa27fd346d52a7 pat=
ch merge, PV variable is not updated and so CVE-2020-14354 is reported by c=
ve tool. So removing PV can solve this.

I have verified using "bitbake -c cve_check c-ares" and after removing the =
PV variable, cve tool is not reporting CVE-2020-14354 anymore.

Thanks,
Ranjitsinh

--RJz9yRvmzNvshttSGaDt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<br /><br />I think during&nbsp;<a href=3D"https://git.openembedded.=
org/meta-openembedded-contrib/commit/?h=3Dstable/dunfell-nut&amp;id=3D9ce3d=
f8c2a10b45aa3695cf257aa27fd346d52a7" target=3D"_blank" rel=3D"noopener">htt=
ps://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable/dunf=
ell-nut&amp;id=3D9ce3df8c2a10b45aa3695cf257aa27fd346d52a7</a>&nbsp;patch me=
rge, PV variable is not updated and so&nbsp;<span style=3D"font-family: mon=
ospace; font-size: 13.3333px; white-space: pre;">CVE-2020-14354 is reported=
 by cve tool. So removing PV can solve this.<br /><br />I have verified usi=
ng "bitbake -c cve_check c-ares" and after removing the PV variable, cve to=
ol is not reporting </span><span style=3D"font-family: monospace; font-size=
: 13.3333px; white-space: pre;">CVE-2020-14354 anymore.</span><span style=
=3D"font-family: monospace; font-size: 13.3333px; white-space: pre;"><br />=
<br />Thanks,<br />Ranjitsinh</span>

--RJz9yRvmzNvshttSGaDt--

