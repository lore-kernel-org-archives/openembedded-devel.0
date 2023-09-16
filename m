Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE3FCD37B7
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 08:31:27 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.8246.1694853084124888203
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 01:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 6FC4036F01;
	Sat, 16 Sep 2023 10:31:02 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.224.246]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhQhi-0Zjo5w0; Sat, 16 Sep 2023 10:31:02 +0200
Date: Sat, 16 Sep 2023 10:31:06 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] appstream: remove workaround for
 cross-compile
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <UZK21S.8IN0IVNHYS6S@t-online.de>
In-Reply-To: <CAMKF1sovTe-MVyh76RFxdQZny3u-y_gAkyPuCGkspUYDguamzQ@mail.gmail.com>
References: <20230915120131.251678-1-f_l_k@t-online.de>
	<CAMKF1sovTe-MVyh76RFxdQZny3u-y_gAkyPuCGkspUYDguamzQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9XfD1V/U/frXdVslt7WO"
X-TOI-EXPURGATEID: 150726::1694853062-FDC012E6-A1B908C4/0/0 CLEAN NORMAL
X-TOI-MSGID: fe3a71c2-0783-4083-a870-ec153bf0c711
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 08:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104899

--=-9XfD1V/U/frXdVslt7WO
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 15 2023 at 03:58:17 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> It fails to build

Sorry, I didn't check properly. The fix still needs to be backported. 
Sent a v2 for it


--=-9XfD1V/U/frXdVslt7WO
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Sep 15 2023 at 03:58:17 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It fails to build</div></blockquote><div><br></div><div>Sorry, I didn't check properly. The fix still needs to be backported. Sent a v2 for it</div></div>
--=-9XfD1V/U/frXdVslt7WO--


