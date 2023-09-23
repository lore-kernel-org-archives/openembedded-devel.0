Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCC3CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 14:49:20 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.21759.1695480559682178670
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 07:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 23EE116AC1;
	Sat, 23 Sep 2023 16:49:17 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.192]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qk3wY-2KqNDU0; Sat, 23 Sep 2023 16:49:14 +0200
Date: Sat, 23 Sep 2023 16:49:11 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] gedit: Upgrade 44.2 -> 46.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <Z51G1S.ER45SBO48BJJ3@t-online.de>
In-Reply-To: <CAMKF1sro9-orWKQZz1wRSLL4+WT=D8LYuUz5Vv1=PkPFd6k3PA@mail.gmail.com>
References: <20230923012830.3338338-1-f_l_k@t-online.de>
	<20230923012830.3338338-2-f_l_k@t-online.de>
	<CAMKF1sro9-orWKQZz1wRSLL4+WT=D8LYuUz5Vv1=PkPFd6k3PA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-AzW/8xtyDiNhYVpE4bNv"
X-TOI-EXPURGATEID: 150726::1695480554-26196295-A5215DF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 9de96caa-bffd-44ea-821b-f774e6163296
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 14:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105092

--=-AzW/8xtyDiNhYVpE4bNv
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Sep 23 2023 at 07:45:43 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Does this happen for you ?

Not for now. I'll do a bitbake -c cleansstate libgedit-gtksourceview

That will  make it appear I guess


--=-AzW/8xtyDiNhYVpE4bNv
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Sep 23 2023 at 07:45:43 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Does this happen for you ?</div></blockquote><div><br></div><div>Not for now. I'll do a bitbake -c cleansstate&nbsp;libgedit-gtksourceview</div><div><br></div><div>That will &nbsp;make it appear I guess</div></div>
--=-AzW/8xtyDiNhYVpE4bNv--


