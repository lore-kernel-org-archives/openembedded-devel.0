Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RjROz-0006j9-A9 for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 09:13:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RjRHm-0004Q1-7H for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 09:05:54 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 09:05:54 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 09:05:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 07 Jan 2012 09:05:40 +0100
Message-ID: <je8ucj$vub$1@dough.gmane.org>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 08:13:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-01-12 00:55, Andrea Adami schreef:
> * delete patches meant for BSP layers * bump PR

With a recipe like xserver-common I don't see a point in going all out BSP
on it. This patch just moves things to layers just for the sake of moving it
to layers. I strongly suspect that applying this patch will be a net burden
on device maintainers instead of a gain.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8H/NIACgkQMkyGM64RGpEvwACfRRHrwdZqrc3UrqSNvEOPvh8w
kIoAn2Wpy6va4V/Y369vSwDj7AcZLuNO
=oYt/
-----END PGP SIGNATURE-----



