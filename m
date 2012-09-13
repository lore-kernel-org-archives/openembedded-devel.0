Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TCBPL-0000TH-FP for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 17:32:47 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TCBDD-0006n0-1E for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 17:20:15 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 17:20:15 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 17:20:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Sep 2012 17:20:00 +0200
Message-ID: <k2stiv$jb7$1@ger.gmane.org>
References: <1347521638-3093-1-git-send-email-b28495@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1347521638-3093-1-git-send-email-b28495@freescale.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][for-denzil][PATCH] systemd.bbclass: use system variables instead of hardcoded paths
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
X-List-Received-Date: Thu, 13 Sep 2012 15:32:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-09-12 09:33, b28495@freescale.com schreef:
> From: Ting Liu <b28495@freescale.com>
> 
> Fix below issue when check service-files for 64bit target: | DEBUG:
> adding systemd calls to postinst/postrm for busybox-syslog-systemd |
> ERROR: Function failed: | | For package busybox-syslog-systemd
> SYSTEMD_SERVICE-entry busybox-syslog.service does not exist NOTE: package
> busybox-1.19.4-r6+fsl.0: task do_package: Failed
> 
> Signed-off-by: Ting Liu <b28495@freescale.com>

Since when do changes go into denzil without going through master first?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQUfmgMkyGM64RGpERAssbAKCXR2IvkFpaaj9XHgJBhnitDRRbpgCfauG8
IpN4oLULM7EGk/mmU0UJNF0=
=ZEJH
-----END PGP SIGNATURE-----



