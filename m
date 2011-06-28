Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rcvengr2@gmail.com>) id 1QbZtM-0000v9-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 17:07:56 +0200
Received: by bwf20 with SMTP id 20so312998bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=nnf5EmFb9f/hCGEQ9zW8GxaYCzKf92qcXY68kkczuOo=;
	b=QHefSpqnxzzs+RM/qiBv4F67lTlEJlojDB1/zL1r6TtRYOMpDqCCrKFeRnbV5IgAu1
	wyhBvvLEIddIRRYx9fhalh1rYEGyatphEkCsk18BjqdfaSelfjSDrPRKLVXBA3lbaXjn
	fl7oAXeDBjInXILP5TSRCMZTsP5kxmQ7AVnvY=
Received: by 10.204.14.144 with SMTP id g16mr5740481bka.34.1309273453126; Tue,
	28 Jun 2011 08:04:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.153.212 with HTTP; Tue, 28 Jun 2011 08:03:53 -0700 (PDT)
In-Reply-To: <iubtnm$jkv$1@dough.gmane.org>
References: <201104102145.44766.patda293@student.liu.se>
	<1309207347.21379.147.camel@mattotaupa>
	<iubtnm$jkv$1@dough.gmane.org>
From: Bob Cvengros <rcvengr2@gmail.com>
Date: Tue, 28 Jun 2011 10:03:53 -0500
Message-ID: <BANLkTi=yptqScBcJh87PYiyNMsXerAV1OA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: python-numpy prone to use host libraries
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
X-List-Received-Date: Tue, 28 Jun 2011 15:07:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Does that mean that numpy is a completely broken package, or is that a way
to hack it to make it work? If it is broken and will stay that way, why
don't we remove it from the recipe list? If that is the case then it's just
misleading.

Thanks,
Bob

On Tue, Jun 28, 2011 at 1:52 AM, Koen Kooi <koen@dominion.thruhere.net>wrot=
e:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-06-11 22:42, Paul Menzel wrote:
> > Dear Patrik,
> >
> >
> > Am Sonntag, den 10.04.2011, 21:45 +0200 schrieb Patrik Dahlstr=F6m
> (student):
> >
> > [=85]
> >
> >> I am however uncertain on how to proceed with this and could use some
> >> assistance.
> >
> > did you find a =93generic=94 solution for this problem?
>
> It requires redoing the numpy buildsystem, it is broken by design. I
> tried to teach it about crosscompiling and sysroots last year, but gave
> up after a few days :(
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOCXo2MkyGM64RGpERAggYAJ0VMl1Ttg0QGqNCrmBhdlhnp9yPzgCgldQf
> d5EbEv+2sn1ssE10DGkigsM=3D
> =3DSx4L
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
University of Illinois at Urbana-Champaign
Electrical Engineering

rcvengr2@illinois.edu
(630) 306-4018

