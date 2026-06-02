Return-Path: <oe@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76B1CD6E5D
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 20:23:32 +0000 (UTC)
Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4656.1780431801196147410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 13:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=pTchMfO8;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.73, mailfrom: oe@myspectrum.nl)
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gVMj26bDmzYf2G
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 22:23:18 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission2.mail.transip.nl (Postfix) with ESMTPSA id 4gVMj23HTnzJjhXw
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 22:23:18 +0200 (CEST)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 484472014F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 20:23:18 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl>
Date: Tue, 2 Jun 2026 22:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: openembedded-devel@lists.openembedded.org
References: <20260530081837.2192126-1-f_l_k@t-online.de>
 <cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1780431798; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=kpCX1yfCxyhI5iPPKMuvhvgVaTfqDPrRvTzEW78nTK4=;
 b=pTchMfO899Qq1zV/CQuyI3UVvi+a3r3Dp2BOvKhtJGYKvhyNOT6BNEGOkMfg1BM9f3WF7z
 agkJ4koAPXO+09E6/vdft2D3e7t+0iCkF8e59h/9XnJPciIH3+T7aHIJasCLLeMTjcFkCP
 ZsOo91IWpHJauey9tgI66xQHWAkYd6a09sQCCsmz4jSzznXVXIwWpXd+4dmj2lSN2fZrCy
 GNVhr30NNCVyHI63WuXYQhTmwJB6W1N9VlavkGRqoe9OBrQWe2rYua88xBg2V4tMiTQtUF
 iB7gXn1O44BBdXWIOFz4O0lVQsoNkc/LB/1QLDe1Vdg+jPfETJGlOdkLS7kTdA==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 20:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127371

Sorry,
> Anyway, the upstream status is not pending,
> but not excepted / closed.
>
Accepted obviously..



