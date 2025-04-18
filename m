Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61B5C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 15:39:21 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.14572.1744990759798136456
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 08:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id CBEADC4B;
	Fri, 18 Apr 2025 17:39:16 +0200 (CEST)
Received: from [192.168.178.20] ([79.219.239.25]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u5no7-14tYfY0; Fri, 18 Apr 2025 17:39:11 +0200
Date: Fri, 18 Apr 2025 17:39:06 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] static-passwd-meta-oe: add flatpak user
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <6H7XUS.S59AKF4YAOOO3@t-online.de>
In-Reply-To: <CAMKF1sryPn8w8dvAYO9ppj-9oF1r9ArJQK-ikhgRMFs7-eZNQg@mail.gmail.com>
References: <20250418124322.171293-1-f_l_k@t-online.de>
	<CAMKF1sryPn8w8dvAYO9ppj-9oF1r9ArJQK-ikhgRMFs7-eZNQg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jgEs0FiAodXEmOWPLr9E"
X-TOI-EXPURGATEID: 150726::1744990751-97FFC9D9-A957038A/0/0 CLEAN NORMAL
X-TOI-MSGID: 593234de-73e7-4e3a-8bf5-bc5445159c74
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 15:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116973

--=-jgEs0FiAodXEmOWPLr9E
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Apr 18 2025 at 08:30:59 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Is the uppercase F in Flatpak expected or a typo ?

I adopted it from what was dynamically created in my image in 
/etc/passwd:

flatpak:x:980:980:Flatpak system helper:/:/usr/sbin/nologin

This is the description field, so I guess it wouldn't really matter if 
it was upper or lowercase or present at all?



--=-jgEs0FiAodXEmOWPLr9E
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Apr 18 2025 at 08:30:59 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Is the uppercase F in Flatpak expected or a typo ?
</div></blockquote><div><br></div><div>I adopted it from what was dynamically created in my image in /etc/passwd:</div><div><br></div><div><div>flatpak:x:980:980:Flatpak system helper:/:/usr/sbin/nologin</div></div><div><br></div><div>This is the description field, so I guess it wouldn't really matter if it was upper or lowercase or present at all?</div><div><br></div></div>
--=-jgEs0FiAodXEmOWPLr9E--


