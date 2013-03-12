Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UFRgW-0000Bi-SA for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 17:04:17 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UFRQk-0001mk-Rp for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 16:47:58 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 16:47:58 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 16:47:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 12 Mar 2013 16:47:28 +0100
Message-ID: <khnima$5nr$1@ger.gmane.org>
References: <1363101364-9498-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1363101364-9498-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCH] layer.conf: add distro-feed-configs to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 12 Mar 2013 16:04:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-03-13 16:16, Andreas Oberritter schreef:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- This patch
> was sent for the first time about a year ago. Back then, Koen didn't
> apply it, because "distro-feed-configs does the wrong thing". in his
> opinion. However, distro-feed-configs persists today and is still getting
> used.

I vote to delete it and have distros put it in their distro layer.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRP04QMkyGM64RGpERApbpAKCWnDZc1FHev5kXNTeTnmLZjUJddQCgi5TF
7094ThlWvhgK2tSqncmc5cM=
=+in0
-----END PGP SIGNATURE-----



