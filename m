Received: from 206-248-190-39.dsl.teksavvy.com ([206.248.190.39]
	helo=yow-jmacdona-d2.wrs.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1T65LX-0006We-U1
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 21:51:40 +0200
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)
	id 0D9606A7AD2; Fri, 24 Aug 2012 14:11:40 -0400 (EDT)
Date: Fri, 24 Aug 2012 14:11:39 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120824181139.GL3391@windriver.com>
References: <1345812827-14588-1-git-send-email-joe.macdonald@windriver.com>
	<k186lk$64e$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <k186lk$64e$1@ger.gmane.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] meta-networking: add layer
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
X-List-Received-Date: Mon, 27 Aug 2012 19:51:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[Re: [oe] [meta-oe][PATCH] meta-networking: add layer] On 12.08.24 (Fri 17:30) Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 24-08-12 14:53, Joe MacDonald schreef:
> > A home for networking-related packages.  This includes protocol support, 
> > servers / daemons and utilities.
> > 
> > Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com> --- 
> > meta-networking/COPYING.MIT                      | 17 +++++++++++++ 
> > meta-networking/MAINTAINERS                      | 31
> > ++++++++++++++++++++++++ meta-networking/README
> > | 16 ++++++++++++ meta-networking/conf/distro/oe-networking.conf   |  2
> > ++ meta-networking/conf/distro/poky-networking.conf |  4 +++
> 
> Drop the distro stuff, those don't belong in a meta-oe sublayer

Right, I should've caught that.  Sorry.

Updated patch enroute.

-J.

> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
> 
> iD8DBQFQN534MkyGM64RGpERAhTqAJ9bBbe3PPvdxY8vNUbI9vMVOybW8ACgrgXK
> No2VBmX+kP3EyBuxhBiI2d8=
> =eAFB
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind River
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283


