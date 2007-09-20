Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <alain2210@free.fr>) id 1IYID0-00011p-CZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2007 11:20:30 +0200
Received: from smtp1-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp1-g19.free.fr (Postfix) with ESMTP id E9A6B1AB2B1;
	Thu, 20 Sep 2007 11:16:35 +0200 (CEST)
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp1-g19.free.fr (Postfix) with ESMTP id BA0061AB2EB;
	Thu, 20 Sep 2007 11:16:35 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id 68307141DC; Thu, 20 Sep 2007 11:16:35 +0200 (CEST)
Received: from AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr
	(AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr [82.123.18.58])
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@212.27.42.70>; Thu, 20 Sep 2007 11:16:35 +0200
Message-ID: <1190279795.46f23a7336813@imp.free.fr>
Date: Thu, 20 Sep 2007 11:16:35 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <k.kooi@student.utwente.nl>
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
	<46F01DC6.6000503@student.utwente.nl>
	<1190151259.46f0445be87d7@imp.free.fr>
	<1190192138.46f0e40ab7964@imp.free.fr>
	<46F0F884.2040805@student.utwente.nl>
	<46F103AA.2070205@student.utwente.nl>
In-Reply-To: <46F103AA.2070205@student.utwente.nl>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 82.123.18.58
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Thu, 20 Sep 2007 09:20:31 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

> > you need to have my second commit to get octave working on the device=
,
> because it wasn't
> > getting packaged.
> >
>
> 'it' being libgfortran of course, not octave.

Thanks, now I can build and use octave. The 2.1.71 does not build.

I have tried two versions : the latest stable one :
2.1.73 (I have only duplicated the octave_2.1.71.bb to octave_2.1.73.bb)
and the 2.9.14 (which is in the way of version 3). I have had some proble=
me with
install step
of build 2.9.14.

But on my h2200 the 2.9.14 is not usable. So the good version seems to be
2.7.13.

Sincerely,

Alain


