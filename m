Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IQrqy-00025L-Dc
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2007 23:47:07 +0200
Received: from pd9538285.dip0.t-ipconnect.de ([217.83.130.133]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IQroy-00033i-Ve
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2007 23:45:05 +0200
Message-ID: <46D739F5.1090304@klever.net>
Date: Thu, 30 Aug 2007 23:43:17 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070815)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1187692103.6234.7.camel@localhost.localdomain>	<46CC3773.8010707@dominion.kabel.utwente.nl>	<109919.20070822152350@vanille-media.de>	<c384c5ea0708291421p418dc698vdda76fa4deabcbbf@mail.gmail.com>	<1188425104.6238.51.camel@localhost.localdomain>
	<c384c5ea0708301347j29cbd93cu2cc1c27e012c09a0@mail.gmail.com>
In-Reply-To: <c384c5ea0708301347j29cbd93cu2cc1c27e012c09a0@mail.gmail.com>
Subject: Re: RFC: Upgrade OE.dev to bitbake 1.8.8
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
X-List-Received-Date: Thu, 30 Aug 2007 21:47:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>>> If not yet, I would propose to tag the OE repository with a tag like
>>> "PRE-BITBAKE-1_8_8" or whatever is supported/desired for mtn/oe.
>> $ cat conf/sanity.conf | grep VER
>> BB_MIN_VERSION = "1.8.5"
>>
> This describes that, given a OE checkout, which bitbake I need minimally.
> 
> Now, suppose I have a given bitbake version, how do I find out which
> OE revision should work with it?

mtn log? ;-)

> My proposal is to tag the OE tree on 2007-09-03.

It's not that I object the tag, but what's the use of it? I mean, I 
don't think OE is something you may possibly want to stick to old 
revision of?

Love,
H


