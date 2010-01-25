Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZIm3-0007zL-PY
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 07:50:14 +0100
Received: by iwn35 with SMTP id 35so1035515iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 22:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RZobzG0GMDIQRsXN7vVr2YVQgvY4iwGXh2WpUmBHrm0=;
	b=JBuH6u4ld6zOpUCN3TtJ+WHxgqoVJhIgx6kb1VUYsvFmB6yKJKOo1Ex43GWQV4xBDb
	tFNeQcoPpDSvQ+QJY3KOSLdQOzLOvfQseALoJzkfiBV+pXisqD6hLoX/VaIzhvzdwlTu
	BOASqqPlUP7dCmwSuCve9lt4zXoq30o90ASnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jTxer+s06k0DjQEZ8cgsr9IAFWrYsZhF7Cw+JRMZ5R7e9ku6jD3VTHn5gn28vYURNs
	EzosyWa8dMmzbOfsh+bglm0fA+IcbrS9E1BS+pjuono6Og/9dsP/h6fGqGRLzqdSOdlO
	Lpjl1IQkJXhwir7ODPsaydY+Owk6+DCoHb/8k=
MIME-Version: 1.0
Received: by 10.231.159.198 with SMTP id k6mr6258018ibx.92.1264402071465; Sun, 
	24 Jan 2010 22:47:51 -0800 (PST)
In-Reply-To: <op.u62suaqlmn1qzu@guohr-laptop-ubuntu>
References: <op.u60m9axmmn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001242236w53852eb2s8ef6dfbeb0ac57e3@mail.gmail.com>
	<op.u62suaqlmn1qzu@guohr-laptop-ubuntu>
Date: Sun, 24 Jan 2010 22:47:51 -0800
Message-ID: <19c1b8a91001242247m1d72c0afncd8129cd926090f7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: linux-titan-sh4-2.6.21: offset to unaligned destination error when compiling linux-titan-sh4 kernel
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
X-List-Received-Date: Mon, 25 Jan 2010 06:50:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2010 at 10:40 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> =E5=9C=A8 Mon, 25 Jan 2010 14:36:38 +0800=EF=BC=8CKhem Raj <raj.khem@gmai=
l.com> =E5=86=99=E9=81=93:
>
>>>
>>> Has anyone ever built kernel for titan machine successfully?
>>
>> I have only tried toolchain builds which worked. Care to provide a
>> preprocessed
>> file in =C2=A0a =C2=A0 bug report ?
>
> Yes, Of course. Could you give me your local.conf? I have not found a
> workable setting (MACHINE, DISTRO and LIBC combination) for titan.

I have used MACHINE=3Dtitan DISTRO=3Dminimal/angstrom

>
> Thanks a lot!
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


