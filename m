Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S855B-0004LJ-2v
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 08:26:45 +0100
Received: by wera1 with SMTP id a1so2515164wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=VJMEDJnCnit5L75dgtw2MwW1DnsWPs1uAp4Opr19ePI=;
	b=lqyzWNOotp9EOAyLJfmTOqIZRrMKYOKs0sN2VvgwUiy1QKDQY8GqUsInmVC4WjMU8R
	qA8k/tVTtijRRzWRdn51aAkfgTUZWZRjYvxgymEwW1p868ALyL55RaXtnYlBeIyjvVMJ
	QLYLghDf6w1Lh72gByzzZ27rWt9CcyrK5cBtIqk/LXcK7HIPDvCKRXjUFMRNyQQTeMPK
	Z/d2Dn9Fyn3JYeUPBSXdKljGMwSJr2Q/23ZauKW2WBQD2bLcX8ECaH4K5VXuGVolGFQe
	fz8P4ehf4Fa67VaJiMkyhRJc9BtG1LH90iq6YpTI2Uq7zelmydzVlYB2nP/Lli/faRsL
	KPgQ==
MIME-Version: 1.0
Received: by 10.180.104.137 with SMTP id ge9mr12810504wib.20.1331795878710;
	Thu, 15 Mar 2012 00:17:58 -0700 (PDT)
Received: by 10.223.101.202 with HTTP; Thu, 15 Mar 2012 00:17:58 -0700 (PDT)
In-Reply-To: <4F610B38.5060309@dynamicdevices.co.uk>
References: <4F610B38.5060309@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 08:17:58 +0100
Message-ID: <CAGiJk9c+bcDHk5MCOE_bRRyi-c9tDy6cjPvFgcrpiXtHpPGOWg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core layer including support for i.MX28
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 07:26:45 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/14 Alex J Lennon <ajlennon@dynamicdevices.co.uk>:
> Hi,

Hi,
>
> I'm trying to begin the migration from oe-classic to oe-core, focussing on
> Freescale's
> i.MX28 and i.MX51. I recall there was i.MX28 kit being demo'd at FOSDEM but
> I can't
> seem to find support anywhere for the i.MX28, which I thought might be in
> meta-fsl-arm?

did the meta-fsl-arm developers merge the meta-freescale repository?
AFAICT there was support for i.MX28 in Andreas git repository:
http://gitorious.org/schnitzeltony-oe-meta/meta-freescale

>
> Can anybody point me in the right direction? (I've half a mind to try adding
> the support
> into meta-fsl-arm myself but that would seem somewhat wasteful if it's
> already been
> done)

The meta-freescale repository might need some work, but it is a starting point.


-- 
Regards
Samuel


