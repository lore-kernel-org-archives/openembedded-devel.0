Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TbTxW-0000Tg-ST for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 11:24:40 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TbTk4-0005B4-BJ for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 11:10:44 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 11:10:44 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 11:10:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Nov 2012 11:10:29 +0100
Message-ID: <k8ktmf$n7a$1@ger.gmane.org>
References: <20121122084944.2288A10397@opal>
	<20121122085136.GV12637@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <20121122085136.GV12637@jama.jama.net>
X-Enigmail-Version: 1.4.4
Subject: Re: [oe-commits] Martin Jansa : qt4-x11-free: drop bbappend for 4.8.1
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
X-List-Received-Date: Thu, 22 Nov 2012 10:24:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-11-12 09:51, Martin Jansa schreef:
> On Thu, Nov 22, 2012 at 08:49:43AM +0000, git@git.openembedded.org
> wrote:
>> Module: meta-openembedded.git Branch: danny Commit:
>> bb3d744481c148ef570d9dfe0eb5f6821d02318b URL:
>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=bb3d744481c148ef570d9dfe0eb5f6821d02318b
>
>> 
> This isn't right ^, should be in master only.
> 
> Both qt4 bbappends and dhcp bbappend change

I'm a moron, the danny branch was supposed to be 'empty', but I forgot to
switch back to master. Revert pushed.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQrfoUMkyGM64RGpERAoL5AKC4LeNMSAAzCC8NA40Kl/o5dG3X/wCfUYnC
ruUjwfbxfjmEawbcs4l31fY=
=LHDf
-----END PGP SIGNATURE-----



