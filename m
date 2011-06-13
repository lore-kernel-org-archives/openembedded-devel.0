Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QW86g-0005Sf-IO for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 16:27:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QW83Q-0005od-8l for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 16:23:48 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 16:23:48 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 16:23:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 16:23:33 +0200
Message-ID: <it56h5$u14$1@dough.gmane.org>
References: <1307713686-30844-1-git-send-email-gchiii@mtiemail.com>	<4DF29E37.9020204@mentor.com>
	<BANLkTik+vDEFKeV3U+CdF5Qg3xx2ApzTvQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTik+vDEFKeV3U+CdF5Qg3xx2ApzTvQ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] fakeroot: Move from not fetchable 1.14.5 to 1.15.1
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
X-List-Received-Date: Mon, 13 Jun 2011 14:27:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

The angstrom mirror has that, among other goodies

On 13-06-11 16:11, George C. Huntington, III wrote:
> I've tried to find the fakeroot_1.14.5.orig.tar.bz2, does anyone have this
> mirrored?
> 
> 
> On Fri, Jun 10, 2011 at 6:44 PM, Tom Rini <tom_rini@mentor.com> wrote:
> 
> On 06/10/2011 06:48 AM, George C. Huntington III wrote:
>>>> From: Florian Boor <florian.boor@kernelconcepts.de>
>>>>
>>>> Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
>>>>
>>>> Test environment:
>>>>     BB_VERSION        = "1.10.2"
>>>>     METADATA_BRANCH   = "org.openembedded.dev"
>>>>     TARGET_ARCH       = "arm"
>>>>     TARGET_OS         = "linux-gnueabi"
>>>>     MACHINE           = "mainstone"
>>>>     DISTRO            = "minimal"
>>>>     DISTRO_VERSION    = "dev-snapshot-20110504"
>>>>     TARGET_FPU        = "soft"
>>>>
>>>> Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
> 
> For 2011.03-maintenance I'm going to NAK this.  A mirror setup is
> required as we aren't trying to keep up to date with the tzdata/tzcode
> mess and these are available via the angstrom mirror (and if needed
> could be put on the regular OE mirror).  Thanks for your interest in the
> stable branch, all the same!
> 
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN9h1lMkyGM64RGpERAmawAKChxN1zI85TyiLwV5PVKFMbIEb+ZQCfbdsr
rul9gWorOumVf8PVOX4gg/A=
=XLwJ
-----END PGP SIGNATURE-----



