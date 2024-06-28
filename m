Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39DAC2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 08:32:14 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.12679.1719563526755134241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 01:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id 6DA2932C2;
	Fri, 28 Jun 2024 10:32:04 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.42.131]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sN71U-3mGqKu0; Fri, 28 Jun 2024 10:32:00 +0200
Date: Fri, 28 Jun 2024 10:32:59 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] flatpak: add PACKAGECONFIG knob for
 malcontent
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <ZQ7SFS.CUMW4YF9DVM23@t-online.de>
In-Reply-To: <CA+chaQe4am_vJwBgT+zsWMFuxHMbD=zAXvrQOzVjKLuoaqXd7Q@mail.gmail.com>
References: <20240521164945.333290-1-f_l_k@t-online.de>
	<CA+chaQe4am_vJwBgT+zsWMFuxHMbD=zAXvrQOzVjKLuoaqXd7Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-25K5JY+6ZGJuoI5nzeyl"
X-TOI-EXPURGATEID: 150726::1719563521-1E7FBCAA-11ACA1AA/0/0 CLEAN NORMAL
X-TOI-MSGID: b7f16a46-eb39-44a7-a0bd-4c5ecf8df999
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 08:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111145

--=-25K5JY+6ZGJuoI5nzeyl
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Jun 28 2024 at 09:24:10 AM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> is there some knob for dconf?

In fact, there is.
<https://github.com/flatpak/flatpak/blob/92d7f9ec49e2db4ad93040d8e607531791165024/meson_options.txt#L10>

Making pipewire dependent on meta-gnome doesn't feel right to me. Would 
it be acceptable to just disable dconf for flatpak by default?


--=-25K5JY+6ZGJuoI5nzeyl
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Jun 28 2024 at 09:24:10 AM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">is there some knob for dconf?</div></blockquote><div><br></div><div>In fact, there is.</div><div><a href="https://github.com/flatpak/flatpak/blob/92d7f9ec49e2db4ad93040d8e607531791165024/meson_options.txt#L10">https://github.com/flatpak/flatpak/blob/92d7f9ec49e2db4ad93040d8e607531791165024/meson_options.txt#L10</a></div><div><br></div><div>Making pipewire dependent on meta-gnome doesn't feel right to me. Would it be acceptable to just disable dconf for flatpak by default?</div></div>
--=-25K5JY+6ZGJuoI5nzeyl--


