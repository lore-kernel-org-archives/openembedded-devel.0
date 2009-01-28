Received: from [85.37.16.25] (helo=smtpout24.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1LS7A3-0006wT-0u
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 10:56:43 +0100
Received: from FBCMFE02B08.fbc.local ([192.168.30.96]) by smtpout24.attiva.biz
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 28 Jan 2009 10:49:09 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B08.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 28 Jan 2009 10:48:59 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <497F0D92.4040904@gmail.com>
References: <1233059140.7818.4.camel@ubuntu2>  <497F0D92.4040904@gmail.com>
Date: Wed, 28 Jan 2009 10:49:01 +0100
Message-Id: <1233136141.7444.3.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 28 Jan 2009 09:48:59.0434 (UTC)
	FILETIME=[A4C030A0:01C9812D]
Subject: Re: Build problems
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
X-List-Received-Date: Wed, 28 Jan 2009 09:56:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

OK, I have built the image wihout errors, thank you.

Now, what I have to do to create a bootable compact flash with the
image?

Thanks in advance,
Paolo


On mar, 2009-01-27 at 14:35 +0100, Marco Cavallini wrote:
> Paolo Cremonese ha scritto:
> > Hi all.
> > I'm new in Openembedded.
> > I'm trying to build an image ( bitbake opie-image), and I get errors.
> > In the following the output of bitbake:
> > 
> > Can anyone help me?
> > 
> > Thanks in advance,
> > Paolo
> > 
> > 
> > 
> > NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
> > to increase performance.
> > NOTE: Handling BitBake files: \ (6411/6411) [100 %]
> > NOTE: Parsing finished. 6140 cached, 0 parsed, 271 skipped, 0 masked.
> > NOTE: Cache is clean, not saving.
> > NOTE: build 200901271107: started
> > 
> > OE Build Configuration:
> > BB_VERSION        = "1.8.13"
> > METADATA_BRANCH   = "org.openembedded.dev"
> > METADATA_REVISION = "a41bdd6cda499d2629ce2a156348620b7ab7afc4"
> > TARGET_ARCH       = "i686"
> > TARGET_OS         = "linux"
> > MACHINE           = "i686-generic"
> > DISTRO            = "minimal"
> > DISTRO_VERSION    = ".dev-snapshot-20090127"
> > TARGET_FPU        = ""
> 
> It might be worth trying with "bitbake minimal-image" to start with,
> just to see if basic system works.
> I just built an i586-generic angstrom-2008.1 DISTRO with the
> org.openembedded.dev branch and it works.
> 
> Ciao
> --
> Marco Cavallini | KOAN sas | Bergamo - Italia
>  embedded and real-time software engineering
> Phone:+39-035-255.235 - Fax:+39-178-22.39.748
>       http://www.KoanSoftware.com
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



