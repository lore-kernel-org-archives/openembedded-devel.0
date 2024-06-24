Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD698C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 07:57:59 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.241])
 by mx.groups.io with SMTP id smtpd.web11.135418.1719215873699166052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=T+/lbgNP;
 spf=pass (domain: freemail.hu, ip: 46.107.16.241, mailfrom: egyszeregy@freemail.hu)
Received: from [192.168.0.16] (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4W70gg08mGz6sP;
	Mon, 24 Jun 2024 09:57:51 +0200 (CEST)
Message-ID: <892e72cd-27ae-4d77-bd1e-1bdbc96d3e4f@freemail.hu>
Date: Mon, 24 Jun 2024 09:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][master][scarthgap][PATCH] c-ares: Update SRC tarball
 path
To: openembedded-devel@lists.openembedded.org, vanusuri@mvista.com,
 raj.khem@gmail.com
References: <20240623170311.1504-1-egyszeregy@freemail.hu>
Content-Language: hu, en-US
From: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
In-Reply-To: <20240623170311.1504-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1719215871;
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 07:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111000

	s=20181004; d=freemail.hu;

	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;

	l=81; bh=a8zPafIcoauC5yQIfBC7gM10HTYUAxf0/QfqDYrWBOA=;

	b=T+/lbgNP0HPA/vMdnGJSpbZMJ/GT/U1973YOVcKnSsM+0ouuMzLOXdpnP3sFXzIx

	0APbdeyP+kJJTdActAgH06tbz6i8JE8VVoRMb9AaeErRS7oFgK02zdXPUXnUcvSsOK2

	ANmEqbAJHEvQg9/ZOKgDOYh2GOM84EHN5Tdt+ljeehl+AZzDH9RS86ASlnBhlSViPia

	7kSiwArBPvmR3QfQCE0ZHVjcMymugAEvDlTPapEzv1tDJuSckYloC7qrEBqNi7z2Ese

	Y9hDzxO0bdqVq4Kvbm5FIFpu61sSWIAznIOZnozYw7Fj7bbrd38jOZTKMAxGUkJQTZS

	70WzwySzag==

Can you backport "c-ares: Update SRC tarball path" patch to scarthgap LTS also?


