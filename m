Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RScBk-0005kf-9Q for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 23:18:08 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSc5S-0003wL-Ld for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 23:11:38 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 23:11:38 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 23:11:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 21 Nov 2011 23:11:22 +0100
Message-ID: <jaeia9$bll$1@dough.gmane.org>
References: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe][V2 0/4] libnl and iw updates to make networkmanager work
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
X-List-Received-Date: Mon, 21 Nov 2011 22:18:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-11-11 20:53, Andreas Müller schreef:
> V1 -> V2: networkmanager bump PR
> 
> Note: It might be required to rebuild wpa-supplicant coming from
> oe-core.

I'll apply this set tomorrow if there are no comments, but could you also
push libnl3 into oe-core and then bump PR for wpa-supplicant? If not, could
you add a wpa-supplicant bbappend that simply does PR_INC = 1 (or PRINC, I
forget) ?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7KzIgACgkQMkyGM64RGpHnHACffdU98Hr58FMbhlExV7qH3QVd
jCAAoLCk4++ZcR/spyp7aSzY1rWSWf6k
=grcU
-----END PGP SIGNATURE-----



