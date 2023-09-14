Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D386CEEAA48
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:32:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.13817.1694701963139504844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 07:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 765206EE5;
	Thu, 14 Sep 2023 16:32:39 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.167.3]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qgnOY-3M9kMy0; Thu, 14 Sep 2023 16:32:38 +0200
Date: Thu, 14 Sep 2023 16:32:32 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] webrtc-audio-processing: add
 recipe for 1.x
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <8ECZ0S.CJJI5JIUCNWO2@t-online.de>
In-Reply-To: <CAMKF1sryxz18v8wavJc3hAxG+RQVD-51oEwfziKOVxHzBvVtpw@mail.gmail.com>
References: <20230914130631.182859-1-f_l_k@t-online.de>
	<CAMKF1sryxz18v8wavJc3hAxG+RQVD-51oEwfziKOVxHzBvVtpw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-QIOtpmqoUpUNs6nkcwL/"
X-TOI-EXPURGATEID: 150726::1694701958-E9FF6029-8F7875D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 0a80e779-39e4-4835-bf8d-7a0f6da14fe9
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 14:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104870

--=-QIOtpmqoUpUNs6nkcwL/
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 14 2023 at 07:28:21 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> This setting S is redundant so remove it.

I think it isn't, because without setting that to 
'webrtc-audio-processing-1.3" it would expect S to be 
webrtc-audio-processing-1-1.3

By the way, the build failed for musl. I'll send an update


--=-QIOtpmqoUpUNs6nkcwL/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 14 2023 at 07:28:21 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This setting S is redundant so remove it.</div></blockquote><div><br></div><div>I think it isn't, because without setting that to 'webrtc-audio-processing-1.3" it would expect S to be webrtc-audio-processing-1-1.3</div><div><br></div><div>By the way, the build failed for musl. I'll send an update</div></div>
--=-QIOtpmqoUpUNs6nkcwL/--


