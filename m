Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F20E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 19:57:58 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web11.370.1734033467534081333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 11:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 9D3F36204D; Thu, 12 Dec 2024 19:57:45 +0000 (UTC)
Received: from DESKTOPB84SDL6 (ip-046-223-148-079.um13.pools.vodafone-ip.de [46.223.148.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 7D7E56057C;
	Thu, 12 Dec 2024 19:57:45 +0000 (UTC)
From: "Michael Fitzmayer" <mail@michael-fitzmayer.de>
To: "'Khem Raj'" <raj.khem@gmail.com>
Cc: <openembedded-devel@lists.openembedded.org>
References: <20241209213948.2377-1-mail@michael-fitzmayer.de> <CAMKF1sratBWEuCCTzv8zp_EQSdSnrVcDbauWLHH2ijUiMiL5Cw@mail.gmail.com>
In-Reply-To: <CAMKF1sratBWEuCCTzv8zp_EQSdSnrVcDbauWLHH2ijUiMiL5Cw@mail.gmail.com>
Subject: RE: [oe] [meta-oe][PATCH] canopenterm: fix number of arguments check in API function
Date: Thu, 12 Dec 2024 20:57:44 +0100
Message-ID: <000c01db4cd0$1ca84560$55f8d020$@michael-fitzmayer.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJNVpKAxjiNyFBtPf/g/qSIa7V5wACC4G6osfrbrdA=
Content-Language: en-gb
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 19:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114299

The patch is upstream, and I'm actively working on the next version, =
expected in 2-4 weeks. This change is a minor fix for a non-critical bug =
noticed after I released the last tagged version.

I will have a look at it. But in hindsight, it would probably make more =
sense for me to finish the next release first.

Hopefully, I=E2=80=99ll have understood and integrated Ptest by then.

-----Original Message-----
From: Khem Raj <raj.khem@gmail.com>=20
Sent: 10 December 2024 22:43
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: fix number of arguments =
check in API function

the patch needs some tags added e.g. Upstream-Status, see =
https://valkyrie.yoctoproject.org/#/builders/81/builds/199/steps/14/logs/=
errors




