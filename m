Return-Path: <daniel.klauer@gin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E884FD376B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 15:52:34 +0000 (UTC)
Subject: Re: [meta-oe][scarthgap][PATCH] nbench-byte: Fix sysinfo generation in parallel build
To: openembedded-devel@lists.openembedded.org
From: "Daniel Klauer" <daniel.klauer@gin.de>
X-Originating-Location: Hilchenbach, North Rhine-Westphalia, DE (62.157.191.2)
X-Originating-Platform: Linux Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 07:52:31 -0800
References: <20260223140204.808434-1-daniel.klauer@gin.de> <CA+s=J=y+U0D51q_6n9FHMKXLb7m4Ub62cAG7ArHe+vzsCnaAvQ@mail.gmail.com>
In-Reply-To: <CA+s=J=y+U0D51q_6n9FHMKXLb7m4Ub62cAG7ArHe+vzsCnaAvQ@mail.gmail.com>
Message-ID: <1061013.1772034751417536619@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 15:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124654

On Wed, Feb 25, 2026 at 05:59 AM, Anuj Mittal wrote:
> Thank you, I've cherry-picked this from master. Would you please send
> a cherry-pick for whinlatter as well so it's not missed there?

Okay, done.

Also, it would be possible to backport to kirkstone. The scarthgap patch sh=
ould apply cleanly to kirkstone too (unlike the master/whinlatter version).

