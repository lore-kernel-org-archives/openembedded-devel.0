Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <alain2210@free.fr>) id 1IXhsw-0003EB-Ei
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 20:33:23 +0200
Received: from smtp1-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 8CF761AB30B;
	Tue, 18 Sep 2007 20:29:37 +0200 (CEST)
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 7A56A1AB2DD;
	Tue, 18 Sep 2007 20:29:37 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id 6B776141B0; Tue, 18 Sep 2007 20:29:37 +0200 (CEST)
Received: from AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr
	(AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr [82.123.18.58])
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@212.27.42.70>; Tue, 18 Sep 2007 20:29:37 +0200
Message-ID: <1190140177.46f0191139407@imp.free.fr>
Date: Tue, 18 Sep 2007 20:29:37 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.kabel.utwente.nl>
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
In-Reply-To: <46F01466.4080000@dominion.kabel.utwente.nl>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 82.123.18.58
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: fortran and octave
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2007 18:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Selon Koen Kooi <koen@dominion.kabel.utwente.nl>:

> Alain2210 schreef:
> > Hello,
> >
> > I would like to bitbake octave for org.openembedded.dev.
> > But octave needs fortran ou f2c.
> > It seems that fortran has been remove from gcc-cross_4.1.2.bb (or per=
haps
> > before).
> > So I have tried to
> > 1) add fortran in gcc-cross_4.1.2.bb but I get an error.
> > 2) compile octave with f2c without success. (even with the f2c of the=
 host)
> >
> > So what is the good way to compile octave and/or fortran and/or f2c ?
>
> For gcc 3.4 through 4.1.x fortran is broken for arm (gcc ICEs on compil=
ing
> gcc), Lennert
> Buytenhek had some patches for it, I don't know if they fix and and if =
yes, I
> don't know
> if they are in 4.2.1. I'm firing of a build of 4.2.1 with fortran enabl=
ed
> anyway :)
>

Thanks for the quick answer. I will try 4.2.1

Sincerely,

Alain



