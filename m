Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RTdPJ-0005QL-B9
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 18:48:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1EB5A3156100
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 18:41:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id LVMhcX4N9xyP
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 18:41:40 +0100 (CET)
Received: from [172.22.22.61] (drms-4d0150b5.pool.mediaWays.net [77.1.80.181])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 24DE031560E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 18:41:40 +0100 (CET)
Message-ID: <4ECE81D3.2010603@opendreambox.org>
Date: Thu, 24 Nov 2011 18:41:39 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20111031 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
	<CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
	<20111124170654.GA28572@sakrah.homelinux.org>
In-Reply-To: <20111124170654.GA28572@sakrah.homelinux.org>
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 17:48:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.11.2011 18:06, Khem Raj wrote:
> On (24/11/11 10:31), Frans Meulenbroeks wrote:
>> 2011/11/24 Koen Kooi <koen@dominion.thruhere.net>
>>
>>>
>>>
>>> OE .dev will go read-only soon, If you need an OE-classic setup,
>>> 2011.03-maintenance is there for you.
>>>
>>
>> As stated before there are still people using .dev and committing to it
>> [1], and there are people interested in keeping it that way for a while.
>> So as it stands I suggest to keep it open for a while for those that still
>> are interested to use it.
> 
> I would suggest that people interested in oe classic should use 2011.03
> branch since its maintained and tested regularly. Its in their best
> interest too since there are people behind the branch and it gets
> regular bug fixes thats not true for master.

I guess most people using OE are old enough to know better about their
own interests.

> I would like stronger arguments for why master and not 2011.03 release
> branch ?

Obviously, you can push a changeset to master, wait for someone to
complain about a bug, fix the bug, wait for silence, merge it into 2011.03.

Would you prefer experimental changesets in 2011.03?

Regards,
Andreas

P.S.: I'd really like to switch to oe-core, but at this time it's
impossible. I'm not multithreaded. Closing master won't make me switch
faster, but just annoy me. You'll just force me to keep any bugfixes and
enhancements in my own layer, so that no other body can benefit from them.


