Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F4210F2842
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:23:52 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75102.1774625021434932568
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=Dvk6LiJp;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout10.t-online.de (Postfix) with SMTP id 22CC538040;
	Fri, 27 Mar 2026 16:23:39 +0100 (CET)
Received: from [192.168.178.63] ([84.154.173.111]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6920-4cgaK80; Fri, 27 Mar 2026 16:23:29 +0100
Date: Fri, 27 Mar 2026 16:23:22 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] luajit: update license checksum
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <YEDKCT.5N3FQ6NVVA0V3@t-online.de>
In-Reply-To: <CAMKF1soZfzETRqqzuWE5pM0UaHe11+XbgNLkWJKfshYZ_QKu-A@mail.gmail.com>
References: <20260326195119.2018455-1-f_l_k@t-online.de>
	<CAMKF1soZfzETRqqzuWE5pM0UaHe11+XbgNLkWJKfshYZ_QKu-A@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wQtnR71HC3BEz4ed9FbL"
X-TOI-EXPURGATEID: 150726::1774625009-6EFFA92B-21315581/0/0 CLEAN NORMAL
X-TOI-MSGID: 5fc7565c-79c7-446f-a825-83774be5be27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774625019; i=f_l_k@t-online.de;
	bh=PkhcWnco/lndOrB+EykmtdAagTmfgNQVfM++SPfdlDg=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=Dvk6LiJpRIr0wuOcMXtjYIvdxwbmo9/GnnWVJ749e7NhkyCnf5GB3/xLKN43zZuZ6
	 joKEJyiNbiHBFGKbvbXra9qO/4Yg/k1tZCLB3t/evmsUtghQ6vEQFc9NfUxqJllR5J
	 Z8OeBibznFCRg3NFWwv0rq4WmuuOCcd6JZpFZdwG/b21FA0iRkj4yk3XpvEYVqMp4e
	 HekBg7BB2GVL2bAYcPPv0nE0u5mcbLnNOcuFZQIx9JHFMmHFzMlBVzfVoUPKJCjP+V
	 2u2nmfQpRSdnXM12qK4hAhenxlGxRJP/pHJb0vrOtCVRLZsgSfANo4Ek5cRSYkr8a2
	 bRta2RCRm/zkQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 15:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125789

--=-wQtnR71HC3BEz4ed9FbL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Yes, sorry, my bad

Am Do, 26. M=C3=A4r 2026 um 16:01:14 -07:00:00 schrieb Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>:
>=20
>=20
> On Thu, Mar 26, 2026 at 12:51=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> - copyright year has been changed
>>=20
>=20
> isn't it already addressed in master via
> <https://git.openembedded.org/meta-openembedded/commit/?id=3D92fa6c0f86f4=
bda6d0b2529fa035032d025baea2>
>=20
>> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta-oe/recipes-devtools/luajit/luajit_git.bb=20
>> <http://luajit_git.bb/> | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>>  diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb=20
>> <http://luajit_git.bb/>=20
>> b/meta-oe/recipes-devtools/luajit/luajit_git.bb=20
>> <http://luajit_git.bb/>
>>  index 9cd97ad381..9873ed6f05 100644
>>  --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb=20
>> <http://luajit_git.bb/>
>>  +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb=20
>> <http://luajit_git.bb/>
>>  @@ -1,6 +1,6 @@
>>   SUMMARY =3D "Just-In-Time Compiler for Lua"
>>   LICENSE =3D "MIT"
>>  -LIC_FILES_CHKSUM =3D=20
>> "file://COPYRIGHT;md5=3Dd421a5e2a24207f5e260537399a9a38b"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0ae59ff3"
>>   HOMEPAGE =3D "http://luajit.org <http://luajit.org/>"
>>=20
>>   SRC_URI =3D=20
>> "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3Dv2.1=20
>> <http://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3Dv2.1> \
>>  --
>>  2.53.0
>>=20
>>=20
>>=20
>>=20


--=-wQtnR71HC3BEz4ed9FbL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Yes, sorry, my bad</div><div id=3D"gear=
y-quote" dir=3D"auto"><br>Am Do, 26. M=C3=A4r 2026 um 16:01:14 -07:00:00 sc=
hrieb Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lists.op=
enembedded.org&gt;:<br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2026 at 12:51=E2=80=AFPM=
 Markus Volk via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org=
">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">- copyright year has been changed<br>
<br></blockquote><div><br></div><div>isn't it already addressed in master v=
ia</div><div><a href=3D"https://git.openembedded.org/meta-openembedded/comm=
it/?id=3D92fa6c0f86f4bda6d0b2529fa035032d025baea2">https://git.openembedded=
.org/meta-openembedded/commit/?id=3D92fa6c0f86f4bda6d0b2529fa035032d025baea=
2</a></div><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a> | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.b=
b" rel=3D"noreferrer" target=3D"_blank">luajit_git.bb</a> b/meta-oe/recipes=
-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=3D"noreferrer" target=
=3D"_blank">luajit_git.bb</a><br>
index 9cd97ad381..9873ed6f05 100644<br>
--- a/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_git.bb" rel=
=3D"noreferrer" target=3D"_blank">luajit_git.bb</a><br>
@@ -1,6 +1,6 @@<br>
&nbsp;SUMMARY =3D "Just-In-Time Compiler for Lua"<br>
&nbsp;LICENSE =3D "MIT"<br>
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd421a5e2a24207f5e260537399a9a=
38b"<br>
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Da2c43bf4a9ea63755af2131b0ae59=
ff3"<br>
&nbsp;HOMEPAGE =3D "<a href=3D"http://luajit.org" rel=3D"noreferrer" target=
=3D"_blank">http://luajit.org</a>"<br>
<br>
&nbsp;SRC_URI =3D "git://<a href=3D"http://luajit.org/git/luajit-2.0.git;pr=
otocol=3Dhttp;branch=3Dv2.1" rel=3D"noreferrer" target=3D"_blank">luajit.or=
g/git/luajit-2.0.git;protocol=3Dhttp;branch=3Dv2.1</a> \<br>
-- <br>
2.53.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>
--=-wQtnR71HC3BEz4ed9FbL--


