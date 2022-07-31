Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E5CC00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 11:24:20 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.12296.1659266653623991114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jul 2022 04:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 8AC02AB23;
	Sun, 31 Jul 2022 13:24:11 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.44.122]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oI73I-1Iwhbk0; Sun, 31 Jul 2022 13:24:08 +0200
Date: Sun, 31 Jul 2022 13:24:02 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] ibus.inc: fix after branch renaming
To: Fabio Estevam <festevam@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <2CUVFR.59P05DXX1TAL2@t-online.de>
In-Reply-To: 
	<CAOMZO5AE7AHFO5V6841gqzjw+cNA_YgOJvTAcU7kW6_GE0bd7A@mail.gmail.com>
References: <20220730152545.294982-1-f_l_k@t-online.de>
	<CAMKF1spWqX_q_LNzhA2f5vgVLHBHjLN4p_YkFoXn=5aWVkW8Qw@mail.gmail.com>
	<9FNUFR.YL5HBRQXU9PH1@t-online.de>
	<CAOMZO5AE7AHFO5V6841gqzjw+cNA_YgOJvTAcU7kW6_GE0bd7A@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zKGEokvcxIQYKVsZE3UJ"
X-TOI-EXPURGATEID: 150726::1659266648-0144C2AD-02737C4C/0/0 CLEAN NORMAL
X-TOI-MSGID: 48a7ab02-4651-424a-95a8-f366c1ad2380
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Jul 2022 11:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98064

--=-zKGEokvcxIQYKVsZE3UJ
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 30. Jul 2022 um 17:31:59 -0300 schrieb Fabio Estevam 
<festevam@gmail.com>:
> Does the change below fix it?

'bitbake -c cleanall' didn't solve the issue, 'branch=main did'. Is 
there a reason why this should be preferred over 'nobranch=1' ? The 
latter seems to be less maintenance.


--=-zKGEokvcxIQYKVsZE3UJ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Sa, 30. Jul 2022 um 17:31:59 -0300 schrieb Fabio Estevam &lt;festevam@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Does the change below fix it?</div></blockquote><div><br></div><div><span style="background-color: rgb(255, 255, 255);">'bitbake -c cleanall' didn't solve the issue, 'branch=main did'. Is there a reason why this should be preferred over 'nobranch=1' ? The latter&nbsp;seems to be less maintenance.</span></div></div>
--=-zKGEokvcxIQYKVsZE3UJ--


