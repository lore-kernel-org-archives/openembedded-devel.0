Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10F8CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:10:30 +0000 (UTC)
Subject: Re: [meta-filesystems][PATCH 1/7] Add static-passwd and static-group files
To: openembedded-devel@lists.openembedded.org
From: "Fabien Thomas" <fabien.thomas@smile.fr>
X-Originating-Location: Nantes, Pays de la Loire, FR (90.105.215.10)
X-Originating-Platform: Linux Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 13 Oct 2023 07:10:23 -0700
References: <da8698d9-a595-4ec0-84f9-23ecceb22b9d@gmail.com>
In-Reply-To: <da8698d9-a595-4ec0-84f9-23ecceb22b9d@gmail.com>
Message-ID: <7536.1697206223401954397@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qx81D0H0mLfmq87l0JEe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 14:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105471

--qx81D0H0mLfmq87l0JEe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 02:01 PM, Vyacheslav Yurkov wrote:

>=20
> Slava

Hello,

This work is intended to be carried out by yocto autobuilder several
time a day, in reproducible-meta-oe selftest. If someone add a
new user or group in a recipe and forget to update theses static-ids
files : the repro build will failed. This ensure an early detection.

Regards,
Fabien

--qx81D0H0mLfmq87l0JEe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 02:01 PM, Vyacheslav Yurkov wrote:<br />
<blockquote>Slava</blockquote>
<p>Hello,</p>
<p>This work is intended to be carried out by yocto autobuilder several<br =
/>time a day, in reproducible-meta-oe selftest. If someone add a<br />new u=
ser or group in a recipe and forget to update theses static-ids<br />files =
: the repro build will failed. This ensure an early detection.</p>
<p>Regards,<br />Fabien</p>
<p>&nbsp;</p>

--qx81D0H0mLfmq87l0JEe--

