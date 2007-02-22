Received: from [204.127.192.81] (helo=rwcrmhc11.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HKHIy-0006IP-Mh
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Feb 2007 18:00:40 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (rwcrmhc11) with ESMTP
	id <20070222170027m1100kst43e>; Thu, 22 Feb 2007 17:00:27 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id B32DC6A50; Thu, 22 Feb 2007 12:06:34 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1172163994.7729@gatekeeper.stellarwerx.com>
Date: Thu, 22 Feb 2007 12:06:34 -0500 (EST)
MIME-Version: 1.0
Subject: Re: QA issues with pkgconfig files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2007 17:01:02 -0000
X-List-Received-Date: Thu, 22 Feb 2007 17:01:02 -0000
Content-Type: multipart/mixed; boundary="bound1172163994"

--bound1172163994
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Koen:

If it is the "correct" way of doing things and not a "hack" just to make things work, then do it.  All of the other options you proposed did seem "hack-ish" to me - but I don't know the intricacies of bitbake/OE.

Regards,
-Mark Gollahon


Koen Kooi wrote ..
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Koen Kooi schreef:
> > Koen Kooi schreef:
> > 
> >> Possible solutions:
> > 
> >> 1) set PKG_CONFIG_PATH to ${STAGING_LIBDIR}/pkgconfig
> >>    +easy fix
> >>    -requires to re-run do_pupulate_staging for all packages
> > 
> > This seems to fix it in a clean way. Any objections to this going in
> today?
> 
> Speak now or be silent forever....
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFF3bM0MkyGM64RGpERAj+6AKCMDxx8a7wKvUTT90kr84En2R4HXQCgqfkX
> YnxlmEKeyQBQ8stwIVw/YHs=
> =ZvIf
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--bound1172163994--
