Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <alain2210@free.fr>) id 1IXkli-0002sZ-5V
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2007 23:38:06 +0200
Received: from smtp1-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 83AFE1AB2DD;
	Tue, 18 Sep 2007 23:34:20 +0200 (CEST)
Received: from imp8-g19.free.fr (imp8-g19.free.fr [212.27.42.39])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 69B301AB2D5;
	Tue, 18 Sep 2007 23:34:20 +0200 (CEST)
Received: by imp8-g19.free.fr (Postfix, from userid 33)
	id 26540141A2; Tue, 18 Sep 2007 23:34:20 +0200 (CEST)
Received: from AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr
	(AMontsouris-151-1-21-58.w82-123.abo.wanadoo.fr [82.123.18.58])
	by imp.free.fr (IMP) with HTTP 
	for <alain2210@212.27.42.70>; Tue, 18 Sep 2007 23:34:19 +0200
Message-ID: <1190151259.46f0445be87d7@imp.free.fr>
Date: Tue, 18 Sep 2007 23:34:19 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <k.kooi@student.utwente.nl>
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
	<46F01DC6.6000503@student.utwente.nl>
In-Reply-To: <46F01DC6.6000503@student.utwente.nl>
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
X-List-Received-Date: Tue, 18 Sep 2007 21:38:06 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

> Same old, same old:
>
>
/media/hda4/OE/build/tmp-new/angstrom/work/armv5te-angstrom-linux-uclibcg=
nueabi/gcc-cross-4.2.1-r4/gcc-4.2.1/libgfortran/generated/_mod_i8.F90:
> In function 'specific__mod_i8':
>
/media/hda4/OE/build/tmp-new/angstrom/work/armv5te-angstrom-linux-uclibcg=
nueabi/gcc-cross-4.2.1-r4/gcc-4.2.1/libgfortran/generated/_mod_i8.F90:42:
> internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://gcc.gnu.org/bugs.html> for instructions.

So gcc-cross_4.2.1 with this patch
http://gcc.gnu.org/ml/gcc-patches/2007-05/msg01010.html
is compiling.... (but I get a probleme in staging).

So I wonder if I can patch also the 4.1.2 or if I have to rebuild all my =
oe
tree....

By the way, the angstrom distribution and the openembedded tree are very =
usefull
and in a state that allow to make a quite stable image for my h2200.

Thanks,

Alain


