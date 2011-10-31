Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKpvc-0000vh-Ig for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:21:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKppc-0004OY-GR for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:15:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 12:15:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 12:15:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 31 Oct 2011 11:51:24 +0100
Message-ID: <j8lujc$7vb$5@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<ff2c3e6a8645c6120d4770be1592e7644ab72ad2.1319884094.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <ff2c3e6a8645c6120d4770be1592e7644ab72ad2.1319884094.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl][meta-oe 06/12] liblinebreak: import from openembedded classic
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
X-List-Received-Date: Mon, 31 Oct 2011 11:21:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-10-11 12:29, Martin Jansa schreef:
> From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> 
> The License was verified and LIC_FILES_CHKSUM was added
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> Signed-off-by:
> Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../liblinebreak/liblinebreak_1.2.bb               |   13 +++++++++++++ 1
> files changed, 13 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> 
> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb new file mode
> 100644 index 0000000..03c4352 --- /dev/null +++
> b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb @@ -0,0 +1,13
> @@ +DESCRIPTION = "Liblinebreak is an implementation of the line breaking
> algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22" 
> +HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/" +SECTION =
> "libs" +PRIORITY = "optional"

PRIORITY doesn't exist anymore, please remove it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOrn2sMkyGM64RGpERAu9iAJ91VSMJHuLUIhyyyzYN1tBf+oJXoACghkzx
3dNmEJ54T5jOC5xz5zxIaUw=
=3L7G
-----END PGP SIGNATURE-----



