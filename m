Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TReL6-0005VK-G6 for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 09:28:20 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TRe8A-00069E-OS for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 09:14:58 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 09:14:58 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 09:14:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 26 Oct 2012 09:14:43 +0200
Message-ID: <k6dd8v$tj0$1@ger.gmane.org>
References: <1351191528-13408-1-git-send-email-martiert@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1351191528-13408-1-git-send-email-martiert@gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-systemd][PATCH] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Fri, 26 Oct 2012 07:28:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-10-12 20:58, Martin Ertsaas schreef:
> Change version of ntp to match that in meta-networking. Also change
> ntpdate to ntp-date to match the names used in meta-networking.

While you are there, can you also disable the autoactivating for the unit?
It's broken and I'm gettig tired of doing 'systemctl disable' on it for
every system.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQijhjMkyGM64RGpERAkBaAJ97niM1IfjERLUg3dOlFXMKLx/TogCgqXv6
X63nMniUZKcmw41+u4BEFKE=
=J9a5
-----END PGP SIGNATURE-----



