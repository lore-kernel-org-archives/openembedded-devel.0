Return-Path: <craig.comstock@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550A8C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:59:51 +0000 (UTC)
Subject: Re: [PATCH] cfengine: upgrade to 3.21.0
To: openembedded-devel@lists.openembedded.org
From: craig.comstock@northern.tech
X-Originating-Location: Ashburn, Virginia, US (52.206.213.169)
X-Originating-Platform: Linux Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 20 Feb 2023 08:59:41 -0800
References: <20230217171722.71333-1-craig@unreasonablefarm.org>
In-Reply-To: <20230217171722.71333-1-craig@unreasonablefarm.org>
Message-ID: <18982.1676912381226005214@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5M6Vid0jK2bw54EFWABz"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 16:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101180

--5M6Vid0jK2bw54EFWABz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Apologies. I didn't test this patch with a full build on master as I had be=
en working on hardknott.

I notice now when I build that I should have removed the line

SKIP_RECIPE[cfengine] ?=3D "Needs porting to openssl 3.x"

So am running a build now and will submit a revised patch when things look =
good on master.

--5M6Vid0jK2bw54EFWABz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Apologies. I didn't test this patch with a full build on master as I had be=
en working on hardknott.<br /><br />I notice now when I build that I should=
 have removed the line<br /><br /><span style=3D"white-space: pre-wrap;">SK=
IP_RECIPE[cfengine] ?=3D "Needs porting to openssl 3.x"<br /><br /></span>S=
o am running a build now and will submit a revised patch when things look g=
ood on master.

--5M6Vid0jK2bw54EFWABz--

