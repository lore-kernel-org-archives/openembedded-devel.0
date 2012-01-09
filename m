Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RkBnc-0000BB-EF for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 10:45:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RkBgP-0004HB-D1 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 10:38:25 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 10:38:25 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 10:38:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 09 Jan 2012 10:38:10 +0100
Message-ID: <jeeci3$i8k$1@dough.gmane.org>
References: <1325986434-2020-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1325986434-2020-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe] udisks: add sytemd to DEPENDS
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
X-List-Received-Date: Mon, 09 Jan 2012 09:45:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-01-12 02:33, Andreas Müller schreef:
> If systemd was not yet build, udisks configure caused systemd files not
> being build so udisks-sytemd package was empty. On do_rootfs we got: |
> Collected errors: |  * opkg_install_cmd: Cannot install package
> udisks-systemd.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>

I'm not sure this is the right solution, but I'll take the patch if someone
doesn't come up with a better way to solve this.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8KtX0ACgkQMkyGM64RGpEdiQCdHJrxZ2qeZVKMPhnOBIZIge+4
jXkAnj+eSR0cBM8Rs/GQSmFdVLFGRKsz
=UdTQ
-----END PGP SIGNATURE-----



