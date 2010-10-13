Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P65nN-00008h-6B
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 20:11:21 +0200
Received: by gya1 with SMTP id 1so1128698gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pT1tYTyawrhrhbuD7nQOLJI8NrNaLhI1HpHP3eLLZc4=;
	b=LmjveB/kYt/Ar8N46zedQhBGXGbbj4LEZC9Fljfs9V/g9EID42kvVQsdSdYCc8vKnf
	ii8d1lKghyaLYPSzHPJ38k/8SaGb4RCgwe53FdrBh8iTI/IA3C6e7Kjsuf973xWAm0n0
	RKv1kN5oYuLgNPcWIRwCqGoU8r+lRafWYeTxk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oxAoHoL+yIaBoZdj8z39O9jNisgCE4QPa87CvhHlAGZ9WXWQ9dhY3GoeQhfrMHUOz6
	SGRbvFVaDeCofi9vw67imsU/t48mbhteUzjEbCYcN9/JSt0azx0uq3arZyyQtk3YOojP
	SItsg481LF6UJztOAFp8mmZjfzq9HGYTNN89A=
Received: by 10.90.55.18 with SMTP id d18mr4034008aga.11.1286993451337; Wed,
	13 Oct 2010 11:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 13 Oct 2010 11:10:30 -0700 (PDT)
In-Reply-To: <20101013163603.GD28423@ibawizard.net>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<20101013163603.GD28423@ibawizard.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Oct 2010 11:10:30 -0700
Message-ID: <AANLkTi=pTAe+UmuLsMkra9ZvXAf=9btmd908uxW6tF95@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Wed, 13 Oct 2010 18:11:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2010 at 9:36 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Cliff Brake <cliff.brake@gmail.com> [2010-10-08 17:35:54]:
>
>> master branch has been merged to testing-next and is ready for clean bui=
lds.
>
> Hi,
>
> I've build the testing-next 2010-10-08 for ts72xx machine, distro
> angstrom-2010.x on Ubuntu 10.04.1 32-bit. I've updated the testing table =
on
> the wiki. Is it enough or am I missing some additional step? Thanks.

thank you. I think if you update the table and all its fields its good enou=
gh.

>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


