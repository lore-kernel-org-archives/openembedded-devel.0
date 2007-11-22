Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1Iv118-00072r-Kw
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 02:38:10 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 438A328C013; Thu, 22 Nov 2007 02:29:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180128148.adsl.alicedsl.de [85.180.128.148])
	by srv043.dedi23.de (Postfix) with ESMTP id 1C83A28C012;
	Thu, 22 Nov 2007 02:29:32 +0100 (CET)
Date: Thu, 22 Nov 2007 02:35:48 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <774364350.20071122023548@vanille-media.de>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <4743C5B8.4030209@whitby.id.au>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <617697824.20071121042405@gmail.com>
	<4743C5B8.4030209@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Getting Started -Makefile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2007 01:38:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> Paul Sokolovsky wrote:
>>    Why not default? Well, because what make builds is usually ones to
>> tens of megabytes, while bitbake builds tens to hundreds gigabytes.
>> Those who're brave to undertake such endeavour, are expected to get
>> some understanding of what they're going to be thru by learning and
>> doing some setup with their own hands.

> And therein lies the rub.  The reason why the Makefiles came about is
> because there is a large number of distribution users who are forced to
> use OE (cause it is the only way to develop applications for or build
> custom images for a certain platform), but they have *no* interest in
> understanding how to build tens to hundreds of gigabytes of stuff with
> bitbake.  They are application developers and image customisers, not
> distribution developers.

Guilty as charged. Lets try not to force these people to use OE -- we
can do this by releasing prebuilt toolchains. I'm going to start with
releasing an OpenMoko toolchain next week.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



