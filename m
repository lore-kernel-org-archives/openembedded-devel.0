Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF6CC61DD3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:31:53 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7539.1788499906506530538
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=E1b4dcdQ;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id D9C6CE4A9;
	Fri,  4 Sep 2026 07:31:43 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.32.56]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x2MWb-3aNcDQ0; Fri, 4 Sep 2026 07:31:41 +0200
Date: Fri, 04 Sep 2026 07:31:35 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 6/6] mozjs: update 128->140
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <OCRTKT.HJ20VKUJUITB@t-online.de>
In-Reply-To: <CAMKF1srr+ZODm06Cp6Evrk3se1rvibqeg6u_6okSTUg_TY7umA@mail.gmail.com>
References: <20260903081916.156273-1-f_l_k@t-online.de>
	<20260903081916.156273-6-f_l_k@t-online.de>
	<CAMKF1srr+ZODm06Cp6Evrk3se1rvibqeg6u_6okSTUg_TY7umA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-B6bPsVsQ4OfiAVU6epA3"
X-TOI-EXPURGATEID: 150726::1788499901-D6FFABD0-E7A8B82A/0/0 CLEAN NORMAL
X-TOI-MSGID: 7308945a-e6c6-475a-895e-64e5752eec48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788499903; i=f_l_k@t-online.de;
	bh=AF14FZlsl+cw60hf2oMMoS4cWS9Cf1HyZBqHPDa1UYs=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=E1b4dcdQ+MECpKRl09Rm0YXz2DJu0WdMccK1UyQgYdr1RubdvfMtqOxjofpTsuTs+
	 /4ORTUYDNP4C8Zi0M3TDErXccAsqYmY/MxyS08l9StJk/q+vBNyNYt/OkceYZFtJuX
	 DtQn2U2zcx9qeOZMALptOVZYiQHz+c99UeLFOdFSyJEAFujx5obir2Cgs/39L99dgQ
	 Ut40I7XHTpqVoJz30FoHldI+HMMbKoSK/1Tmio/IBk/bkAUb2I/rcWH0zyj6CfWBUb
	 lCjGrnD/WgKaFyWElcVh4iZzX2ZXHZa6vArAEci334QPiooM0nxrrUwwiQqu9OeEpt
	 pqpJ61GfPre5w==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 05:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129751

--=-B6bPsVsQ4OfiAVU6epA3
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 3 2026 at 07:56:19 -07:00:00, Khem Raj <raj.khem@gmail.com> 
wrote:
> libpeas depends on 'mozjs-128' that needs to be addressed as well.

Sorry for being too late with this


--=-B6bPsVsQ4OfiAVU6epA3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 3 2026 at 07:56:19 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">libpeas depends on&nbsp;'mozjs-128' that needs to be addressed as well.</blockquote><div><br></div><div>Sorry for being too late with this</div></div>
--=-B6bPsVsQ4OfiAVU6epA3--


