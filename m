Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q0gOO-0000eh-6x
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 21:35:28 +0100
Received: by iyb26 with SMTP id 26so4473225iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=8Ky9dFqvSSUuzdT3nzbdiFt4LLndUtKjWmpVZf+87bI=;
	b=VBJ/vA/OkUbwjYfqceh26kyCHosTb9FDOEIJnC6t9t+BnX+BzWeSrFd6JF8tyuyAqH
	+JlDUeUDjJdzwNDXKSywS1Qv5U1cC2zBqwCmbNx/dE28moN5G0/EkGV/6MaMFbP4euAd
	kF85MX5qgS813Yc0hNzHijwpS3yGpQF222lpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Jx6m6Yeg8DP51x4uXK/hzPFchzjm3QVSKZZuMDqlLN5JMkamObCA0kpUtN4WMySHuE
	gFln5LO9bd0bejDw+BhI4Rtjky2wHPAfbT6OJPNLoOkv0GXHBX3JiHnpYiUDuwrBsyAL
	f6C4loCSu7RuPMzY5uMRfBHLzPvL6ze5y20NM=
MIME-Version: 1.0
Received: by 10.231.117.129 with SMTP id r1mr1296394ibq.195.1300480420790;
	Fri, 18 Mar 2011 13:33:40 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Fri, 18 Mar 2011 13:33:40 -0700 (PDT)
In-Reply-To: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
Date: Fri, 18 Mar 2011 21:33:40 +0100
Message-ID: <AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Fri, 18 Mar 2011 20:35:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/18 Dr. Michael Lauer <mickey@vanille-media.de>:
> Salut,
>
> the blacklisting of packages as found in angstrom.bbclass
> is pretty helpful and would be beneficial to all kinds
> of distribution configurations in OE. Would there be
> a strong objection of renaming this to blacklist.bbclass?
>
> Copying, of course, is also a possibility, but
> in my opinion it would only be the second best choice.
>
> Cheers,
>
> :M:

If blacklisting a certain package for all distro's is there then still
a need to keep those blacklisted packages ????

Frans


