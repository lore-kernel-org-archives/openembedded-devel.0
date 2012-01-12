Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RlLgB-0002bp-Pw for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 15:30:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RlLYs-0001kN-4Q for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 15:23:26 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 15:23:26 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 15:23:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Jan 2012 15:23:08 +0100
Message-ID: <jemqcg$1q0$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
X-Enigmail-Version: 1.3.4
Subject: meta-oe post holiday patchwork cleanup
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
X-List-Received-Date: Thu, 12 Jan 2012 14:30:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

tl;dr version: get your subject-prefix right

Hi,

I've cleaned up patchwork by marking every meta-oe patch as archived, minus
the one Martin just sent.

This means all the pending patches for meta-oe are listed here:

http://patches.openembedded.org/project/oe/list/?q=meta-oe

If your patches are missing, resend them using the method outlined in the
README of the respective meta-openembedded layer.

I'll include the meta-oe one below, since too many patches still don't comply:

- ---------------------------------------------------------------------------

This layer depends on:

URI: git://git.openembedded.org/openembedded-core
branch: master
revision: HEAD

Send pull requests to openembedded-devel@lists.openembedded.org with
'[meta-oe]' in the subject'

When sending single patches, please use something like 'git send-email -1
- --to openembedded-devel@lists.openembedded.org --subject-prefix meta-oe'

You are encouraged to fork the mirror on github
https://github.com/openembedded/meta-oe/ to share your patches, this is
preferred for patch sets consisting of more than one patch. Other services
like gitorious, repo.or.cz or self hosted setups are of course accepted as
well, 'git fetch <remote>' works the same on all of them. We recommend
github because it is free, easy to use, has been proven to be reliable and
has a really good web GUI.

Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>

- ---------------------------------------------------------------------------

The most important thing of that is the subject prefix. I only read emails
with a [meta-<foo>] subject prefix on oe-devel nowadays and I look at
http://patches.openembedded.org/project/oe/list/?q=meta- more often than
oe-devel.

So: Get your subject-prefix right

And kudos to Andreas, Martin and Otavio for getting their pull requests
right pretty much all the time.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8O7MoACgkQMkyGM64RGpFPUgCfQlCodSyFbuqPSfY6PVL2cPsR
YE8AoIRcwaHFCyvULMbFSH3PeFY8Fjmj
=cU1X
-----END PGP SIGNATURE-----



