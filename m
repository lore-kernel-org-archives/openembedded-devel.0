Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC8EC54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 07:44:37 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.10295.1711611868256149299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 00:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 3131E3269;
	Thu, 28 Mar 2024 08:44:26 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.230]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpkQz-2PqpQu0; Thu, 28 Mar 2024 08:44:25 +0100
Date: Thu, 28 Mar 2024 08:44:50 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] gnome-user-share: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <Q6S1BS.J8FXLP59Y8JQ@t-online.de>
In-Reply-To: <CAMKF1soAGh=z3e4pU9oYBiGQbXm9T7jpxJC+K1u6h1DpL0jGVA@mail.gmail.com>
References: <20240327160808.22384-1-f_l_k@t-online.de>
	<CAMKF1soAGh=z3e4pU9oYBiGQbXm9T7jpxJC+K1u6h1DpL0jGVA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Yr6Zp+s3Q3MDeIbFHygD"
X-TOI-EXPURGATEID: 150726::1711611865-52FFA94C-B0DE18AB/0/0 CLEAN NORMAL
X-TOI-MSGID: 22103b87-f720-46a8-b2a4-d5dc86dcf83a
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 07:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109653

--=-Yr6Zp+s3Q3MDeIbFHygD
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 27 2024 at 11:21:56 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> this does not work properly with non-systemd distros

Right, and systemd is not optional.Will send a patch for it


--=-Yr6Zp+s3Q3MDeIbFHygD
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 27 2024 at 11:21:56 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">this does not work properly with non-systemd distros</div></blockquote><div><br></div><div>Right, and systemd is not optional.Will send a patch for it</div></div>
--=-Yr6Zp+s3Q3MDeIbFHygD--


