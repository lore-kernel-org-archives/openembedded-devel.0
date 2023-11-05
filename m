Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0B2C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 05:46:10 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.25449.1699163166788143798
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 22:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 2417A26F00;
	Sun,  5 Nov 2023 06:46:04 +0100 (CET)
Received: from [192.168.178.62] ([84.163.36.196]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzVxQ-29iRVY0; Sun, 5 Nov 2023 06:46:00 +0100
Date: Sun, 05 Nov 2023 06:46:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [AUH] Upgrade status meta-oe: 2023-11-03
To: Khem Raj <raj.khem@gmail.com>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <8PYM3S.3H6MBNSC87B4@t-online.de>
In-Reply-To: <CAMKF1sr2fMn_3w8EmbQ3CsM2WKekxkJNj4W3iwKspNZvOAZuGg@mail.gmail.com>
References: <0101018b96bf15ca-12434bb6-db65-40ee-ac31-50374281f91b-000000@us-west-2.amazonses.com>
	<CAMKF1sr2fMn_3w8EmbQ3CsM2WKekxkJNj4W3iwKspNZvOAZuGg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-G1ZH3LClcDQAB+cPjQbs"
X-TOI-EXPURGATEID: 150726::1699163160-A1FF8ED1-83092437/0/0 CLEAN NORMAL
X-TOI-MSGID: b96daa14-a11c-45ac-9716-ef65c568b99d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 05:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106379

--=-G1ZH3LClcDQAB+cPjQbs
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Nov 4 2023 at 01:23:48 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Please review any
> recipe upgrade of interest to you and all feedback is welcome.

The update of gnome-chess went wrong because there is a bogus tag for 
44.0 in their gitlab repository. 44.0 has not been released yet.


--=-G1ZH3LClcDQAB+cPjQbs
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Nov 4 2023 at 01:23:48 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Please review any
recipe upgrade of interest to you and all feedback is welcome.</div></blockquote><div><br></div><div>The update of gnome-chess went wrong because there is a bogus tag for 44.0 in their gitlab repository. 44.0 has not been released yet.</div></div>
--=-G1ZH3LClcDQAB+cPjQbs--


