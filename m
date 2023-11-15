Return-Path: <hvdbosch@cybercomm.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FEEC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:10:39 +0000 (UTC)
Subject: Re: [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
To: openembedded-devel@lists.openembedded.org
From: "Hains van den Bosch" <hvdbosch@cybercomm.nl>
X-Originating-Location: Almelo, Overijssel, NL (62.45.109.57)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 03:10:37 -0800
References: <CA+chaQfoVmHQu_b6VajBdgVWkPvyQ_JCbaVQ-P2grWwmaSGhCQ@mail.gmail.com>
In-Reply-To: <CA+chaQfoVmHQu_b6VajBdgVWkPvyQ_JCbaVQ-P2grWwmaSGhCQ@mail.gmail.com>
Message-ID: <17365.1700046637120731117@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bo2V4vKaScrrLBErJftD"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106752

--bo2V4vKaScrrLBErJftD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Uncomment:

EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON" libebml_1.4.4.

https://git.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes=
-mkv/libebml/libebml_1.4.4.bb#n14

Did for me the trick to fix build Gerbera.

--bo2V4vKaScrrLBErJftD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Uncomment:<br /><br />
<pre><code></code></pre>
<pre><span class=3D"nv">EXTRA_OECMAKE</span> <span class=3D"o">=3D</span> <=
span class=3D"s2">"-DBUILD_SHARED_LIBS=3DON"</span></pre>
<pre><code></code></pre>
libebml_1.4.4.<br /><br />https://git.openembedded.org/meta-openembedded/tr=
ee/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb#n14<br /><br />Did =
for me the trick to fix build Gerbera.

--bo2V4vKaScrrLBErJftD--

