Received: from mail-iw0-f203.google.com ([209.85.223.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYDbZ-0005aB-Nr
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:06:56 +0100
Received: by iwn41 with SMTP id 41so733100iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OjhaZYyJVijU289iNXJjF4oXgCf7IGPd8VNIXWsd+HQ=;
	b=HvIQ9qCXZxRpLxPFyGFDZXzGmVKCO99jL5wqxQ3q2YAB8+ESgrbVxLDb4qs4jEjaGh
	tCZvQZsDlYO3HNC9MpSiLrD28Td7GuLvOeHW86P4MUP07NQ1ymKUDh12em3eY3GMrPiM
	qb2UMx+Yt0Wlm2pXjEpI6mi1skR2JLVzesud8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fU2MycTxtXvf2sys/NdJIFhtT7h8VtsZkavnizNXrAibCsDWaZBFDDVmchaHPnPECP
	IWcZvoDFiJogy5NsmmNJ3P7eSf1FhW+LdlbzWyJaMPWuBPc84NjnGYVtpwG+/22GFfUL
	D7K9nx1Agz6TqY1KlhmCepFJd4vN3IzJNkt18=
MIME-Version: 1.0
Received: by 10.231.148.194 with SMTP id q2mr3976209ibv.97.1264143875733; Thu, 
	21 Jan 2010 23:04:35 -0800 (PST)
In-Reply-To: <op.u6w9m4x2mn1qzu@guohr-laptop-ubuntu>
References: <op.u6w9m4x2mn1qzu@guohr-laptop-ubuntu>
Date: Thu, 21 Jan 2010 23:04:35 -0800
Message-ID: <19c1b8a91001212304l1bb94efdr81be0ea00b973118@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.203
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to generate files in site directory
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
X-List-Received-Date: Fri, 22 Jan 2010 07:06:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2010 at 10:58 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =A0I am trying to build an openembedded project for sparc machine. But I =
found
> the file for spare in site directory are not complete at all. I want to k=
now
> whether or not there is some standard method to generate site file or I m=
ust
> write it by hand.

you can start with a copy of closest architecture.as (A bad idea but)
a starting point.
you should check for the values in there if they are really whats
desired/available on sparc.


>
> Thanks a lot!
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


