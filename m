Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1NB9Nc-0003fn-AQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 16:57:11 +0100
Received: by qyk6 with SMTP id 6so1258656qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 07:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=teeIaMAWt1GEteTBAV1E2dqHEKABxNhjrrfnQG8abP0=;
	b=bxapM/l4P3BjjZVSs1ywc9yU4x2Ihcy04A4WZN1vCgOqLBtaBJKN7rV2vIzpLC5rlE
	7koWaf9EKwYRXG28sOQKe0k2JrgW5ZWpMHk9F+tTWvhKBURKsk2a0yRo2j5k90Bj0dxo
	FP1Ryu+YwQpWnHviwMPrJLxSkrC7KaQKtWL5k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fhLdulzyT7PiFvEVn1NuCf6hkOMu39Q5aWR0gr1U3pvEssObd5aOnSS6iy2cRRwp9E
	mhTxDz08t6WsCFIB7GL3cW6zCddkmX/YAhEoQxrBwGsin04ePk7JGNwHzRi1lXWk/c0+
	Pp8MigqI0ou534T2cNNuBgow0g9KCxgVK14R0=
MIME-Version: 1.0
Received: by 10.229.45.19 with SMTP id c19mr25232qcf.0.1258646143105; Thu, 19 
	Nov 2009 07:55:43 -0800 (PST)
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
Date: Thu, 19 Nov 2009 16:55:42 +0100
Message-ID: <5f2b60911190755v161845e6xc7fbdbc42ec269fc@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Thu, 19 Nov 2009 15:57:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/11/19 Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk>:
> I'm setting up a new machine with Linux specifically to use for OpenEmbed=
ded development. Which Linux distro should I go with?
>
> I'm looking to make it as easy as possible to get started, so ideally all=
 the packages I need will be available from that distro's standard repositr=
y.
>
> I've tried SuSE in the past and given up trying to get all of the require=
d tools installed, and more recently been using Debian, but the Python vers=
ion in Debian is a few versions behind and there was talk of OE soon requir=
ing a more up to date version.
>
> Ubuntu is a good candidate at the moment as I belive there won't be any h=
ardware issues with the laptop I want to use, but this wiki page suggests t=
here's some faffing to do http://wiki.openembedded.net/index.php/Gcc_issues=
_in_Intrepid_and_later which I'd like to avoid if possible - does anyone kn=
ow if these issues are present in the latest version 9.10?

I've been using OE on Ubuntu 9.04 and now 9.10 without problems.

Best regards,
Bj=C3=B8rn Forsman


