Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QpMgD-00027x-8M
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 17:51:21 +0200
Received: by gwb11 with SMTP id 11so707433gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 08:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lFMulU18eiGc9O/WYrnmEc7wS2Gr2xe3a0VKJBuC+6I=;
	b=S8EmvituxZnW+DQPZC1fhCKEkU/3AUHWNvJ4LqB8JqGoxLdHuVhGNVcGOlpbsIU+wn
	vOJuyNhxsMMDKkBxhOZaHZtM7CL5/uWD6jyINEGdsUUEyln21yY41sgYlSa+e0B8szC6
	idLo2sorw62M+z75QMSPqJQ/iat6YnoLxiwxg=
MIME-Version: 1.0
Received: by 10.42.29.193 with SMTP id s1mr2016261icc.439.1312559214438; Fri,
	05 Aug 2011 08:46:54 -0700 (PDT)
Received: by 10.42.228.73 with HTTP; Fri, 5 Aug 2011 08:46:54 -0700 (PDT)
In-Reply-To: <j1djr0$6bp$1@dough.gmane.org>
References: <j1djr0$6bp$1@dough.gmane.org>
Date: Fri, 5 Aug 2011 08:46:54 -0700
Message-ID: <CA+M6bXmHaXm9-36Ay6DzqpTtRjt6UOx=UjE2Quri_fdGiosyxw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request #22
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
X-List-Received-Date: Fri, 05 Aug 2011 15:51:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 1:04 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Tom,
>
> Please pull the 2 commits from here:
>
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
>
> Joel A Fernandes (1):
> =A0 =A0 =A0linux-omap-psp: Fix MMC timeout errors
>
> Koen Kooi (1):
> =A0 =A0 =A0gtk-icon-cache bbclass: only add runtime dependencies on hicol=
or-icon-theme when installing icons
>
> These are all cherry-picks from .dev

Applied (and setting up some sort of GPG setup for this address is on
my weekend TODO list).

--=20
Tom


