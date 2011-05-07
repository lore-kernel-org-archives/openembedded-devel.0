Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QInhy-0007RN-PV for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 22:02:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QInfL-0004AO-E9 for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 21:59:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 21:59:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 21:59:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 07 May 2011 21:59:38 +0200
Message-ID: <iq48ba$1rt$1@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] Pull request for misc changes
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
X-List-Received-Date: Sat, 07 May 2011 20:02:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-05-11 21:19, Otavio Salvador wrote:
> Hello,
> 
> On the process of migrating our products to oe-core we have done some
> changes up to now...
> 
> The following changes since commit 1325cc262c3f1e3cb5153aff98287ea8c65b15cf:
> 
>   gcc-4.5: add checksums (2011-05-02 11:10:30 +0200)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe master
> 
> Otavio Salvador (8):
>       fuse: add 2.8.5
>       ntfs-3g-ntfsprogs: add 2011.4.12 recipes
>       setxkbmap: add 1.2.0 version
>       freerdp: add recipe based on GIT from 2009-03-29
>       pixman.inc: use Xorg mirror
>       p910nd: add 0.95 version
>       libiconv: drop hack since gettext was being inherited
>       libinih: add git recipe

Otavio, could you please post all your patches to this list as well?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxaSpMkyGM64RGpERAqO5AJ48Ky5UuExC80voXTB3yVTF5eM3jgCgpnWr
8Bzr4QqKiOBprQU6oRQiRuo=
=GS5f
-----END PGP SIGNATURE-----



