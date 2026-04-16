Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F586F433D4
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 01:14:55 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2791.1776302091229903694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 18:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 3CDB7606D9; Thu, 16 Apr 2026 01:14:49 +0000 (UTC)
Received: from smtpclient.apple (ipservice-092-209-208-070.092.209.pools.vodafone-ip.de [92.209.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 2A4B6606D9;
	Thu, 16 Apr 2026 01:14:49 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
In-Reply-To: <CAMKF1sqRqM_7By=0ntP2AWyfricTQMn34i-hZv-4xSfCvLHTxA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2026 03:14:48 +0200
Message-Id: <7DE05FF4-B88D-4D86-A6BE-8EDC1DD90E2A@michael-fitzmayer.de>
References: <CAMKF1sqRqM_7By=0ntP2AWyfricTQMn34i-hZv-4xSfCvLHTxA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: iPhone Mail (23D8133)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 01:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126374



> On 16. Apr 2026, at 00:08, Khem Raj <raj.khem@gmail.com> wrote:
> =EF=BB=BF
> Seeing a patch fuzz. Did you do a build test ?
>=20

I manually edited the upstream status after patchtest reported a problem, bu=
t yes.

I built it and ran qemu afterwards to see if everything works as expected.

What can I do to resolve this problem?=


