Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF12C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 12:46:47 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.10796.1744980396893303327
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 05:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id 58275132B;
	Fri, 18 Apr 2025 14:46:34 +0200 (CEST)
Received: from [192.168.178.20] ([79.219.239.25]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u5l71-3hkuY40; Fri, 18 Apr 2025 14:46:31 +0200
Date: Fri, 18 Apr 2025 14:46:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/4] static-passwd-meta-oe: add flatpak user
To: Yoann Congal <yoann.congal@smile.fr>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <DHZWUS.LXIXT579X3NA3@t-online.de>
In-Reply-To: <CAMSfU+4jg=76Tj5qzHf4OyudZiw8Pj8rPQv69To3X_8pst2U6g@mail.gmail.com>
References: <20250417163912.1060162-1-f_l_k@t-online.de>
	<20250417163912.1060162-2-f_l_k@t-online.de>
	<CAMSfU+4jg=76Tj5qzHf4OyudZiw8Pj8rPQv69To3X_8pst2U6g@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0GI5AdG2/tqakglPx5uH"
X-TOI-EXPURGATEID: 150726::1744980391-C67FB99B-E4999A34/0/0 CLEAN NORMAL
X-TOI-MSGID: 476bed44-ddf4-45bb-bf29-6fbe3d7ca44f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 12:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116967

--=-0GI5AdG2/tqakglPx5uH
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Apr 17 2025 at 19:44:58 +02:00:00, Yoann Congal 
<yoann.congal@smile.fr> wrote:
> Anyway you can use 625 as the ID?
> There is a kind-of pattern in static-passwd/groups files to avoid
> clashing with each other in the long term.

Thanks

v2: update ID


--=-0GI5AdG2/tqakglPx5uH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Apr 17 2025 at 19:44:58 +02:00:00, Yoann Congal &lt;yoann.congal@smile.fr&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Anyway you can use 625 as the ID?
There is a kind-of pattern in static-passwd/groups files to avoid
clashing with each other in the long term.</div></blockquote><div><br></div><div>Thanks</div><div><br></div><div>v2: update ID</div></div>
--=-0GI5AdG2/tqakglPx5uH--


