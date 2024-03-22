Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D24AC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 07:46:09 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.7818.1711093568283506366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 00:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout07.t-online.de (Postfix) with SMTP id 882465914D;
	Fri, 22 Mar 2024 08:46:06 +0100 (CET)
Received: from [192.168.178.67] ([84.163.37.243]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnZbJ-3Wsvg00; Fri, 22 Mar 2024 08:46:06 +0100
Date: Fri, 22 Mar 2024 08:46:33 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <L9OQAS.FJKYH67TB76D@t-online.de>
In-Reply-To: <CA+chaQfoiuyC5GNz72zNfkFRL6oTAZ7MOjcF=ZMtPrh7eqJoZA@mail.gmail.com>
References: <17BE205582F63951.29196@lists.openembedded.org>
	<P19LAS.XNJ0HDKLN7IM@t-online.de>
	<CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
	<CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
	<VVPNAS.FCPMXAAPQ9Y82@t-online.de>
	<CAMKF1srGvQ3d-L=PR4r3H_tMvbb9jwcgMz6kx6FD1LuVebY-TA@mail.gmail.com>
	<17BE8A4D584EEFD1.29196@lists.openembedded.org>
	<0URNAS.2AWVCV53YYT41@t-online.de>
	<CA+chaQfoiuyC5GNz72zNfkFRL6oTAZ7MOjcF=ZMtPrh7eqJoZA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gfRfHWJppWwvKJkn84lk"
X-TOI-EXPURGATEID: 150726::1711093566-3AFFA95D-0C2F1965/0/0 CLEAN NORMAL
X-TOI-MSGID: bf6e455e-1502-452a-85e6-b992066596e4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 07:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109513

--=-gfRfHWJppWwvKJkn84lk
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Mar 22 2024 at 07:17:14 AM +01:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> The packageconfig for x11 doesn't seem to be enough to disable x11
> when it's not in DISTRO_FEATURES.

-DWITH_SHADOW=OFF would avoid the libx11 dependency.


--=-gfRfHWJppWwvKJkn84lk
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Mar 22 2024 at 07:17:14 AM +01:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">The packageconfig for x11 doesn't seem to be enough to disable x11
when it's not in DISTRO_FEATURES.</div></blockquote><div><br></div><div>-DWITH_SHADOW=OFF would avoid the libx11 dependency.</div></div>
--=-gfRfHWJppWwvKJkn84lk--


