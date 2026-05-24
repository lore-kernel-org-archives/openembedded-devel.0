Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BBACD4F54
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 06:58:38 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: Bengaluru, Karnataka, IN (49.207.60.219)
X-Originating-Platform: Linux Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 23 May 2026 23:58:36 -0700
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com> <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org> <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com> <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM> <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com> <1575450.1778745762950591364@lists.openembedded.org> <1575450.1778840626136865406@lists.openembedded.org> <1824db6e-eded-4f5f-8626-c74406ef2670@gmail.com> <CAMKF1srFmVDNF=f2aU1SEYFv5MGXgZGOYc9150HDuBeTJg1V8g@mail.gmail.com> <1690109.1779097786262242307@lists.openembedded.org> <2251952.1779175643922816455@lists.openembedded.org> <2273658.1779287978782701878@lists.openembedded.org> <CAMKF1spFueVnbh9+dZOpxxZ-Rw3qFFsXLBkfiNwj7YGvDX=4jA@mail.gmail.com> <PN0P287MB03588FFCC9D4427C084EE601890E2@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN0P287MB03588FFCC9D4427C084EE601890E2@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
Message-ID: <1785914.1779605916404291489@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yaJXZLpfFodiZpAJpZeZ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 06:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127184

--yaJXZLpfFodiZpAJpZeZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem / Gyorgy / Team ,

Good Morning

Shared the RFC-v4 with fix for the clang build error shared above.
Cover-Letter:
https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_=
0_4/119463944

Patches :
https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_=
1_4/119463946
https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_=
2_4/119463947
https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_=
3_4/119463948
https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_=
4_4/119463949

Local build test was done using qemuarm64 + GCC & qemuarm64 + clang

Request team to please consider for merge

Thanks ,
Ashish

--yaJXZLpfFodiZpAJpZeZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem / Gyorgy / Team ,&nbsp;</div>
<div><br />Good Morning&nbsp;<br /><br />Shared the RFC-v4 with fix for the=
 clang build error shared above.<br />Cover-Letter:<br /><a href=3D"https:/=
/lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_0_4/119=
463944" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g=
/openembedded-devel/topic/meta_oe_patch_v4_0_4/119463944</a>&nbsp;</div>
<div><br />Patches :<br /><a href=3D"https://lists.openembedded.org/g/opene=
mbedded-devel/topic/meta_oe_patch_v4_1_4/119463946" target=3D"_blank" rel=
=3D"noopener">https://lists.openembedded.org/g/openembedded-devel/topic/met=
a_oe_patch_v4_1_4/119463946</a>&nbsp;<br /><a href=3D"https://lists.openemb=
edded.org/g/openembedded-devel/topic/meta_oe_patch_v4_2_4/119463947" target=
=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-=
devel/topic/meta_oe_patch_v4_2_4/119463947</a>&nbsp;<br /><a href=3D"https:=
//lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_3_4/11=
9463948" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/=
g/openembedded-devel/topic/meta_oe_patch_v4_3_4/119463948</a>&nbsp;<br /><a=
 href=3D"https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_=
patch_v4_4_4/119463949" target=3D"_blank" rel=3D"noopener">https://lists.op=
enembedded.org/g/openembedded-devel/topic/meta_oe_patch_v4_4_4/119463949</a=
>&nbsp;<br /><br />Local build test was done using qemuarm64 + GCC &amp; qe=
muarm64 + clang&nbsp;<br /><br />Request team to please consider for merge&=
nbsp;<br /><br />Thanks ,<br />Ashish&nbsp;<br /><br /></div>
<div>&nbsp;</div>

--yaJXZLpfFodiZpAJpZeZ--

