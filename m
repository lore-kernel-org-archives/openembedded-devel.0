Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B455CC36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 04:03:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.58550.1742875392804774698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 21:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id AB592F18;
	Tue, 25 Mar 2025 05:03:10 +0100 (CET)
Received: from [192.168.178.20] ([84.163.32.137]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1twvVJ-3WLNi40; Tue, 25 Mar 2025 05:03:05 +0100
Date: Tue, 25 Mar 2025 05:03:55 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] upower-profiles-daemon: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <JAVNTS.DK64S6GGJ45U2@t-online.de>
In-Reply-To: <CAMKF1sq8yi1CimE5Tk0nYZZfWyPiyr7LXWnn5mfesoKXpqnLZg@mail.gmail.com>
References: <20250325032203.3034-1-f_l_k@t-online.de>
	<CAMKF1sq8yi1CimE5Tk0nYZZfWyPiyr7LXWnn5mfesoKXpqnLZg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-V/IVqnpmF6J+eUW1qOtw"
X-TOI-EXPURGATEID: 150726::1742875385-DE7EBC07-EED3886D/0/0 CLEAN NORMAL
X-TOI-MSGID: a4ca0cc8-a7e9-4800-8635-7c85ecc902f1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 04:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116221

--=-V/IVqnpmF6J+eUW1qOtw
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Mar 24 2025 at 20:56:08 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> there are two appends one after another above. Lets merge them into 
> one.


You are right. I made it an additional append because the second one is 
kind of a hack to ensure the service will come up even if 
multi-user.target is for some reason blocked to succeed which might or 
might not be a personal issue in my build. But that does not justify 
another append


--=-V/IVqnpmF6J+eUW1qOtw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Mar 24 2025 at 20:56:08 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">there are two appends one after another above. Lets merge them into one.</div></blockquote><div><br></div><div><br></div><div><span style="background-color: rgb(255, 255, 255);">You are right. I made it an additional append because the second one is kind of a hack to ensure the service will come up even if multi-user.target is for some reason blocked to succeed which might or might not be a personal issue in my build. But that does not justify another append</span></div></div>
--=-V/IVqnpmF6J+eUW1qOtw--


