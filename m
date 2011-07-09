Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QfU4s-0006it-MD for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 11:43:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QfU17-0001f8-2g for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 11:40:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2011 11:40:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2011 11:40:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 09 Jul 2011 11:37:31 +0200
Message-ID: <iv97gr$d22$2@dough.gmane.org>
References: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
X-Enigmail-Version: 1.2
Cc: beagleboard@googlegroups.com
Subject: [2011.03-maintenance] Re: [PATCH] pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03
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
X-List-Received-Date: Sat, 09 Jul 2011 09:43:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-07-11 02:21, Joel A Fernandes schreef:
> This fixes all the issues noticed earlier with pulseaudio 0.9.15: *
> Pulseaudio keeping audio devices busy when run as per-user instance *
> Failure of pactl, pacmd etc to connect to the pulseaudio server
> 
> Signed-off-by: Joel A Fernandes
> <agnel.joel@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

Tom, do you want to take this directly or should I do a pull request
with this in it?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOGCFbMkyGM64RGpERAiB+AJ9VdbP77X9RB9ticvZt1nza9HncegCgqJ97
iZVhWtlMPB8HG1QTtjsE41Q=
=29tt
-----END PGP SIGNATURE-----



