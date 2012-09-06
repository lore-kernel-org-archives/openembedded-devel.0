Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9aJt-0002CZ-ES for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:32:25 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9a7w-0006oF-2p for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:20:04 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 13:20:04 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 13:20:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 06 Sep 2012 13:17:23 +0200
Message-ID: <k2a0no$1it$2@ger.gmane.org>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCHv4 1/3] libplist: add upstream patch to fix parallel make issue
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
X-List-Received-Date: Thu, 06 Sep 2012 11:32:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-09-12 17:21, ml@communistcode.co.uk schreef:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

You're missing the '[meta-oe]' tag as specified in the README for that
layer, which means it doesn't show up in
http://patchwork.openembedded.org/project/oe/list/?q=meta-oe

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQSIZDMkyGM64RGpERAkqAAKCNWtIrjN81A1VUe7eZKGjtWYI+OACePOHH
xNHnsO0mXT0D5fkrX8x2KkQ=
=2+ex
-----END PGP SIGNATURE-----



