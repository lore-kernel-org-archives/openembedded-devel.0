Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4213CC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 08:01:07 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web09.20358.1641974465124609293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 00:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from home.localnet (44-208-124-178-static.mgts.by [178.124.208.44]
 (may be forged))
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8) with ESMTPSA id 20C810Sd026927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 09:01:01 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH v2] buildstats: support of custom disk usage command
Date: Wed, 12 Jan 2022 11:01:04 +0300
Message-ID: <2043800.9o76ZdvQCi@home>
In-Reply-To: 
 <CAMKF1spQJzs5zipTtG_CeMXxGLJbRCMN3dA1fth52wT54YNEpQ@mail.gmail.com>
References: <20220111134202.9622-1-ubely@ilbers.de>
 <CAMKF1spQJzs5zipTtG_CeMXxGLJbRCMN3dA1fth52wT54YNEpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 08:01:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94777

In the email from =D0=B2=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA, 11 =D1=8F=D0=
=BD=D0=B2=D0=B0=D1=80=D1=8F 2022 =D0=B3. 19:27:32 +03 user Khem Raj wrote:
> Thanks for this patch however it needs to be sent to openembedded-core
> mailing list

Thanks for the answer. I'll resend it there.



