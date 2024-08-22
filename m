Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5BAC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:00 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] meta-oe:drgn: add new recipe
To: openembedded-devel@lists.openembedded.org
From: "Jamin Lin" <jamin_lin@aspeedtech.com>
X-Originating-Location: Daan, Taipei City, TW (118.99.190.129)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Aug 2024 02:34:55 -0700
References: <CAMKF1spTFR5anMr8isUP+r1XJSj5xYe-c=CVSGv0nVwhJBcVAQ@mail.gmail.com>
In-Reply-To: <CAMKF1spTFR5anMr8isUP+r1XJSj5xYe-c=CVSGv0nVwhJBcVAQ@mail.gmail.com>
Message-ID: <15565.1724319295215158162@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ImBLxS68f5PMK1PO2Rbq"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111902

--ImBLxS68f5PMK1PO2Rbq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for review.

Sorry for lost to test Yoe DISTRO Features about clang toolchain.

I re-send v2 patch to fix it.

Drgn depends on:

openmp

a. clang toolchain should use libomp(openmp) from meta-clang b. gnu gcc too=
lchain should use libgomp(gcc-runtime) from openembedded-core

Thanks-Jamin

--ImBLxS68f5PMK1PO2Rbq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks for review.</span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Sorry for lost to test Yoe D=
ISTRO Features about clang toolchain.</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I re-send v2 patch to fix it=
.</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Drgn depends on:</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">openmp</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">a. clang toolchain should us=
e libomp(openmp) from meta-clang b. gnu gcc toolchain should use libgomp(gc=
c-runtime) from openembedded-core</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks-Jamin</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;</span></p>
</div>

--ImBLxS68f5PMK1PO2Rbq--

