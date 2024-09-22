Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F815CF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 18:02:47 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.19602.1727028166295076790
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Sep 2024 11:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id B22BC21530;
	Sun, 22 Sep 2024 20:02:42 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.41.228]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ssQuw-4KP6jA0; Sun, 22 Sep 2024 20:02:42 +0200
Date: Sun, 22 Sep 2024 20:04:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 07/23] gnome-console: update 45.0 -> 47.0
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <GJ78KS.OL4V29GHA3P23@t-online.de>
In-Reply-To: <CAMKF1srp2H2bx7J9wBpmm5Teo6SFFXXz4N3vc_0Hp=Q3qhF+iA@mail.gmail.com>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
	<20240920150822.1131707-7-f_l_k@t-online.de>
	<CAMKF1srp2H2bx7J9wBpmm5Teo6SFFXXz4N3vc_0Hp=Q3qhF+iA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WmvEB3WTv3qUW6ZYF4Oz"
X-TOI-EXPURGATEID: 150726::1727028162-CDFF948D-910F4508/0/0 CLEAN NORMAL
X-TOI-MSGID: cb7caaa2-4faf-425c-b8a5-ab32076f8379
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 18:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112452

--=-WmvEB3WTv3qUW6ZYF4Oz
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 21 2024 at 08:33:43 PM -04:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> I would suggest to build
> packagegroup-gnome-apps and packagegroup-gnome-desktop

Thanks for the advise. Will definitely do it for the next updates. For 
now I succeeded building both packagegroups without errors, besides the 
issue with gnome-console. Maybe the update should  be delayed until vte 
was updated in oe-core? There is still gnome-terminal that has lower 
requirements for vte and works great in gnome 47



--=-WmvEB3WTv3qUW6ZYF4Oz
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 21 2024 at 08:33:43 PM -04:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I would suggest to build
packagegroup-gnome-apps and packagegroup-gnome-desktop</div></blockquote><div><br></div><div>Thanks for the advise. Will definitely do it for the next updates. For now I succeeded building both packagegroups without errors, besides the issue with gnome-console. Maybe the update should &nbsp;be delayed until vte was updated in oe-core? There is still gnome-terminal that has lower requirements for vte and works great in gnome 47&nbsp;</div><div><br></div></div>
--=-WmvEB3WTv3qUW6ZYF4Oz--


