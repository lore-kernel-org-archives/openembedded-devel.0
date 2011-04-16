Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QB490-0003Ho-Ga
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:58:30 +0200
Received: by yia13 with SMTP id 13so1425937yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cXeVy0GSH9pouKgFHs1mcza5P5S+GphrGYa7irGX23k=;
	b=oC0JNRCNccxDYZg48zqAUQapAug3AuSM3UqsCZ34wJptTsSWyp6VwOtPsPlOleERRU
	8bM/Rk1mkN/cER0gxh/O3oBW63q56+s8pGS40jWF4P+wvKRawpeV5TtMAk8rr1yGu3MP
	FDnYjN4tcAzB0wUeVrVlAuRqtqu/DDw2tuREM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ixR3jDSe3Wuc6b5EroMtkRySpqwr+n4VpxBXySXNQ7nnmIlE7bcoBvTkREZNaEMTYU
	K02frykEHETa0kKTcMvIEZZ7XeYLUFAiQ6tCh3dWjDdpssONUcxqFggehzvEKxpBbXiA
	d7woRj61aHmqPtEHSh7/QhhfuffnZkqyAGu4M=
MIME-Version: 1.0
Received: by 10.236.176.42 with SMTP id a30mr1781482yhm.153.1302954969578;
	Sat, 16 Apr 2011 04:56:09 -0700 (PDT)
Received: by 10.146.83.11 with HTTP; Sat, 16 Apr 2011 04:56:09 -0700 (PDT)
In-Reply-To: <iobstd$780$1@dough.gmane.org>
References: <cover.1302763397.git.Martin.Jansa@gmail.com>
	<iobstd$780$1@dough.gmane.org>
Date: Sat, 16 Apr 2011 13:56:09 +0200
Message-ID: <BANLkTinWHPZpEKiHwKys5CZWyZ5VGqCCrQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe] [PATCHv2 0/1] Pull request #6
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
X-List-Received-Date: Sat, 16 Apr 2011 11:58:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks :) sending another...

On Sat, Apr 16, 2011 at 1:01 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-04-11 08:46, Martin Jansa wrote:
>> Small fix for mesa-xlib.
>> FILESPATHPKG support in oe-core would be nice.
>>
>> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>> =A0 Branch: jama/meta-oe
>> =A0 Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta=
-oe
>>
>> Thanks,
>> =A0 =A0 Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>
>>
>> Martin Jansa (1):
>> =A0 mesa-xlib: fix FILESPATH
>>
>> =A0meta-oe/recipes-graphics/mesa/mesa-xlib.inc | =A0 =A05 ++++-
>> =A01 files changed, 4 insertions(+), 1 deletions(-)
>>
>
> Thanks, applied
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNqXbtMkyGM64RGpERAljBAJ48y1wJwz2PHxiLei2jeUkgi3wkzACglAKq
> 6xu1E+/7CDJMfuDH4IFOpKs=3D
> =3DGdHF
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


