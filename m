Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B69FC433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 23:56:09 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.4672.1642377368036175657
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 15:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 73478200005;
	Sun, 16 Jan 2022 23:56:05 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [oe] [meta-oe][hardknott][PATCH] postgresql: Update to 13.5
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <7662d30d-9c51-41c2-a54a-2610d3459e92@gmail.com>
Date: Sun, 16 Jan 2022 15:56:02 -0800
Cc: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8DD211E4-9D36-4470-8E15-8AFCAB60F46B@redrectangle.org>
References: <20220115213351.974981-1-robert.joslyn@redrectangle.org>
 <7662d30d-9c51-41c2-a54a-2610d3459e92@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 23:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94887



> On Jan 16, 2022, at 10:16 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>=20
> Robert,
>=20
> On 1/15/22 1:33 PM, Robert Joslyn wrote:
>> This is a security and bugfix release. With this update, the =
backported
>> patches for CVE-2021-2314 and CVE-2021-23222 are no longer needed. =
Full
>> release notes are available at:
>> https://www.postgresql.org/docs/release/13.5/
>=20
> If a patch to update master has not been sent, please do so as it
> currently has the same version as hardknott.

I did send a patch for master to update to 14.1. Figured it wasn=E2=80=99t=
 worth bumping master to 13.5 when a newer major version was available.

Thanks,
Robert=

