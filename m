Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TGmJo-0006RD-Iv for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:46:04 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TGm7T-0000le-Cx for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:33:19 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:33:19 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 09:33:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 26 Sep 2012 09:33:06 +0200
Message-ID: <k3ub3f$evl$3@ger.gmane.org>
References: <1348595018-27413-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
In-Reply-To: <1348595018-27413-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-systemd][PATCH V2] systemd: Upgrade past v191
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
X-List-Received-Date: Wed, 26 Sep 2012 07:46:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-09-12 19:43, Khem Raj schreef:
> Booted on eglibc/uclibc i586 systems
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
> .../systemd/systemd/optional_secure_getenv.patch   |   19 ++++++++++ 
> .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   39
> +++++++++----------- .../systemd/systemd/use-rootlibdir.patch           |
> 31 +++++++++++-----

The rootlibdir patch is wrong, it moved arch independent files into /lib64.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQYq+yMkyGM64RGpERAmsoAJ0TLr38YpqwwrvEwB1+BQSfCeG2jQCgsrro
smFdLuNHAaVG4BXqrkgaudE=
=UZCz
-----END PGP SIGNATURE-----



