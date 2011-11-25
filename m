Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RTvlA-0007D7-Br
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 14:24:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DF64F3156595
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 14:17:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id oYmq6iEkGbUL
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 14:17:23 +0100 (CET)
Received: from [172.22.22.61] (drms-590c4dea.pool.mediaWays.net [89.12.77.234])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 539533156591
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 14:17:23 +0100 (CET)
Message-ID: <4ECF9562.30503@opendreambox.org>
Date: Fri, 25 Nov 2011 14:17:22 +0100
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
	<4ECE81D3.2010603@opendreambox.org>
	<CAP9ODKrrnc8Op+At6CH2EJbUkTPafGuS=6wMmBXTFsBhA90oTA@mail.gmail.com>
In-Reply-To: <CAP9ODKrrnc8Op+At6CH2EJbUkTPafGuS=6wMmBXTFsBhA90oTA@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 Nov 2011 13:24:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.11.2011 19:43, Otavio Salvador wrote:
> On Thu, Nov 24, 2011 at 15:41, Andreas Oberritter <obi@opendreambox.org>wrote:
> 
>> ...
>>
>> I would like stronger arguments for why master and not 2011.03 release
>>> branch ?
>>
>> Obviously, you can push a changeset to master, wait for someone to
>> complain about a bug, fix the bug, wait for silence, merge it into 2011.03.
>>
> 
> Sure not; 2011.03 is for bugfixes not huge changesets with new things.

Who said "huge" or "new"? Even bugfixes need testing. That's why
changesets should go
through master after all.

>> Would you prefer experimental changesets in 2011.03?
>>
> 
> This is not going to happen  has 2011.03 is not a playground but a stable
>  branch.

Exactly. That's what master is good for. Everything that hasn't been
tested in many environments is experimental by nature. You simply can't
commit anything to 2011.03 directly, for it would be experimental. It
has to be tested somewhere. That's master. (Yes, Koen, we know, OE-core
is an option, but not for some of us.)

> You're confusing development and maintainence branch meaning here.

Obviously not.

Regards,
Andreas


