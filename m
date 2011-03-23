Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Q2ODf-000179-Fy
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 14:35:27 +0100
Received: by qwh5 with SMTP id 5so5835302qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=g/ix2Z0Fcv5OND1eDvYFiWpJ/1wruvPXntjTEvyO8v0=;
	b=WEdcGh8/dYZxOJLJBnLbbtHJAZQXK77cbMKz6BvsnXYu+cebYh6Gd9SNTRQywp6AmK
	QcDEF6c9lHBVU8lz+C1TlXNMYZY4+kRvIkpN/XRHatJgI5CKtohSiGUn/PjGHPeccj7H
	UXov30nE/RVPMya8xW/aafF6HQSgIhbl6XsAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=cfk9IA0yDk+30EpBmlDb06CywQbZjtx12fLXv8fC6qtcGa1qFn7/d8FEGxqlXZTFW6
	LHWLmgAX1hHm8P4ZGFY18bKEV2DtcflLy4YPv4mHWmprHefeSbiE6mJPe8QxSVr/nwbR
	BANIlu2btgkDclKl0up93KtevcEqv3TABFwEg=
Received: by 10.229.50.193 with SMTP id a1mr5766443qcg.177.1300887215261; Wed,
	23 Mar 2011 06:33:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.98.202 with HTTP; Wed, 23 Mar 2011 06:33:15 -0700 (PDT)
In-Reply-To: <1300881388.4101.23.camel@mattotaupa>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
	<1300834528.3825.3.camel@mattotaupa>
	<AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
	<1300881388.4101.23.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 23 Mar 2011 14:33:15 +0100
Message-ID: <AANLkTikhnHdQGGh-bkAs3si4PNg5NqGCJ1c2iQOkuwL-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Wed, 23 Mar 2011 13:35:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello
I was going to fill a bugrepport on OE's bugzilla but as you are already
speaking of vlc building issue..
It does not build for me neither : http://pastebin.com/raw.php?i=wK4Sxbv9
Thanks by advance.

Regards,

Sylvain (aka GarthPS)


2011/3/23 Paul Menzel <paulepanter@users.sourceforge.net>

> Am Mittwoch, den 23.03.2011, 08:51 -0300 schrieb Otavio Salvador:
> > On Tue, Mar 22, 2011 at 19:55, Paul Menzel
> > <paulepanter@users.sourceforge.net> wrote:
> > > What kind of error do you get? The recipe build fine for me using
> > > `angstrom-2010.x` for `MACHINE = "beagleboard"`.
> >
> > It fails to find lua.h so probably you had it built due other dependency.
>
> No, I made a clean build, i. e. `rm -rf angstrom-dev`. Please post your
> build configuration.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

