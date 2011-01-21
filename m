Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PgGUc-0000NR-AJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 13:53:31 +0100
Received: by iyj18 with SMTP id 18so1805057iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 04:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=l0oozJBRLs/+8SELB2/6d5O8csf8/rtWwuyPYtHVl2c=;
	b=xk2MiHLzHhyoGlcflJoq6RKc0FBSqMgWZDQywah96l8ELOoa2vjn+lM5Ii7H/B+izW
	/KsmgmhnfllnDgfZbRDMyQqaMogswwW+a7nyaqoZseogYQu+4Hg4pd8wMiF8KLbsMMvI
	umhfDbT0c/Y4UW/uvN0U+y0SvgTWuYtunAhfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OV9piLjHpIvZdFgsqpKBFc/zryLe6NOo382I6PAUXAIvXT5z0e69qw0ABBFbeclWSP
	h6JdaehCpABIJAjG+4+r04zuyAoGILZn5k2y1PBxfxbtt/5TX/QJjW2RG8YV9U5m6taO
	Xa+0k6MUWVup4iygCBohLt68BO0xh6W9L5/9c=
MIME-Version: 1.0
Received: by 10.231.15.5 with SMTP id i5mr657243iba.149.1295614364280; Fri, 21
	Jan 2011 04:52:44 -0800 (PST)
Received: by 10.231.34.69 with HTTP; Fri, 21 Jan 2011 04:52:44 -0800 (PST)
In-Reply-To: <1295613293.12720.52.camel@mattotaupa>
References: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
	<AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
	<4D38D77E.7070000@mentor.com>
	<AANLkTi=LkWW3wOXJtmQsSPcCRrofqY15osKL2u9UBYvr@mail.gmail.com>
	<1295613293.12720.52.camel@mattotaupa>
Date: Fri, 21 Jan 2011 13:52:44 +0100
Message-ID: <AANLkTinAmzpGGd6XRAysH-5Wb7HBbPpD_NGi9ramn8tn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ltp_20100831: `WARNING: Deprecated usage of 'patch' url param` (was: testing branch 2011-01-20)
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
X-List-Received-Date: Fri, 21 Jan 2011 12:53:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2011/1/21 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 21.01.2011, 08:52 +0100 schrieb Frans Meulenbroeks:
>
> [=85]
>
>> The others seem to be more general. I'll copy from the sheevaplug log.
>>
>> on starting the builld, I get:
>> Parsing .bb files, please wait...WARNING: Deprecated usage of 'patch'
>> url param for '/home/hudson/jobs/OE_test/workspace/openembedded/recipes/=
ltp/ltp-20100831/runalltests.patch',
>> please use 'apply=3D{yes,no}'
>
> Khem fixed this in e4b91191 [1].
>
> =A0 =A0ltp_20100831.bb: Fix deprecated usage to specify patch in SRC_URI
>
> [=85]
>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De4b91=
191909d47a00b6e7de62ce1eea78a2a5a86
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


