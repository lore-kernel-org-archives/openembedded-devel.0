Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7710D3EE66
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 14:50:09 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38787.1769093403531720601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 06:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id C1963EEC4;
	Thu, 22 Jan 2026 15:50:00 +0100 (CET)
Received: from [192.168.178.36] ([84.154.161.253]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viw0R-1yK0rg0; Thu, 22 Jan 2026 15:49:55 +0100
Date: Thu, 22 Jan 2026 15:49:49 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: update 128.5.2 -> 128-14-0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <17T99T.6AI6A8X0AFQE1@t-online.de>
In-Reply-To: <-1849835318615145802@unknownmsgid>
References: <20260121200056.2789828-1-f_l_k@t-online.de>
	<4b7d1b9c-d243-4710-bdb1-e09b3df2e96e@gmail.com>
	<-1849835318615145802@unknownmsgid>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HY3/u48L2aKOUugDGwvO"
X-TOI-EXPURGATEID: 150726::1769093395-957F9995-E9BF675D/0/0 CLEAN NORMAL
X-TOI-MSGID: c257a58f-710f-483f-a45c-e57650640e4f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 14:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123739

--=-HY3/u48L2aKOUugDGwvO
Content-Type: text/plain; charset=us-ascii; format=flowed

The new version at least isn't needed yet. It's required for the 
mutter-49/gnome-shell-49/gjs-1.86.0 update,
which is currently blocked by the missing glycin2 recipe (required by 
mutter).

Not quite sure whether mutter-48/gnome-shell-48 would run error-free 
with mozjs-140, so I wanted to play it safe.

I hadn't found the patch in the Mozilla sources yet. It wasn't even 
included in the current mozjs-140 release
from a few days ago. Thanks for the info, I'll send a v2.

On Thu, Jan 22 2026 at 15:44:16 +01:00:00, Markus Volk 
<mrksvolk@googlemail.com> wrote:
> The new version at least isn't needed yet. It's required for the 
> mutter-49/gnome-shell-49/gjs-1.86.0 update,
> which is currently blocked by the missing glycin2 recipe (required by 
> mutter).
> 
> I'm not sure whether mutter-48/gnome-shell-48 would run error-free 
> with mozjs-140, so I wanted to play it safe.
> 
> I hadn't found the patch in the Mozilla sources yet. It wasn't even 
> included in the current mozjs-140 release from a few days ago.


--=-HY3/u48L2aKOUugDGwvO
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>The new version at least isn'=
t needed yet. It's required for the mutter-49/gnome-shell-49/gjs-1.86.0 upd=
ate,</div><div>which is currently blocked by the missing glycin2 recipe (re=
quired by mutter).</div><div><br></div><div>Not quite sure whether mutter-4=
8/gnome-shell-48 would run error-free with mozjs-140, so I wanted to play i=
t safe.</div><div><br></div><div>I hadn't found the patch in the Mozilla so=
urces yet. It wasn't even included in the current mozjs-140 release</div><d=
iv>from a few days ago. Thanks for the info, I'll send a v2.</div></div></d=
iv><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Jan 22 2026 at 15:44:16=
 +01:00:00, Markus Volk &lt;mrksvolk@googlemail.com&gt; wrote:<br><blockquo=
te type=3D"cite"><div id=3D"geary-body" dir=3D"auto"><div>The new version a=
t least isn't needed yet. It's required for the mutter-49/gnome-shell-49/gj=
s-1.86.0 update,</div><div>which is currently blocked by the missing glycin=
2 recipe (required by mutter).</div><div><br></div><div>I'm not sure whethe=
r mutter-48/gnome-shell-48 would run error-free with mozjs-140, so I wanted=
 to play it safe.</div><div><br></div><div>I hadn't found the patch in the =
Mozilla sources yet. It wasn't even included in the current mozjs-140 relea=
se from a few days ago.</div></div><div id=3D"geary-signature" dir=3D"auto"=
></div></blockquote></div>
--=-HY3/u48L2aKOUugDGwvO--


