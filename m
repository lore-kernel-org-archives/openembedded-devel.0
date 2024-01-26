Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD227C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 10:03:00 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.12431.1706263373964383618
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 02:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 1385D281;
	Fri, 26 Jan 2024 11:02:51 +0100 (CET)
Received: from [192.168.178.67] ([84.154.175.38]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rTJ2w-1ZSBdo0; Fri, 26 Jan 2024 11:02:50 +0100
Date: Fri, 26 Jan 2024 11:02:54 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [PATCH] libcamera: update 0.1.0 -> 0.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	openembedded-devel@lists.openembedded.org, Denys Dmytriyenko
	<denys@konsulko.com>
Message-Id: <U85V7S.N2LYSF7N6M4M@t-online.de>
In-Reply-To: <CAMKF1srAw3TyPtG1bS+65C9ZvgZkE6scF4t06ACxB+BLXAAC5Q@mail.gmail.com>
References: <20240124215938.2030548-1-denis@denix.org>
	<CAMKF1srAw3TyPtG1bS+65C9ZvgZkE6scF4t06ACxB+BLXAAC5Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fnBd97drnYsVPprKF1V7"
X-TOI-EXPURGATEID: 150726::1706263370-FA7FB94C-7345D545/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ed68e80-5997-4310-81a4-3db70e4f4bc2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 10:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108459

--=-fnBd97drnYsVPprKF1V7
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Jan 25 2024 at 08:53:32 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> seeing this build error on qemux86/clang

I also had this issue with gcc and sent a fix for it


--=-fnBd97drnYsVPprKF1V7
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Jan 25 2024 at 08:53:32 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">seeing this build error on qemux86/clang</div></blockquote><div><br></div><div>I also had this issue with gcc and sent a fix for it</div></div>
--=-fnBd97drnYsVPprKF1V7--


