Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348D4C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:59:24 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.50923.1710953962802793232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id 1432D670C;
	Wed, 20 Mar 2024 17:59:19 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmzHZ-0RXMfI0; Wed, 20 Mar 2024 17:59:18 +0100
Date: Wed, 20 Mar 2024 17:59:32 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <8JONAS.NE73HRGIR2H9@t-online.de>
In-Reply-To: <CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
References: <17BE205582F63951.29196@lists.openembedded.org>
	<P19LAS.XNJ0HDKLN7IM@t-online.de>
	<CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wo0OC4fjTZCSfK8faq+l"
X-TOI-EXPURGATEID: 150726::1710953958-5CF5D979-EDFF73BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 3985983b-fa06-48ac-adcd-2cc510fc2718
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 16:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109493

--=-wo0OC4fjTZCSfK8faq+l
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 07:34:19 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> I have pushed the fix for it into master-next to put ffmpeg dep as
> part of package config.

Does this work for you? In my tests ffmpeg was required as a hard 
dependency and the build otherwise failed with ffmpeg disabled because 
freerdp3 still needs to find  swscale


--=-wo0OC4fjTZCSfK8faq+l
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 07:34:19 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I have pushed the fix for it into master-next to put ffmpeg dep as
part of package config.</div></blockquote><div><br></div><div>Does this work for you? In my tests ffmpeg was required as a hard dependency and the build otherwise failed with ffmpeg disabled because freerdp3 still needs to find &nbsp;swscale</div></div>
--=-wo0OC4fjTZCSfK8faq+l--


