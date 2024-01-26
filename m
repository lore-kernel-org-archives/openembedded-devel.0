Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190A1C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:09:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3598.1706288973244765058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 126D540C6C;
	Fri, 26 Jan 2024 17:09:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jekV9NKM15io; Fri, 26 Jan 2024 17:09:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D796040AE9;
	Fri, 26 Jan 2024 17:09:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 958DC163DEC; Fri, 26 Jan 2024 12:09:28 -0500 (EST)
Date: Fri, 26 Jan 2024 12:09:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: f_l_k@t-online.de
Cc: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [oe] [PATCH] libcamera: update 0.1.0 -> 0.2.0
Message-ID: <20240126170928.GI18608@denix.org>
References: <20240124215938.2030548-1-denis@denix.org>
 <CAMKF1srAw3TyPtG1bS+65C9ZvgZkE6scF4t06ACxB+BLXAAC5Q@mail.gmail.com>
 <U85V7S.N2LYSF7N6M4M@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <U85V7S.N2LYSF7N6M4M@t-online.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 17:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108463

On Fri, Jan 26, 2024 at 11:02:54AM +0100, f_l_k@t-online.de wrote:
> On Thu, Jan 25 2024 at 08:53:32 PM -08:00:00, Khem Raj
> <raj.khem@gmail.com> wrote:
> >seeing this build error on qemux86/clang
> 
> I also had this issue with gcc and sent a fix for it

Thanks for backporting a fix for pipewire!

-- 
Denys

