Received: from [64.233.162.236] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hh7qn-0008Oq-A1
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 19:33:49 +0200
Received: by nz-out-0506.google.com with SMTP id m22so756910nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 10:24:58 -0700 (PDT)
Received: by 10.114.58.1 with SMTP id g1mr697002waa.1177608297635;
	Thu, 26 Apr 2007 10:24:57 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Thu, 26 Apr 2007 10:24:57 -0700 (PDT)
Message-ID: <432beae0704261024u5675a177ocef202153b6e0cc9@mail.gmail.com>
Date: Thu, 26 Apr 2007 10:24:57 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4630BC8E.4070408@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1177589176.5843.3.camel@localhost.localdomain>
	<432beae0704260732j448ddbdfl4155364f62d69c5e@mail.gmail.com>
	<4630BC8E.4070408@dominion.kabel.utwente.nl>
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake 1.8.2 released!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 17:33:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/26/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Justin Patrin schreef:
> > On 4/26/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> >> Bitbake 1.8.2 has been released.
> >>
> >> http://prdownload.berlios.de/bitbake/bitbake-1.8.2.tar.gz
> >>
> >> This release is primarily a bugfix release. It contains several bugfixes
> >> and minor improvements over the 1.8.0 release and should be used instead
> >> of 1.8.0 in all cases. Specifically, it addresses several dependency
> >> problems that were identified in the 1.8.0 release. See the Changelog in
> >> the release for a more comprehensive list of changes.
> >>
> >> Thanks to Holger for the release guide once again.
> >>
> >
> > Hmmm...I see no checkins regarding fixing the SRCDATE handling so I'd
> > have to assume that this release still has this major bug. (which of
> > course makes bitbake 1.8 unusable)
> >
> > http://bugs.openembedded.org/show_bug.cgi?id=2133
>
> Try actually reading that bugreport
>

Ah. Perhaps the bug should have been closed or assigned then. Or even
switched to OpenEmbedded instead of bitbake.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGMLyOMkyGM64RGpERAkZGAJ9pNMdZbU+T9Ni9TOt32ecAVGzLjQCglXyg
> 9ceY6vRA+42zmzYWymTA6PQ=
> =X8V/
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Justin Patrin


