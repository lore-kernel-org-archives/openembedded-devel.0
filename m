Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PfsJX-0007Up-VC
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 12:04:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 4225014033
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 11:03:45 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id NXojVYPP4RAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 11:03:44 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 4CA2D1401D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 11:03:44 +0000 (GMT)
Message-ID: <4D3816BC.1010605@xora.org.uk>
Date: Thu, 20 Jan 2011 11:04:28 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>	<4D36A64E.9060804@xora.org.uk>	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>	<1295436662.2540.14.camel@scimitar>	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>	<4D36FE98.3070606@mwester.net>	<AANLkTimMHd-eH9tEL1tUtoUKa+zwX4+9kUdT3k_NP9nG@mail.gmail.com>	<AANLkTimyPb-4pLrbF4ZeFwnh+9WyZtcPY1uXeYBnwUqQ@mail.gmail.com>	<AANLkTinRKmmzUT-6T6_cGR+HHrB6hYFYhdS4GuZHRS+Z@mail.gmail.com>
	<AANLkTin8mbWMymQyNeuf8dtEy6McUJQYTKfhuUgR3Mf8@mail.gmail.com>
In-Reply-To: <AANLkTin8mbWMymQyNeuf8dtEy6McUJQYTKfhuUgR3Mf8@mail.gmail.com>
X-Enigmail-Version: 1.1.1
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Thu, 20 Jan 2011 11:04:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20/01/2011 10:20, Frans Meulenbroeks wrote:
>
> And as said before, as a package maintainer I try to follow upstream
> and support what upstream supports.
> I do not want to take over the role of upstream wrt the package maintenance.
> As a package maintainer I feel it as my task to make sure the version
> from upstream builds in the OE environment, and ideally patches are
> only there to deal with cross build issues, although every once in a
> while a local bugfix is added.
> That is how I see the role of a package maintainer, but others might
> see things differently.
> (btw for toolchain related things I can imagine we want to retain
> older versions for a longer time, especially when there are functional
> changes (I'm especially thinking about autohell))
> And apologies if I sketch the things black and white, but at least
> that makes things clear.
> But also when it becomes to package maintainers tasks there is a gray area.
>
But this is part of the issue, this sort of working is fine for packages
you maintain, but you try and force your opinions on which packages are
relevant to other package maintainers. Go forth and do what you want
with your own little area but at least give some consideration that I
might actually be maintaining the recipes you class as junk.

Graeme



