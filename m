Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3958ECCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 17:07:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.14726.1761671221413404284
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 10:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id 0C090392AE;
	Tue, 28 Oct 2025 18:06:59 +0100 (CET)
Received: from [192.168.178.36] ([84.163.37.69]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vDn9q-0G1VhY0; Tue, 28 Oct 2025 18:06:54 +0100
Date: Tue, 28 Oct 2025 18:06:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-remote-desktop: update 48.0 ->
 49.1
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <47QU4T.3BISPL1YBF6W@t-online.de>
In-Reply-To: <CAMKF1so4wMWv_koEjHgQ3w=1AwT2hP4N4hs2YOOUJix7iafeVQ@mail.gmail.com>
References: <20251028164419.462005-1-f_l_k@t-online.de>
	<CAMKF1so4wMWv_koEjHgQ3w=1AwT2hP4N4hs2YOOUJix7iafeVQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3tOR58z4R7aRNTMhaok8"
X-TOI-EXPURGATEID: 150726::1761671214-FBFFD456-3B7F91E8/0/0 CLEAN NORMAL
X-TOI-MSGID: c381d002-fe1a-426e-b2e9-d4ae83668be8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 17:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121096

--=-3tOR58z4R7aRNTMhaok8
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Oct 28 2025 at 09:50:17 -07:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> Isn't there some pkgconfig magic that should have done it 
> automatically ?

It may work with 'pkgconfig', but currently it is not inherited in the 
gnome-remote-desktop recipe so I decided to go the easy way.
But I can have a look after my current image build has completed


--=-3tOR58z4R7aRNTMhaok8
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Oct 28 2025 at 09:50:17 -07:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Isn't there some pkgconfig magic that should have done it automatically ?</div></blockquote><div><br></div><div>It may work with 'pkgconfig', but currently it is not inherited in the gnome-remote-desktop recipe so I decided to go the easy way.</div><div>But I can have a look after my current image build has completed</div></div>
--=-3tOR58z4R7aRNTMhaok8--


