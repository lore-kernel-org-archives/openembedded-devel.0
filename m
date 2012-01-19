Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ro0Co-0001AR-DJ for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 23:11:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ro05P-00048X-Uc for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 23:03:59 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 23:03:59 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 23:03:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 Jan 2012 23:03:43 +0100
Message-ID: <jfa3vv$3ks$1@dough.gmane.org>
References: <cover.1327002701.git.anders@chargestorm.se>
	<ba787e718994267f09ff11b8b4122d536175bffc.1327002701.git.anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <ba787e718994267f09ff11b8b4122d536175bffc.1327002701.git.anders@chargestorm.se>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH v4 2/2] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Thu, 19 Jan 2012 22:11:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-01-12 20:53, Anders Darander schreef:
> Let the distro define a keyboard distro feature, to conditionally
> include kbd*. (Headless distros might not want to RRECOMMENDS kbd*).

DISTRO_FEATURES is the wrong thing for that, so I'm going to NAK it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8Ykz0ACgkQMkyGM64RGpGTVwCeNx5RLmgei+P22TvnVav0FEGI
Z1wAnAolSXV5em2PN1rLn4PKosx0BAsO
=JYUg
-----END PGP SIGNATURE-----



