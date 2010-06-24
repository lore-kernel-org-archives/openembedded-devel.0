Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORo7e-0003cM-GU
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:15:28 +0200
Received: by pvg3 with SMTP id 3so1050258pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RvlAT+Y8n/CdQEm7JnCNVRVBo7rmN3mRvrXzlX/7xFo=;
	b=HKBaLvOowMlcG1Yk7w6meuKtA4Bp+jGwertxG3laayg75wmOhfJqOSdZxtQCHX+tdx
	J+Eds2cXg1+sa7ADANrxpiiGDAo+sXmuImD80Qwv4plxZOg2f+mGXMU8VKogaUzxO6cv
	bh8UIRJ+7r0b69pE/Wh1tIY+HQ8wDu6p05doc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NMmb+S8JVWWzknLym2DqQfyIn9if3XTtYERzFzIUhuQoC4AL8fcwdDIc8cgpKwWmxn
	jmQeqEoO5EjggHIIRICXSWLCpVbA+ynzOcv75OKflR35W5gOPqB/xYEXsSvm6YqYtzgg
	PS/zett9qB2C14Vf6osB7s9krZdtWB5bKSuJg=
Received: by 10.115.66.30 with SMTP id t30mr9630723wak.161.1277392137279;
	Thu, 24 Jun 2010 08:08:57 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d20sm52358263waa.15.2010.06.24.08.08.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:08:55 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:10:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624151003.GA28292@gmail.com>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
	<20100623172352.GC5535@gmail.com>
	<AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
	<hvv8d5$skd$1@dough.gmane.org>
	<AANLkTin7qT3wbMl8A-KCaEwEZYiLzcFB68xiM0nrN6uZ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin7qT3wbMl8A-KCaEwEZYiLzcFB68xiM0nrN6uZ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
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
X-List-Received-Date: Thu, 24 Jun 2010 15:16:34 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:16:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 13:23), Frans Meulenbroeks wrote:
> 2010/6/24 Koen Kooi <k.kooi@student.utwente.nl>:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 23-06-10 22:04, Frans Meulenbroeks wrote:
> >
> >> I can pin in sane-toolchain, but only a few distro's seem to use that.
> >> For now I think it is probably best to have gcc-nios recipes and
> >> define virtual/gcc in the machine configurations. (haven't really seen
> >> objections to that,
> >
> > I object to that. Nios is no more special than avr32 or blackfin in this
> > regard.
> 
> objection noted.
> btw: avr and bfin are supported gcc architectures, whereas nios2 isn't.

well nios2 has patches which are not upstream fully same is true for avr
and bfin too. 

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


