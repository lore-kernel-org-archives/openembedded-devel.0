Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC6C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 14:06:30 +0000 (UTC)
Subject: Re: [meta-networking][PATCH] ntp: drop the deprecated ntpdate
To: openembedded-devel@lists.openembedded.org
From: "Michal Sieron" <michalwsieron@gmail.com>
X-Originating-Location: Frankfurt am Main, Hesse, DE (136.226.162.169)
X-Originating-Platform: Linux Edge 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 07:06:28 -0700
References: <20230316033356.2199649-1-zhixiong.chi@windriver.com>
In-Reply-To: <20230316033356.2199649-1-zhixiong.chi@windriver.com>
Message-ID: <1818840.1787148388748094144@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YRD75BooMkbo7A7XtHQk"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 14:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129362

--YRD75BooMkbo7A7XtHQk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I know this is an old topic, but I just noticed that ntpdate is still being=
 built and packaged as part of ntp-utils.
Is this intended, or should we `rm -f ${D}${sbindir}/ntpdate` in do_install=
 (or patch ntpdate subdir out of Makefile.am)?

Br,
Michal

--YRD75BooMkbo7A7XtHQk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I know this is an old topic, but I just noticed that ntpdate is still =
being built and packaged as part of ntp-utils.</div>
<div>Is this intended, or should we `rm -f ${D}${sbindir}/ntpdate` in do_in=
stall (or patch ntpdate subdir out of Makefile.am)?</div>
<div>&nbsp;</div>
<div>Br,</div>
<div>Michal</div>

--YRD75BooMkbo7A7XtHQk--

