Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5403CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 15:12:20 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.22248.1695481937830129595
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 08:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 904203A8D3;
	Sat, 23 Sep 2023 17:12:15 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.192]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qk4Ip-18xzZA0; Sat, 23 Sep 2023 17:12:15 +0200
Date: Sat, 23 Sep 2023 17:12:11 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] tepl: Upgrade 6.4.0 -> 6.8.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <B82G1S.ZLCCWV4U9ERG2@t-online.de>
In-Reply-To: <CAMKF1sps05_=v1Rt509W8=1JzoRCgx9gemat1QBT5QQFHqghsQ@mail.gmail.com>
References: <20230923012830.3338338-1-f_l_k@t-online.de>
	<CAMKF1sps05_=v1Rt509W8=1JzoRCgx9gemat1QBT5QQFHqghsQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zakLAjUbZUKtUP7cbP2T"
X-TOI-EXPURGATEID: 150726::1695481935-6FFE84B7-A047EB49/0/0 CLEAN NORMAL
X-TOI-MSGID: efade989-d4de-4540-846e-462033451e66
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 15:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105096

--=-zakLAjUbZUKtUP7cbP2T
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 23 2023 at 07:47:15 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> conflicting providers for same file I guess

yes. libgedit-amtk replaces amtk but the latter was built as a 
dependency of libgedit-amtk


--=-zakLAjUbZUKtUP7cbP2T
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 23 2023 at 07:47:15 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">conflicting providers for same file I guess</div></blockquote><div><br></div><div>yes. libgedit-amtk replaces amtk but the latter was built as a dependency of libgedit-amtk</div></div>
--=-zakLAjUbZUKtUP7cbP2T--


