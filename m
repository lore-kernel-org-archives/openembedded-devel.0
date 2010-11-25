Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PLdxJ-0005FB-Vu
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 16:41:54 +0100
Received: by qyk7 with SMTP id 7so2631990qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 07:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=biv6SvyHwkE1RxN6ZfCOqXqjpSnXUYXzAbZyeghjP30=;
	b=JKCSb8tWXMNFEHQD0Gs8M/0mKGyRIjR1UIePjkMuqMX08M2sCoHDREekEX4bHZMNtj
	adlbh4IPoLo2/oZJKhacOLbVgl6KHMmjqCGsN446nIcqYKE9/gMEqZOs10E+yQ3ZDIb0
	xt7Ma938EONsBDJGKk2BjeXCXzyLcM2jEgdzA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=BM9zol6KfFexXyX2Yd3Z7KF1I4EgNublQFNyKVb1thDzTyEzIbL6sGyZ5gAEnKtgNn
	LNYozF70sz0pvpJNH4tNZ3QlCjeFXMW0pbFCjPRludqzKmexNnpNFymxR9qLzp1b2N64
	C1OVxyPQN27KrmDPazNGA8OLFxnZdXJPaWyQw=
Received: by 10.229.110.8 with SMTP id l8mr782207qcp.144.1290699637893; Thu,
	25 Nov 2010 07:40:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Thu, 25 Nov 2010 07:40:17 -0800 (PST)
In-Reply-To: <20101125123845.GO3274@jama>
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
	<4CEE336E.9070306@eukrea.com>
	<AANLkTiktUcmsYsQh-VFJtWTgpyzbQVmLgg7WuxEJkipW@mail.gmail.com>
	<4CEE37DC.5040503@eukrea.com>
	<AANLkTinr=RQ068ABqe8XVsrPpn+iyV9ecFT4n1VuiQTm@mail.gmail.com>
	<4CEE4AB9.8050505@eukrea.com> <20101125123845.GO3274@jama>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Thu, 25 Nov 2010 16:40:17 +0100
Message-ID: <AANLkTi=tM7VYvnfq7+1RHy0mMtvgvxE+Ksc37t4D5vuJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 15:41:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I don't have acces to OE.
Eric can you do that please ?


2010/11/25 Martin Jansa <martin.jansa@gmail.com>

> On Thu, Nov 25, 2010 at 12:38:33PM +0100, Eric B=E9nard wrote:
> > On 25/11/2010 12:12, Sylvain Par=E9 wrote:
> > > I can't find any obj/ directory in
> > >
> SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-=
5.2.1/
> > > but I have an
> > >
> SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-=
5.2.1/src/obj${QT_LIBINFIX}/
> > >
> > here is your problem.
> > QT_LIBINFIX should be "" in your case.
>
> then something like
> QT_DIR_NAME =3D "qt4"
> QT_LIBINFIX =3D ""
>
> is missing in qt4x11.bbclass (it's defined only in qt4e.bbclass).
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

