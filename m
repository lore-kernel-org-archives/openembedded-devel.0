Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A859CCA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 17:59:09 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.1608.1756490343847181781
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Aug 2025 10:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id F2636388D6;
	Fri, 29 Aug 2025 19:59:01 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.174.32]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1us3NI-0EoAIi0; Fri, 29 Aug 2025 19:58:56 +0200
Date: Fri, 29 Aug 2025 19:58:50 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] packagegroup-gnome-desktop is not a desktop
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org,
	"Mike Looijmans via lists.openembedded.org"
	<mike.looijmans=topic.nl@lists.openembedded.org>
Message-Id: <2MOR1T.PO1LCYC0HH39@t-online.de>
In-Reply-To: <26d6cace-bdfa-47eb-8b3d-e219eb95c4ce@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
	<AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
	<DCEO1T.WIMW7AB6YK7K3@t-online.de>
	<76eb2d12-a879-412c-8790-8f1993686e95@topic.nl>
	<CPGP1T.6G37LRX8WW3G3@t-online.de>
	<26d6cace-bdfa-47eb-8b3d-e219eb95c4ce@topic.nl>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VaLioPKkX9X7RzwvKjHj"
X-TOI-EXPURGATEID: 150726::1756490336-C67FB9EC-7C2BB3B0/0/0 CLEAN NORMAL
X-TOI-MSGID: 501caf5a-001f-49e7-bb62-0a2b764114de
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 17:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119141

--=-VaLioPKkX9X7RzwvKjHj
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Aug 29 2025 at 13:58:05 +02:00:00, mike.looijmans@topic.nl 
wrote:
> This patch at least puts a login screen on the display. I can move 
> the mouse pointer on it, but I doesn't respond to any click or 
> keyboard button.

Normally the default user should be visible right in the middle and 
should be clickable (At least I never had issues with that). Do you 
have created one (besides 'root')


--=-VaLioPKkX9X7RzwvKjHj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Aug 29 2025 at 13:58:05 +02:00:00, mike.looijmans@topic.nl wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This patch at least puts a login screen on the display. I can move the mouse pointer on it, but I doesn't respond to any click or keyboard button.</div></blockquote><div><br></div><div>Normally the default user should be visible right in the middle and should be clickable (At least I never had issues with that). Do you have created one (besides 'root')</div></div>
--=-VaLioPKkX9X7RzwvKjHj--


