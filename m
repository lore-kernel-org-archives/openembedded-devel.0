Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx1Q3-0007v3-E1
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 19:09:32 +0200
Received: by pwj5 with SMTP id 5so306705pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zipsh3oPq4Pu4+bmRyagW/V0I9p2KVhg28C0IE0uUt0=;
	b=CxJvivl2fN199lqORIvRFney7mh9fHTsKViEHZoLhH4/QhHVMLwNb8Y9C0BA7tBb25
	/5LDeNLqKWtfhhwCRT2ZgEGLZUB1TTNwmD8blDRj7xcII7F20daO3jOtz6H1EpY3E5pV
	u3TY5XFzHWvQyHgjZTZpToL3UGKA7l7/E9/74=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DyFSIIu82cHoClQWmbzLkujeO5mpgWPNpw6Dy273vGq/4wI14rzPZE55TWezs6/jYo
	SesGy0F4ZC0jD1AP98hoyTavHbyYSs0JyIe0Wo0DyOwU7CYDqxSFutIlF82fjXbYBG0w
	SsbDTktXC5S4mqm6Fhvuux72dWCXaDRexbe8A=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Wed, 31 Mar 2010 10:06:14 -0700 (PDT)
In-Reply-To: <4BB35552.9070508@mlbassoc.com>
References: <4BB35552.9070508@mlbassoc.com>
Date: Wed, 31 Mar 2010 10:06:14 -0700
Received: by 10.141.101.17 with SMTP id d17mr5958850rvm.30.1270055174449; Wed, 
	31 Mar 2010 10:06:14 -0700 (PDT)
Message-ID: <v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Wed, 31 Mar 2010 17:09:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2010 at 6:59 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Has anyone had success building FireFox for a PowerPC
> target - I'm using the development branch (org.openembedded.dev)
> =A0MACHINE=3Defika
> =A0DISTRO =3D "angstrom-2008.1"
>
> I've tried to build a number of different FireFox packages,
> none with success. =A0So far I've tried 2.0.0.3, 3.5.2 & 3.6.2
>
> Any pointers?
>
> Query: is there an easy way to build a particular package version?
> What I've done is just add a line like this to my local.conf:
> =A0PREFERRED_VERSION_firefox=3D"3.5.2"


what errors do you get.

>
> Thanks for any help with this
>
> --
> ------------------------------------------------------------
> Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the
> MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


