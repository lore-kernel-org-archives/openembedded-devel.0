Received: from [212.27.42.64] (helo=smtp7-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <alain2210@free.fr>) id 1J2NWX-0003cr-96
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 10:05:05 +0100
Received: from smtp7-g19.free.fr (localhost [127.0.0.1])
	by smtp7-g19.free.fr (Postfix) with ESMTP id 7167A322856;
	Wed, 12 Dec 2007 10:00:43 +0100 (CET)
Received: from imp5-g19.free.fr (imp5-g19.free.fr [212.27.42.5])
	by smtp7-g19.free.fr (Postfix) with ESMTP id 55CA3322850;
	Wed, 12 Dec 2007 10:00:43 +0100 (CET)
Received: by imp5-g19.free.fr (Postfix, from userid 33)
	id 4B5CF422F; Wed, 12 Dec 2007 11:00:43 +0100 (CET)
Received: from AMontsouris-151-1-31-127.w82-123.abo.wanadoo.fr
	(AMontsouris-151-1-31-127.w82-123.abo.wanadoo.fr [82.123.28.127]) 
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@212.27.42.70>; Wed, 12 Dec 2007 11:00:42 +0100
Message-ID: <1197453642.475fb14ab7dc9@imp.free.fr>
Date: Wed, 12 Dec 2007 11:00:42 +0100
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org,
	Junqian Gordon Xu <xjqian@gmail.com>
References: <1197404752.475ef250762ff@imp.free.fr> <475F8A75.9070902@gmail.com>
In-Reply-To: <475F8A75.9070902@gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 82.123.28.127
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: version of octave
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
X-List-Received-Date: Wed, 12 Dec 2007 09:05:07 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

> > with openembedded/angstrom, the version of octave that is tried to bu=
ild
> (fetch
> > failed)
> > is 2.9.17. Two months ago, I have built 2.9.14 and 2.1.73. Only 2.1.7=
3 was
> > working on my ipaq (the 2.9.14 was using all the cpu but doing nothin=
g).
> >
> > Is is possible to put 2.1.73 as preferred version in openembedded/ang=
strom
> ?
>
> Committed 2.1.73 as preferred version for Angstrom. I'm glad 2.1.73
> worked for you. 2.9.14 never worked, so it's good to fix that anyway.

Tanks.

>
> I've updated the 2.9.x recipie to 2.9.19, which should work fine now.
> Note, the octave package is more modularized in 2.9.x, so please check
> the library dependencies and let me know if anything is missing.

Now that 2.1.73 is the preferred version, how can I bitbake octave_2.9.19=
 ?

Sincerely,

Alain


