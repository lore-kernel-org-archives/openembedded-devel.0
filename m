Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51612C4829C
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:46:44 +0000 (UTC)
Subject: Re: [meta-oe][kirkstone][PATCH] libcroco: Delete the recipe
To: openembedded-devel@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
X-Originating-Location: US (136.226.233.78)
X-Originating-Platform: Linux Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 Feb 2024 00:46:42 -0800
References: <CDDBBEEB-62E5-49E5-9C40-067A75A2B31E@arm.com>
In-Reply-To: <CDDBBEEB-62E5-49E5-9C40-067A75A2B31E@arm.com>
Message-ID: <17448.1707209202552061251@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2ZGZaj5euQP6xJhGmNoq"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108617

--2ZGZaj5euQP6xJhGmNoq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Actually this recipe is from poky.
The actual recipe is present in poky.
https://git.yoctoproject.org/poky/tree/meta/recipes-support/libcroco/libcro=
co_0.6.13.bb?h=3Dkirkstone

This is I assume added in meta-openembeded by mistake as part of this https=
://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&id=3D5=
22603beb6d88ad6ea443806bb986096d5b766e6 and so we want to delete this dupli=
cate recipe.

We already have enough information in the commit message.

Thanks,
Ranjitsinh Rathod

--2ZGZaj5euQP6xJhGmNoq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,<br /><br />Actually this recipe is from poky.<br /><span style=3D"=
color: #172b4d; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI',=
 Roboto, Oxygen, Ubuntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-=
serif;">The actual recipe is present in poky.</span><br style=3D"color: #17=
2b4d; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, O=
xygen, Ubuntu, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;" />=
<a class=3D"external-link" style=3D"color: #0052cc; cursor: pointer; font-f=
amily: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubunt=
u, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; background-colo=
r: #ffffff;" href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-su=
pport/libcroco/libcroco_0.6.13.bb?h=3Dkirkstone" rel=3D"nofollow">https://g=
it.yoctoproject.org/poky/tree/meta/recipes-support/libcroco/libcroco_0.6.13=
.bb?h=3Dkirkstone</a><br /><br />This is I assume added in meta-openembeded=
 by mistake as part of this <a href=3D"https://git.openembedded.org/meta-op=
enembedded/commit/?h=3Dkirkstone-next&amp;id=3D522603beb6d88ad6ea443806bb98=
6096d5b766e6" target=3D"_blank" rel=3D"noopener">https://git.openembedded.o=
rg/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D522603beb6d88ad6ea=
443806bb986096d5b766e6</a>&nbsp;and so we want to delete this duplicate rec=
ipe.<br /><br />We already have enough information in the commit message.<b=
r /><br />Thanks,<br />Ranjitsinh Rathod

--2ZGZaj5euQP6xJhGmNoq--

