Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D1CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 18:24:50 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.2027.1757010280549816266
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 11:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout12.t-online.de (Postfix) with SMTP id 85CE5E956;
	Thu,  4 Sep 2025 20:24:38 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.163.17]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uuEdN-3LinZo0; Thu, 4 Sep 2025 20:24:33 +0200
Date: Thu, 04 Sep 2025 20:24:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][RFC][PATCHv2] glibmm: update 2.80.0 -> 2.85.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <SST22T.73T1736VODD22@t-online.de>
In-Reply-To: <CAMKF1soWtutXvORmqQNV-Zqs=+x9uQQj7zsCkebd-g_1NzDyxQ@mail.gmail.com>
References: <18620AA9DA393CA3.28859@lists.openembedded.org>
	<QE522T.UEJTRZ12736I1@t-online.de>
	<CAMKF1soWtutXvORmqQNV-Zqs=+x9uQQj7zsCkebd-g_1NzDyxQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tMb+Uus2BEDGs08q0Jlo"
X-TOI-EXPURGATEID: 150726::1757010273-42FF298D-2A404E9C/0/0 CLEAN NORMAL
X-TOI-MSGID: cabb57d3-d8f1-4058-8fd7-9a243860f577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 18:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119290

--=-tMb+Uus2BEDGs08q0Jlo
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 4 2025 at 10:52:29 -07:00:00, Khem Raj <raj.khem@gmail.com> 
wrote:
> does it have hard dependency upon gtk 4.20.0 or will it work with 
> 4.18 as well.

It has a hard dependedcy on glib 2.85



--=-tMb+Uus2BEDGs08q0Jlo
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 4 2025 at 10:52:29 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">does it have hard dependency upon gtk 4.20.0 or will it work with 4.18 as well.</div></blockquote><div><br></div><div>It has a hard dependedcy on glib 2.85</div><div><br></div></div>
--=-tMb+Uus2BEDGs08q0Jlo--


