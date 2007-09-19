Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <alain2210@free.fr>) id 1IXvP5-0000jj-FI
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 10:59:27 +0200
Received: from smtp1-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 2CEDB1AB2BE;
	Wed, 19 Sep 2007 10:55:39 +0200 (CEST)
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 16ACF1AB2BB;
	Wed, 19 Sep 2007 10:55:39 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id 08EE3141C5; Wed, 19 Sep 2007 10:55:39 +0200 (CEST)
Received: from AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr
	(AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr [82.123.18.58])
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@212.27.42.70>; Wed, 19 Sep 2007 10:55:38 +0200
Message-ID: <1190192138.46f0e40ab7964@imp.free.fr>
Date: Wed, 19 Sep 2007 10:55:38 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org, Alain2210 <alain2210@free.fr>
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
	<46F01DC6.6000503@student.utwente.nl>
	<1190151259.46f0445be87d7@imp.free.fr>
In-Reply-To: <1190151259.46f0445be87d7@imp.free.fr>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 82.123.18.58
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 19 Sep 2007 08:59:27 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

> So gcc-cross_4.2.1 with this patch
> http://gcc.gnu.org/ml/gcc-patches/2007-05/msg01010.html
> is compiling.... (but I get a probleme in staging).

With this patch and FORTRAN =3D ",fortran" in gcc_4.1.2.bb,
Building of gcc-cross__4.1.2.bb works and gfortran is working.

Now, I'm building octave.

Sincerely,

Alain


