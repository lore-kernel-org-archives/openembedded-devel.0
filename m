Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PU2r0-00045K-Qi
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 20:54:06 +0100
Received: by gyh20 with SMTP id 20so722027gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 11:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=/KMjCI+SiMisHVbrb55MLRO9Z9osAdQnMMGH5pc6s2w=;
	b=eZW172ou7veaLNHTc7nyvbD7GK52KYMX7CgNix2lwddPezBhl59wfJjWBMXBgPQw4d
	SFFRrnXN4Gjw7Gz+NAjvngrgwlLMzux+s7BWs8qAFLvHAsl2bKjfYIv9c7wKLlsU0SVV
	dX/r/rfQ54I5oVS4L85WiwDY8f67HTf2P2s+o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ZqJV3xICBvJ63nTt5BCd0JQeHiYVGyGARHjLs3WoazlH8dZCDadiSfUa0tmm6DSAQ+
	blTtDPybuH4BrpFIdupnhm8v9M/RXfMhftdyLaoMJhmBqAGIwza1n1OnzTYUmTspOOFr
	ZOjwlS//CbwzUr3Obox0YSNiO6NVIvtCWpIm0=
Received: by 10.90.97.19 with SMTP id u19mr3698714agb.166.1292702039094; Sat,
	18 Dec 2010 11:53:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 18 Dec 2010 11:53:38 -0800 (PST)
In-Reply-To: <AANLkTim_OLguz9NcTbCiXyzipjcefUR4cAPQ_=N756bg@mail.gmail.com>
References: <AANLkTikPkD=e6O=cXQA5b5LYd6kapdgtjx=UG_pSweGn@mail.gmail.com>
	<AANLkTim_OLguz9NcTbCiXyzipjcefUR4cAPQ_=N756bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Dec 2010 11:53:38 -0800
Message-ID: <AANLkTimSfMCRyi9i6UaoZ1pvjSUMjRCg_jkuTE43A-kk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-12-17
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
X-List-Received-Date: Sat, 18 Dec 2010 19:54:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 18, 2010 at 8:06 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> For me nslu2le, nslu2be, calamari, mpc8313e fail on e2fsprogs. This
> has been fixed by koen after the testing branch was made.
> sheevaplug fails on gettext. Note that this is with minimal and has
> been fixed by JaMa since.
>
> I don't think we will see success reports on this one (at least not on
> unpatched versions)
>

Thats fine then we wait until next week.

> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


