Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RrxXA-0000ur-Ii for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 21:09:00 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RrxPZ-0000C7-Gc for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 21:01:09 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 21:01:09 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 21:01:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 Jan 2012 21:00:54 +0100
Message-ID: <jg6sti$vjj$1@dough.gmane.org>
References: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for libpurple.
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
X-List-Received-Date: Mon, 30 Jan 2012 20:09:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-01-12 20:47, Peter Tworek schreef:
> Without it postinst script for libpurple fails when gconf is not
> installed: //var/lib/opkg/info/libpurple.postinst: line 8: gconftool-2:
> command not found

Why is gconf.bbclass failing to do that?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8m9u8ACgkQMkyGM64RGpGRTQCgrzWdMpyRtNE3kO2CKw6b7haa
j5UAoJ2NPDIIlCsRwYOJSTGTWd2i/hj0
=axku
-----END PGP SIGNATURE-----



