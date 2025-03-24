Return-Path: <tim.dylla.ext@rohde-schwarz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153FFC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:48:43 +0000 (UTC)
Subject: Re: [kirkstone][meta-networking][PATCH] net-snmp: fix memory leak
To: openembedded-devel@lists.openembedded.org
From: tim.dylla.ext@rohde-schwarz.com
X-Originating-Location: CH (147.161.235.82)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 07:48:38 -0700
References: <AM0PR06MB4260E942DA834864F38DE7DBABD12@AM0PR06MB4260.eurprd06.prod.outlook.com>
In-Reply-To: <AM0PR06MB4260E942DA834864F38DE7DBABD12@AM0PR06MB4260.eurprd06.prod.outlook.com>
Message-ID: <15989.1742827718915937909@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="u8DvfCIMTSrXLFLDvICM"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 14:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116210

--u8DvfCIMTSrXLFLDvICM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Confirmed (if that's of interest),

I second Piotr Lewicki in all aspects, the patch in its current form breaks=
 building of net-snmp recipe.

...Patching patches, patching patches.... :)

All the best,

Tim Dylla

--u8DvfCIMTSrXLFLDvICM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Confirmed (if that's of interest),&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; I second Piotr Lewicki in all aspects, the patch in its c=
urrent form breaks building of net-snmp recipe. <br /><br />...Patching pat=
ches, patching patches.... :)<br /><br />All the best,</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tim Dylla</div>

--u8DvfCIMTSrXLFLDvICM--

