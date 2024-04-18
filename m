Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2388C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 21:38:04 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-twisted: upgrade 22.10.0 -> 24.3.0
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Vilnius, LT (213.197.160.147)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 14:37:58 -0700
References: <CANx9H-DLauDMx75MsCqqm9LRSOm=mJ0RYcFTC2QFXNAgH04Zfw@mail.gmail.com>
In-Reply-To: <CANx9H-DLauDMx75MsCqqm9LRSOm=mJ0RYcFTC2QFXNAgH04Zfw@mail.gmail.com>
Message-ID: <7441.1713476278132057062@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bwYjWSKD0ZWGF25Fv3iG"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 21:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110055

--bwYjWSKD0ZWGF25Fv3iG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim, good to know :)

I see this patch has already made it to master-next branch, I can remove th=
e PYPI_PACKAGE line in a future patch after I have built it locally to veri=
fy.

I'm hoping to backport this upgrade to Scarthgap as well so the latest LTS =
is not ~2 years out of date.

I'm sure I will contribute more for the twisted recipe if I find any furthe=
r improvements/cleanup. I believe we can split twisted-core into more indep=
endent packages, but I will take my time with those changes before submitti=
ng them so it may take a while.

--bwYjWSKD0ZWGF25Fv3iG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim, good to know :)<br /><br />I see this patch has already made it to =
master-next branch, I can remove the PYPI_PACKAGE line in a future patch af=
ter I have built it locally to verify.<br /><br />I'm hoping to backport th=
is upgrade to Scarthgap as well so the latest LTS is not ~2 years out of da=
te.<br /><br />I'm sure I will contribute more for the twisted recipe if I =
find any further improvements/cleanup. I believe we can split twisted-core =
into more independent packages, but I will take my time with those changes =
before submitting them so it may take a while.<br />

--bwYjWSKD0ZWGF25Fv3iG--

