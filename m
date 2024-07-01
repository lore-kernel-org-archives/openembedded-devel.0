Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A44C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 18:56:14 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.5474.1719860168487844986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 11:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 6374CAA8D;
	Mon,  1 Jul 2024 20:55:13 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.171.55]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sOMBF-2VOYZE0; Mon, 1 Jul 2024 20:55:13 +0200
Date: Mon, 01 Jul 2024 20:56:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <QLKYFS.017QT5RJAU1D1@t-online.de>
In-Reply-To: <CAMKF1sqHQCUHNBYJVbYx-0rfgzbyRZyC+BdKP1CyGVaRtsQX_Q@mail.gmail.com>
References: <20240630124721.64234-1-f_l_k@t-online.de>
	<CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
	<SJ0YFS.8BMPV3P7F4SC@t-online.de>
	<CAMKF1spH=h0FudqGDMfVkbVOOz3tggv5VWJMEgSAqsTL+J2MJw@mail.gmail.com>
	<HQGYFS.OCZ5W8J5KO0Q1@t-online.de>
	<CAMKF1sqHQCUHNBYJVbYx-0rfgzbyRZyC+BdKP1CyGVaRtsQX_Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IpMo5AdOW2GylbmCZPew"
X-TOI-EXPURGATEID: 150726::1719860113-A9331350-4AF59BE6/0/0 CLEAN NORMAL
X-TOI-MSGID: 06841573-2e9b-4868-a438-f32d679d809a
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 18:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111207

--=-IpMo5AdOW2GylbmCZPew
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Jul 1 2024 at 11:13:51 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Yeah but maybe using arch overrides would be more familiar

Can we do this without adding a new line for every architecture?


--=-IpMo5AdOW2GylbmCZPew
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Jul 1 2024 at 11:13:51 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Yeah but maybe using arch overrides would be more familiar&nbsp;</blockquote><div><br></div><div>Can we do this without adding a new line for every architecture?</div></div>
--=-IpMo5AdOW2GylbmCZPew--


