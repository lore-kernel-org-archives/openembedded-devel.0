Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWXG1-0003lJ-KI for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 19:18:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWXCj-0001cw-Ig for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 19:15:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 19:15:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 19:15:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 19:14:46 +0200
Message-ID: <it84u6$qbq$1@dough.gmane.org>
References: <cover.1308070134.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [[meta-oe][PATCH 0/3] Pending fixes in O.S. Systems tree
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
X-List-Received-Date: Tue, 14 Jun 2011 17:18:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-06-11 18:49, Otavio Salvador wrote:
> The following changes since commit 797fc635c1a693abb07392a22e0b001bc331f633:
> 
>   gvfs: the sftp plugin only works with openssh-ssh (2011-06-13 20:20:15 +0200)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe master
>   https://github.com/OSSystems/meta-oe/tree/master
> 
> Otavio Salvador (3):
>   xf86-video-geode: add 2.11.12 version recipe
>   freerdp: bump SRCREV to gather fixes
>   freerdp-extension-xpunlimited: bump SRCREV due library renaming

I have queued all three and will push them out after I build test them,
which has hit a snag in eglibc patching today.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN95cGMkyGM64RGpERAgqDAJ9IGRny1bN8fDB8LtX6sloHR4nDuQCgphMl
Qb9c+++fpPxaKurpRIxdtGE=
=hPln
-----END PGP SIGNATURE-----



