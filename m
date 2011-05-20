Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QNM50-0000aa-O3
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 11:33:10 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QNM27-0007ui-9j
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 11:30:11 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTi=VUCzOWjZ8bnRHqrnLqsRZypRdxQ@mail.gmail.com>
References: <BANLkTi=sn5n-gdOOFgt6k=PswZHhCe0Mww@mail.gmail.com>
	<BANLkTi=VUCzOWjZ8bnRHqrnLqsRZypRdxQ@mail.gmail.com>
Date: Fri, 20 May 2011 10:30:09 +0100
Message-ID: <1305883809.15084.3.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: vlc failed to build here ( palmpre2, SHR ) -fPIC thing
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
X-List-Received-Date: Fri, 20 May 2011 09:33:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What are the ways that you've already tried?

p.

On Fri, 2011-05-20 at 10:48 +0200, Sylvain Par=C3=A9 wrote:
> Please does someone has a clue  about this   -fpic flag ?
>=20
>=20
> 2011/5/17 Sylvain Par=C3=A9 <sylvain.pare@gmail.com>
>=20
> > Hello,
> >
> > I have refreesh my build here so I tried again to build VLC for my palm
> > pre2 but It does not succeed here :
> >
> > libliveMedia.a: relocation R_ARM_MOVW_ABS_NC against `a local symbol' c=
an
> > not be used when making a shared object; recompile with -fPIC
> > |
> > /home/sylvain/dev/SHR-Build/shr-unstable/tmp/sysroots/armv7a-oe-linux-g=
nueabi/usr/lib/libliveMedia.a:
> > could not read symbols: Bad value
> > | collect2: ld returned 1 exit status
> >
> > long version http://pastebin.com/Cvd6pnuj
> >
> > I have tried several ways to pass -fPIC argument to live555 recipe but
> > without any success..
> >
> > Does some one has a clue ?
> >
> > Thanks by advance.
> >
> > Regards,
> >
> > Sylvain
> >
> >
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




