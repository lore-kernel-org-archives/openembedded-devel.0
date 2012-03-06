Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S4uRi-0007TQ-NL
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 14:28:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1D9823159D11
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2012 14:20:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id be1h6EJqZDdz
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2012 14:20:10 +0100 (CET)
Received: from [172.22.22.61] (drms-590cf39a.pool.mediaWays.net
	[89.12.243.154])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3B2AE3159D0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2012 14:20:10 +0100 (CET)
Message-ID: <4F560F07.9040704@opendreambox.org>
Date: Tue, 06 Mar 2012 14:20:07 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1330986957-24272-1-git-send-email-obi@opendreambox.org>
	<jj4jcv$dnp$1@dough.gmane.org> <4F560287.70904@opendreambox.org>
	<CAP9ODKpWFTH4ELpO5zfOJkOwY6w7Bzqb=mHe6_oyLMmViRCxZg@mail.gmail.com>
In-Reply-To: <CAP9ODKpWFTH4ELpO5zfOJkOwY6w7Bzqb=mHe6_oyLMmViRCxZg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] udev: consolekit package requires x11
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
X-List-Received-Date: Tue, 06 Mar 2012 13:28:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06.03.2012 14:01, Otavio Salvador wrote:
> On Tue, Mar 6, 2012 at 09:26, Andreas Oberritter <obi@opendreambox.org> wrote:
>> I don't thinks so, because with x11 nothing changes and without x11 udev
>> couldn't be built before (this is what the patch addresses).
>>
>> Albeit, I'm going to send a patch with bumped PRs.
> 
> I think it is always safe to bump PR so it can trigger, if it is the
> case,  a regression as soon as possible otherwise a subtle change chan
> break stuff and being unnoticed for loooong time.

Well, I don't share your opinion, but I guess it would save quite some
of my time submitting patches if I just blindly bumped every PR, no
matter whether the patch changes existing packages or not.

AFAIR, modified content of packages was the main criterion for PR bumps
in OE-classic.

Regards,
Andreas


