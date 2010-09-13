Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvBlc-0007NK-5D
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 18:20:28 +0200
Received: by gxk10 with SMTP id 10so1078726gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QQFhANR1FQaofrty8jQHDS50wiuM+LSCFMFR2oYCWKw=;
	b=FPAdUnQZJSmw7lmoacD+J1E6QjS3wPQWguX18BYO3H8gmLh+rQl4PoHpZ4LtInVWJ5
	p+QQn2QYVplrMKA6B9y0VW0+md4lh1Xa+2Var0slVn1rr265uOr37V1U/Yso3H1sksXS
	P2HOGozrRRC37VUpWPdcEUffj/LDE8l64NwSc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=si9rfP4pLvtSUkgOVotXqQyLS+fI3CNJjnjB1sl78Mm6JQt5csqwiL2MXWmah3dVoq
	OP5S5KQW+sb9fHfqvpP4FNGLWLJSoZSLi1gm8b915cdO1hXNSm/+sP2x4n/F9b4IEbYg
	xG5iLPlTLdoSxJztAM/GUwU/6zUag09dJXq6Y=
MIME-Version: 1.0
Received: by 10.150.144.20 with SMTP id r20mr309604ybd.48.1284394780600; Mon,
	13 Sep 2010 09:19:40 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 09:19:40 -0700 (PDT)
In-Reply-To: <201009131828.05861.khimov@altell.ru>
References: <1283644814-27013-1-git-send-email-hvontres@gmail.com>
	<201009131747.25914.khimov@altell.ru>
	<AANLkTikotQtqFp4M4FAO7w-YL3MaHbyPFGUBKztXKbUQ@mail.gmail.com>
	<201009131828.05861.khimov@altell.ru>
Date: Mon, 13 Sep 2010 18:19:40 +0200
Message-ID: <AANLkTimZs1Our0mEetgXnYGPyhyQf8SQCXu2JE8vU6MZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dnsmasq: add version 2.55 from upstream
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
X-List-Received-Date: Mon, 13 Sep 2010 16:20:28 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/9/13 Roman I Khimov <khimov@altell.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
13 =D3=C5=CE=D4=D1=C2=D2=D1 2010 18:16:36 =C1=D7=D4=CF=D2 Frans Meulenbroek=
s
> =CE=C1=D0=C9=D3=C1=CC:
>> 2010/9/13 Roman I Khimov <khimov@altell.ru>:
>> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=
=CB 13 =D3=C5=CE=D4=D1=C2=D2=D1 2010 17:02:59 =C1=D7=D4=CF=D2 Frans
>> > Meulenbroeks
>> >
>> > =CE=C1=D0=C9=D3=C1=CC:
>> >> 2010/9/13 Roman I Khimov <khimov@altell.ru>:
>> >> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=CF=D3=CB=D2=C5=D3=C5=CE=
=D8=C5 05 =D3=C5=CE=D4=D1=C2=D2=D1 2010 04:00:14 =C1=D7=D4=CF=D2 Henry von
>> >> > Tresckow
>> >> >
>> >> > =CE=C1=D0=C9=D3=C1=CC:
>> >> >> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
>> >> >> ---
>> >> >> =9Arecipes/dnsmasq/dnsmasq-dbus_2.55.bb | =9A 13 +++++++++++++
>> >> >> =9Arecipes/dnsmasq/dnsmasq_2.55.bb =9A =9A =9A| =9A =9A4 ++++
>> >> >> =9A2 files changed, 17 insertions(+), 0 deletions(-)
>> >> >> =9Acreate mode 100644 recipes/dnsmasq/dnsmasq-dbus_2.55.bb
>> >> >> =9Acreate mode 100644 recipes/dnsmasq/dnsmasq_2.55.bb
>> >> >
>> >> > Acked-by: Roman I Khimov <khimov@altell.ru>
>> >>
>> >> No problem with this version, but is it useful to keep versions like
>> >> 2.52. Please avoid version clutter!
>> >
>> > At least it doesn't hurt in this case IMO. Although 2.55 works fine he=
re
>> > since July (with technically exactly the same patch, somehow I've miss=
ed
>> > it when was looking for things to push in OE) it has many various chan=
ges
>> > compared to 2.52, maybe too many for someone.
>>
>> Well my main concern is that we have now 6 versions of this recipe,
>> and I think hardly anyone has an idea on the differences between
>> these.
>
> Probably we can drop versions prior to 2.52 because that have known secur=
ity
> issues and 2.52 is in the tree for quite some time. 2.52 doesn't hurt at =
all
> IMO, again.

Seems an excellent plan to me, can you provide a patch?

Frans


