Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SlPbw-0005DR-2z
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jul 2012 21:15:08 +0200
Received: by pbbrq2 with SMTP id rq2so6532375pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jul 2012 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=m2L2VZGWsbKBUr3lLhc0SHgM41MHjjFzoW35asHsiqo=;
	b=uXzT5xHriPh1Lc4mPN4Rw50MS/nHYs9G0fe/sBqfDcBWA1SRrVFgY/z7rXhbuEh3hP
	ykhjEhzPi9ERuIQvjhlCh6GweUxldf1KhkM3f8RE5tP9/CwYz2C1uoGlBQKi5xEvkRyP
	Hf99r4BJ1xRZVeMzUZY6tWJNQnM/R23t8UHED7HlF3N7Yr0hFl89SpfnQPOdUG+OFkyp
	7lMstJr0liE6RVUH/REsFLY5OGOFbraLXNIKZt6qyFw69MgKOMcXzELlLHNjDRlZSQxQ
	nxB8AHWTIG0h1bBFSYNt1sPSISR72Cf2IkkRemLHoiXwDg5bsQYNqaU0Mctie96z9JFq
	YMrQ==
Received: by 10.68.197.136 with SMTP id iu8mr23496132pbc.111.1341169447433;
	Sun, 01 Jul 2012 12:04:07 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id ph1sm11056138pbb.45.2012.07.01.12.04.05
	(version=SSLv3 cipher=OTHER); Sun, 01 Jul 2012 12:04:06 -0700 (PDT)
Message-ID: <4FF09F24.2080407@gmail.com>
Date: Sun, 01 Jul 2012 12:04:04 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1341168983-10756-1-git-send-email-apelete@seketeli.net>
In-Reply-To: <1341168983-10756-1-git-send-email-apelete@seketeli.net>
X-Enigmail-Version: 1.4.2
Subject: Re: [oe-classic][PATCH 0/1] psplash: convert from svn.o-hand.com to git.yoctoproject.org
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
X-List-Received-Date: Sun, 01 Jul 2012 19:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/1/2012 11:56 AM, Apelete Seketeli wrote:
> Hello,
> 
> The psplash recipes found in oe-classic were still relying on the 
> svn.o-hand.com repository. I converted them to use the 
> git.yoctoproject.org repository instead.
> 
> Please note that I chose do that conversion instead of simply
> rebasing on the psplash_git.bb recipe found in oe-core because the
> oe-core recipe was written to work with newer versions of bitbake
> that are not compatible with oe-classic (versions beyond 1.12.0).
> 
> The patch that comes as a follow-up of this message is what it's
> all about.


Apelete

Thanks for all your patches. Could you rebase all your patches against
2011.03 branch and send a pull request for that maintenance branch since
it will be of interest to that branch

Thx
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/wnyQACgkQuwUzVZGdMxTkHgCdFY590Hw/pJL9lNcdODM6yNc7
aqMAn2MCZ9ltaq6Vm4UIVm1RmnwQdxzc
=ToCw
-----END PGP SIGNATURE-----


