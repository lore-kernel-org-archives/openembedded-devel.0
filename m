Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EF5C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 07:30:04 +0000 (UTC)
Subject: Re: [meta-networking][PATCH] conntrack-tools: fix postinst script
To: openembedded-devel@lists.openembedded.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 May 2022 00:30:03 -0700
References: <20220510032454.16919-1-kai.kang@windriver.com>
In-Reply-To: <20220510032454.16919-1-kai.kang@windriver.com>
Message-ID: <28275.1652859003026314844@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 07:30:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97156

Hi,

Can we please have this patch backported to the kirkstone branch ASAP since=
 builds including this package are currently broken?

Cheers,
Diego Sueiro

