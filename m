Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUWzT-0002g4-FM for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 07:41:39 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUWpo-0006Jj-L2 for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 07:31:40 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 07:31:40 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 07:31:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 16 May 2012 07:31:30 +0200
Message-ID: <jove3h$7qg$1@dough.gmane.org>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Wed, 16 May 2012 05:41:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-05-12 18:12, Thilo Fromm schreef:
> Hello,
> 
> I'm trying to remove an element from DISTRO_FEATURES (specifically 
> "ld-is-gold"), but I am unable to find the right spot to do it. The 
> distribution we're using (Angstrom, as it happens) sets this in 
> conf/distro/angstrom-v2012.x.conf.

Why aren't you using the angstrom release? That isn't using gold.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPszuyAAoJEHZqAkdh1vT6HlsP/RyLQIOKUBL3pH9XpaU1Ra6Q
AmANF1QHGUMXXSYuULKN3lNu2fPXYKCbiR7sCjPLMWcIQqJ6a6UAQsWGKgAXK0P/
JXhF9RLtxXi3Ws+wo303md8zgdEHC4LHuqYl5mC90fmBr80FPbcnrNlii24HTzpt
mrT7DyntO6oiXJkZBV2dTkYzeDjn2NbCwFNXn0h4OJMtwfp2dYzqwmKXeay7lmoB
2VL8dz6t9p4yFPM229XbD/A3xBynNIvd6CA2CaPu2fPc7bd7Lo19SdkDLjgRBm0d
e1QwRIfNgoGATO1QFJTgSqoCTvu0YsqfjNVopCsa4zTdgobxVT8ob3MWvktYxWjG
NtzoiZt58Y1/jqpJx27rSXw6fGuAozGZRVA1hCGH9h12E7s0UoD9pEAn/QOFG8BN
M+JC8d8jCCmJwP/Pn2eIHRB2Kkhbvs/pN7fbQllYgMG3cZUD7HM5P1x0vukBafkT
b3Pkev0LTQFOxXRTyTreCBqZLeXJbGq0tmDei2eTk2HRX8oEq0JXbp9K2bUlNlGP
xCtJxPk2O3nIqUx0sLsHlrbiEXuIbmW8VBZgMp7wpBLW2IqSTQXf9lH17ZvJeamb
QNj9cMjVgmCI1JMpaiRP6zCveapG8b0K42Arx6tT72ao4NGaM3Ps7Y0miSLk2BvY
EE1Nqkf9aOlZFr8dT0gZ
=YOd0
-----END PGP SIGNATURE-----



