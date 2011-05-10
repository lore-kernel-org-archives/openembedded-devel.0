Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJla1-0006tT-GJ for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:58:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJlXN-0007Ln-HK for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:55:37 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 13:55:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 13:55:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 13:55:25 +0200
Message-ID: <iqb93d$uh2$1@dough.gmane.org>
References: <cover.1305027207.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1305027207.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-efl][PATCH 0/2] Pull request #5
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
X-List-Received-Date: Tue, 10 May 2011 11:58:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-05-11 13:34, Martin Jansa wrote:
> 
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/meta-efl
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks, applied

> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>
> ---
> 
> 
> Martin Jansa (2):
>   e-base: bump SRCREV and update fix-ecore-fb-initialization.patch
>     patch for ecore_svn
>   embryo, epdf: fix LICENSE, from oe.dev
> 
>  meta-efl/classes/e-base.bbclass                    |    2 +-
>  .../ecore-1.0.0/fix-ecore-fb-initialization.patch  |   28 ++++++++++++++++++++
>  .../efl/ecore/fix-ecore-fb-initialization.patch    |   17 ++++++-----
>  meta-efl/recipes-efl/efl/embryo.inc                |    7 +++--
>  meta-efl/recipes-efl/efl/epdf_svn.bb               |   10 ++++---
>  5 files changed, 48 insertions(+), 16 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/efl/ecore-1.0.0/fix-ecore-fb-initialization.patch
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNySetMkyGM64RGpERAgsMAJ96n5AxLMROdUwXcCZMtZffK9yYpQCgomME
SN3s0+RAGu83vZsbhYBrk68=
=LxVa
-----END PGP SIGNATURE-----



