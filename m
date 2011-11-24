Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTclB-0004Dg-Jz
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 18:06:53 +0100
Received: by yenm2 with SMTP id m2so2761409yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2hbh2FHEb8r4pHhQ2HjzxSsDo9na5EgubMprWtHqUP0=;
	b=CZewJoVuIo3srNPFjBVOOygy0oeHkiawKPo8oe2zb9Q/o2xQjPsG9boBqE0hL5wasb
	de2NcLqcnbumVRQmh1Tkhj0US24hRdn2IBqcpp1PKRxQ3SZ+zkFWDs0QqbZ5Ss0U1scq
	3M9PyjJvKT1N843rY9wj8sXuJZlR6Ky7ZodP8=
Received: by 10.50.194.231 with SMTP id hz7mr36877264igc.7.1322154019461;
	Thu, 24 Nov 2011 09:00:19 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l28sm89302915ibc.3.2011.11.24.09.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 09:00:15 -0800 (PST)
Date: Thu, 24 Nov 2011 09:06:54 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111124170654.GA28572@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
	<CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 24 Nov 2011 17:06:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/11/11 10:31), Frans Meulenbroeks wrote:
> 2011/11/24 Koen Kooi <koen@dominion.thruhere.net>
> 
> >
> >
> > OE .dev will go read-only soon, If you need an OE-classic setup,
> > 2011.03-maintenance is there for you.
> >
> 
> As stated before there are still people using .dev and committing to it
> [1], and there are people interested in keeping it that way for a while.
> So as it stands I suggest to keep it open for a while for those that still
> are interested to use it.

I would suggest that people interested in oe classic should use 2011.03
branch since its maintained and tested regularly. Its in their best
interest too since there are people behind the branch and it gets
regular bug fixes thats not true for master.

I would like stronger arguments for why master and not 2011.03 release
branch ?

-Khem


