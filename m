Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id B328F621E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 11:02:45 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id g12so9287182oah.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oWxhT9zIV9vonVbOH/ojPXWsAG6EmSRdfen3mO+kRbs=;
	b=Cd7HoabgYRK0KK+gc+6fXQqGuiyCmmfZqCA8jw3+Aw3usYvgLZ8NLNVqKEndgSrYNK
	355czX0xinGX1+/Nowemac87m/RprwZ1Ctq6QpIQFvKW29WUf31KoZ79e4Wr31dVYVbf
	BI6W9DpF+/suY9at1q/83+fYcPxOw9kIHJmraNUpEaABcjL5/QerqCJ9s268Rs1pUF2b
	xAkTsqd4GuNt+CU62z63x2EQRAvqE9DM1nn6tPgUtxLkNw32CGnEz+37ateR6NsrfEVP
	Hnr5BflIIeLIWgw4LDlkRG7fDQ84IBDYZjnVSsdUDzbDsfRK2Wu6qz5+4K3ihv6L7YlE
	ui2g==
MIME-Version: 1.0
X-Received: by 10.60.160.194 with SMTP id xm2mr27890644oeb.82.1373454165702;
	Wed, 10 Jul 2013 04:02:45 -0700 (PDT)
Received: by 10.60.37.65 with HTTP; Wed, 10 Jul 2013 04:02:45 -0700 (PDT)
In-Reply-To: <1373452107-1368-1-git-send-email-B40290@freescale.com>
References: <1373452107-1368-1-git-send-email-B40290@freescale.com>
Date: Wed, 10 Jul 2013 13:02:45 +0200
Message-ID: <CAGiJk9eLz6cwGgWQLZ0Go4di_k85dGDVuH8NEWxBgkDnVNzzAw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: b40527@freescale.com
Subject: Re: [meta-oe][PATCH v2] licences: Add iozone3, SMAIL_GPL, NewBSD
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
X-List-Received-Date: Wed, 10 Jul 2013 11:02:45 -0000
Content-Type: text/plain; charset=UTF-8

2013/7/10 Chunrong Guo <B40290@freescale.com>:
>          *fix the fllowing warning
>          |WARNING:debianutils: No generic license file exists for: SMAIL_GPL in any provider
>          |WARNING:iozone3: No generic license file exists for: iozone3 in any provider
>          |WARNING:iperf: No generic license file exists for: NewBSD in any provider


Hi,

I would recommend to use the generic BSD license from OE-Core for Iperf,



--
Regards
Samuel

