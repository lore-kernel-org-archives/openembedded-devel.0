Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hiwzp-00010s-O7
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2007 20:22:41 +0200
Received: by wr-out-0506.google.com with SMTP id 55so1986625wri
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2007 11:13:21 -0700 (PDT)
Received: by 10.114.125.2 with SMTP id x2mr2464184wac.1178043200826;
	Tue, 01 May 2007 11:13:20 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Tue, 1 May 2007 11:13:20 -0700 (PDT)
Message-ID: <432beae0705011113v61831859x7978062963a48b8@mail.gmail.com>
Date: Tue, 1 May 2007 11:13:20 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <46362F71.7080604@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <E1HgoSJ-0008AG-St@linuxtogo.org>
	<462FBE16.9070805@dominion.kabel.utwente.nl>
	<46362F71.7080604@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] org.oe.dev xtscal: attempt to fix miscalibrations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2007 18:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/30/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Koen Kooi schreef:
> > koen commit schreef:
> >> xtscal: attempt to fix miscalibrations
> >
> > Could people with one of:
> > "HP IPAQ H3600" | "HP IPAQ H3700" | "HP IPAQ H3900" | "HTC Universal" | *COLLIE | *POODLE
> > | *SPITZ | *AKITA | *BORZOI
> >
> > check if calibration isn't 90 degrees of anymore?
> >
> > If not, we most likely need to revert revision d18552e5056a026d8ed8959e135b2fa05c3e1b6b
>
> Hello?

I was just about to test this when my boot into a new image failed
with a missing libgcc. This RPATH issue needs to be fixed ASAP.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGNi9xMkyGM64RGpERAnbdAJ0WirRd/ONKWpIDHDQcO+6EddMx6gCgmoiw
> bF5efxVbVYf2tUEhwMiCMHc=
> =j3Su
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Justin Patrin


