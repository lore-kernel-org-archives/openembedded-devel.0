Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E23AC44508
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:49 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.592.1784052527635579289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jul 2026 11:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=Q70cZ65b;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout12.t-online.de (Postfix) with SMTP id B159BF032;
	Tue, 14 Jul 2026 20:08:45 +0200 (CEST)
Received: from [192.168.178.63] ([79.219.234.170]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wjhYd-2bEQvg0; Tue, 14 Jul 2026 20:08:39 +0200
Date: Tue, 14 Jul 2026 20:08:33 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: update 0.7.1 -> 0.7.2
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <9QF6IT.0YFY3W9VKIAO1@t-online.de>
In-Reply-To: <CADWMC-Z7-kP+xYixTDSsFKgZfd4CQS0iyoaBLxefCXTjMcRsqA@mail.gmail.com>
References: <20260713170853.298499-1-f_l_k@t-online.de>
	<CADWMC-Z7-kP+xYixTDSsFKgZfd4CQS0iyoaBLxefCXTjMcRsqA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U6ov/rytvVXZEFXXsluE"
X-TOI-EXPURGATEID: 150726::1784052519-8AFFA87A-99C8CD59/0/0 CLEAN NORMAL
X-TOI-MSGID: cd4963c4-a403-4741-9879-e6f0a806ff01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784052525; i=f_l_k@t-online.de;
	bh=36Dz0wg263U8EDYB/TxCygWG93w/62B5rHfOAsvXM1w=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=Q70cZ65bWIk5Vh3gEAnSUE7aQumT1mVRcrVy1Gl98jt2GPRi9VBzUwculS5jZT9vj
	 UsIjlMZnHmXZG8lZdVdz+tUZg/qXkH2Dzhy4XqJPMTY0VgRPA3wAcqd6rCqQneM6mb
	 ctb4bAKRGO69FcaNUcnZvBgLDchkP0F1uKC/Rj70JceJmq2RBHxXYm2QUbAT+qQhsX
	 Hz4tvLR4n9zykA4jWCuIA3PZRrhguFX5dbTQ+83VUMHqvO2YJ0/KdnnGNdyqoyOpVG
	 sLKRSEkeofwN4jeHT11h26p3A6CbAZehO6AcNU4Nz3KBe0+jZgVpnpZag94yjg2+ip
	 8hm8JGkk6cuoQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2026 18:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128169

--=-U6ov/rytvVXZEFXXsluE
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 14. Jul 2026 um 17:18:00 +01:00:00 schrieb Jose Quaresma 
<jose.quaresma@oss.qualcomm.com>:
> There is another virtual knob to be dropped

Thanks!


--=-U6ov/rytvVXZEFXXsluE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 14. Jul 2026 um 17:18:00 +01:00:00 schrieb Jose Quaresma &lt;jose.quaresma@oss.qualcomm.com&gt;:<br><blockquote type="cite">There is another virtual knob to be dropped</blockquote><div><br></div><div>Thanks!</div></div>
--=-U6ov/rytvVXZEFXXsluE--


