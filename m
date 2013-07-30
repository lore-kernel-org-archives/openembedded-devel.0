Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 75AD36B3F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:15:31 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id cy12so4068819veb.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=3OjI/VzZI5SGqYBaPr0pjuEIOys3mobDolNSaD/CdrY=;
	b=DVMMiZAwAmjqUx7fJvbkZA265lojrQdbO7b43zQ8YLC8MFEd6KM8c2cpV0UH5pkgJz
	1fMrAD3S2hbgWNry1cqPFz931Z3iH7b025qrZs5VSoIOB7nUIHgEbyBXoVNnSx0ydNKV
	7BacLDJPGVv6yNE8fSsqnUWHt0+mP28cOa6GsjtE8aFWS0TGcNw98j9RQOvSBVoi6joH
	DMro2mgIoUMb9m7xO6G3k6U9lgthgDfisTd2aXg63517oNxRXnj2dhjha1yqDhcSwKRC
	F2EQBzewlbW5k6dVCG7dhod26OMEtX0JCv2A4Ldcg94fWjfR9kUaAEuGd3664eXc2WDS
	+IUg==
X-Received: by 10.220.98.68 with SMTP id p4mr10096819vcn.28.1375193731453;
	Tue, 30 Jul 2013 07:15:31 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Tue, 30 Jul 2013 07:14:51 -0700 (PDT)
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E1042EA39@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1374744455-20983-1-git-send-email-B40290@freescale.com>
	<B21730BB6DA1D24B83348D9301EA417E1042EA39@039-SN2MPN1-023.039d.mgd.msft.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 30 Jul 2013 15:14:51 +0100
X-Google-Sender-Auth: tUCMsKfC8WDwV5e_3YJVMobKJ6o
Message-ID: <CANyK_8cA_iJLsfq5R1dgtS6L95zyDz5iNNTcWOYP1LnN36+DZQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-oe][PATCH] iperf: Fix license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2013 14:15:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 29 July 2013 10:45, Guo Chunrong-B40290 <B40290@freescale.com> wrote:
> Hello,
>
> I'd appreciate if someone can review.
>

I'll take a quick look...

> -LICENSE = "NewBSD"
> +LICENSE = "BSD"

Comparing http://sourceforge.net/p/iperf/code/82/tree/trunk/COPYING
and the common licenses in openembedded-core, it looks like
"BSD-2-Clause" would be more accurate. Could you take a look and let
me know if you agree? Currently on the move so can't diff the files
myself.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

