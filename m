Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pb8Ro-0006un-5B
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 10:17:24 +0100
Received: by iyj18 with SMTP id 18so16394843iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 01:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mRR9b388TugBlBCaT8n2OZhlliYjeu2SG2UNzfQOiQQ=;
	b=YegNRZVzeY1iMVYygDu2TpU9BsMqOn36XkOvWCXAUeOfGfpgrhnL+SxPY3zB4QVLa/
	6aDZaJxucGii+0HJJm4xYbB90AgnYxuinHt1C1+mDid4Qr2aSpM5AkJI5Tz3i+zHe7mF
	euj0sJ64VTLuyBT0hTqJyFEN4dqYBjnLRu1IA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=djXorC65PlplWoYwE0G63K+UZHXlpt1ddp0izm94SwXokzeeA4obkDUxS3YqAnSNlP
	5v5bsoR0hDtA2cgDeZRaBeyKieVz6c1bjF3nzefSoMcKeEpwqJwh2R2Zj8Pl9OQKkizo
	XTUm1ky45p2SQZuzUwu+absoDCwbx3UDylhNo=
MIME-Version: 1.0
Received: by 10.231.199.77 with SMTP id er13mr9435816ibb.44.1294391817535;
	Fri, 07 Jan 2011 01:16:57 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 7 Jan 2011 01:16:57 -0800 (PST)
In-Reply-To: <20110107084950.GA2466@ibawizard.net>
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
	<20110107084950.GA2466@ibawizard.net>
Date: Fri, 7 Jan 2011 10:16:57 +0100
Message-ID: <AANLkTimcgwTUn+zZOB0==QzxJ1PJY9hdfy2nJ_=M1kmH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Fri, 07 Jan 2011 09:17:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/1/7 Petr =C5=A0tetiar <ynezz@true.cz>:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [2011-01-04 22:12:29]:
>
>> Seems Petr, Eric and Robert are involved in these two machines.
>> Care to comment on moving to 2.6.36.2 (or give it a stab)?
>
> Hi,
>
> thank you for asking, you've my ack. I just wonder, if it's necessary to =
ask
> the maintainers of other machines using this kernel recipe for such small
> kernel patchlevel bump.
>
> -- ynezz

Reason for asking was that at least one of the machines had quite some
patches in it.
Anyway, as stated before I decided to move sheeva to 2.6.37 instead,
so I'll leave doing to patch to someone more involved.

Frans


