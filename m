Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E89BC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 23:18:07 +0000 (UTC)
Subject: Re: coreutils over uutils-coreutils when selinux in DISTRO_FEATURES
To: openembedded-devel@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: RO (146.70.198.35)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 31 Dec 2023 15:18:06 -0800
References: <0nJP.1703986158117153552.ibjv@lists.openembedded.org>
In-Reply-To: <0nJP.1703986158117153552.ibjv@lists.openembedded.org>
Message-ID: <16462.1704064686810817972@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1QWPmXTJ3paPsRHtVdKQ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 23:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107976

--1QWPmXTJ3paPsRHtVdKQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello for future readers,

Issue with target system not containing coreutils was fixed via

SKIP_RECIPE[uutils-coreutils] =3D "Don't build this"

IMAGE_INSTALL:append =3D " packagegroup-selinux-minimal"

--1QWPmXTJ3paPsRHtVdKQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello for future readers,</p>
<p>Issue with target system not containing coreutils was fixed via</p>
<p>SKIP_RECIPE[uutils-coreutils] =3D "Don't build this"</p>
<p>IMAGE_INSTALL:append =3D " packagegroup-selinux-minimal"</p>

--1QWPmXTJ3paPsRHtVdKQ--

