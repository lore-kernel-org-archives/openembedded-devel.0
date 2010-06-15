Received: from mk-filter-1-a-1.mail.uk.tiscali.com ([212.74.100.52])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <superaorta@gmail.com>) id 1OORFD-0006yW-ON
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 10:11:40 +0200
X-Trace: 421568078/mk-filter-1.mail.uk.tiscali.com/B2C/$b2c-THROTTLED-DYNAMIC/b2c-CUSTOMER-DYNAMIC-IP/79.70.159.171/None/superaorta@gmail.com
X-SBRS: None
X-RemoteIP: 79.70.159.171
X-IP-MAIL-FROM: superaorta@gmail.com
X-SMTP-AUTH: 
X-Originating-Country: GB/UNITED KINGDOM
X-MUA: KMail/1.9.9
X-IP-BHB: Once
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AsEaAArRFkxPRp+r/2dsb2JhbACBOgORGYYMgQCFD3GuIIduLohUhRoE
X-IronPort-AV: E=Sophos;i="4.53,419,1272841200"; d="scan'208";a="421568078"
Received: from 79-70-159-171.dynamic.dsl.as9105.com ([79.70.159.171])
	by smtp.tiscali.co.uk with ESMTP; 15 Jun 2010 09:06:07 +0100
From: superaorta@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 09:06:00 +0100
User-Agent: KMail/1.9.9
References: <201006150815.32214.superaorta@gmail.com>
	<AANLkTimDzDDrBFuMU3HmMSBPblt5bK0HmCOnDbGruvPc@mail.gmail.com>
In-Reply-To: <AANLkTimDzDDrBFuMU3HmMSBPblt5bK0HmCOnDbGruvPc@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201006150906.00827.superaorta@gmail.com>
X-SA-Exim-Connect-IP: 212.74.100.52
X-SA-Exim-Mail-From: superaorta@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: comedi / angstrom
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
X-List-Received-Date: Tue, 15 Jun 2010 08:11:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 15 June 2010 08:22:22 Frans Meulenbroeks wrote:
> 2010/6/15  <superaorta@gmail.com>:
> > I would like to build comedi (www.comedi.org) for my beagle board. From
> > the instructions for comedi, "you will need to havea correctly configured
> > Linux kernel source tree".
> >
> > I have built comedi on many platforms without trouble but I'm completely
> > lost in Angstrom - I have the kernel source (2.6.29 from kernel.org) but
> > I don't
>
> If you are lost in Angstrom better mail to the angstrom mailing list :-)
>
> > know where to find the config files. I have done this on and x86 host:
> > http://www.angstrom-distribution.org/building-angstrom
> >
> > I don't fancy building comedi using bitbake because I have not the
> > slightest
>
> if you do not want to use bitbake the openembedded mailing list does
> not seem to be the proper place to ask questions, as all of oe uses
> bitbake.
>
> > idea how to adapt it to this purpose. The easiest thing seems to me is to
> > find the correctly configures kernel source and config files and install
> > them on the beagleboard then build comedi locally.
>
> bitbake virtual/kernel will build a kernel for you, you might be lucky
> copying over that kernel.
>
Any chance you could offer some useful advice, maybe tell me something helpful 
or something that I don't already know? Like I said, I have a running kernel, 
I just want the source tree and the config files.  Comedi is slightly less 
than trivial to build out of place and the easiest solution is to get the 
kernel source and config files and build it in situ.




