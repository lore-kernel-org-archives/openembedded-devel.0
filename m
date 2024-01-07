Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35206C47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 10:34:11 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.13002.1704623646649044630
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 02:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id DDFF51FDA0;
	Sun,  7 Jan 2024 11:33:40 +0100 (CET)
Received: from [192.168.178.67] ([84.163.46.223]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMQTM-3dw9RI0; Sun, 7 Jan 2024 11:33:40 +0100
Date: Sun, 07 Jan 2024 11:33:34 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] gnome-terminal: fix search_provider
 build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <YZZV6S.NKIG6ZRTEXIX1@t-online.de>
In-Reply-To: <CANNYZj-Eg0wmLYt_32Z_S4UiCFUeEc9b_7EZ3FHCJrph02WnxQ@mail.gmail.com>
References: <20240106223305.337182-1-f_l_k@t-online.de>
	<CANNYZj-Eg0wmLYt_32Z_S4UiCFUeEc9b_7EZ3FHCJrph02WnxQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BigZr14gUEGwN1pmukrR"
X-TOI-EXPURGATEID: 150726::1704623620-759C19CF-2FB47ECD/0/0 CLEAN NORMAL
X-TOI-MSGID: 88f59381-694c-4d6c-ba55-9effb7f88fa4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108070

--=-BigZr14gUEGwN1pmukrR
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Jan 7 2024 at 07:42:45 AM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Upstream-status is missing.

I have expanded the patch so that it would work for upstream.
Upstream-Status: Pending was added

Give me some days for testing before I try to get it upstream


--=-BigZr14gUEGwN1pmukrR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Jan 7 2024 at 07:42:45 AM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite">Upstream-status is missing.</blockquote><div><br></div><div>I have expanded the patch so that it would work for upstream.</div><div>Upstream-Status: Pending was added</div><div><br></div><div>Give me some days for testing before I try to get it upstream</div></div>
--=-BigZr14gUEGwN1pmukrR--


