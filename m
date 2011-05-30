Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQxGO-0001SH-QR for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 09:51:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQxDO-0006tp-QQ for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 09:48:42 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 09:48:42 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 09:48:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 May 2011 09:48:31 +0200
Message-ID: <irvi4f$e61$1@dough.gmane.org>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>	<iru7dr$di8$1@dough.gmane.org>
	<20110529200323.GB18119@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110529200323.GB18119@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 00/16] Pull request #12
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
X-List-Received-Date: Mon, 30 May 2011 07:51:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-05-11 22:03, Martin Jansa wrote:
> On Sun, May 29, 2011 at 09:39:39PM +0200, Koen Kooi wrote:
> On 29-05-11 21:17, Martin Jansa wrote:
>>>> Hi,
>>>>
>>>> please merge this patchset, after this I have working 3 gps apps 
>>>> and I'm closer to shr-full-image from shr-core.
>>>>
>>>> The following changes since commit 7d6edbf446e338643542beab81fecb23340ad65b:
>>>>
>>>>   policykit: drop recipes, oe-core has newer versions named right polkit (2011-05-28 16:42:55 +0200)
>>>>
>>>> are available in the git repository at:
>>>>   git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
>>>>   http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/meta-oe
>>>>
>>>> Martin Jansa (16):
>>>>   farsight2: fix LICENSE and add LIC_FILES_CHKSUM
>>>>   libnice: improve LICENSE and add LIC_FILES_CHKSUM
>>>>   tangogps: add LIC_FILES_CHKSUM and drop distro override
>>>>   pidgin: add LIC_FILES_CHKSUM
>>>>   evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   gpsd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   foxtrotgps: import from OE rev
>>>>     d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   tiff: add bbappned with native BBCLASSEXTEND
>>>>   gd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   librsvg: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   imagemagick: import from OE rev
>>>>     d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   portaudio: import from OE rev
>>>>     d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   alsa-oss: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   flite-alsa: import from OE rev
>>>>     d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   espeak: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>>>>   navit: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> 
> Looks good to me, will push after running some test builds.
> 
>> Thanks, I'm working on task-cli-tools(-debug) now.

Pushed, let me know when you have updated the pull branch for #13
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN40vPMkyGM64RGpERAuAmAJ4jXc26zRuzi0UkWBME/guvLCSC2QCeKlcg
mHjcichUq72UGyYB93XI6bk=
=Rjda
-----END PGP SIGNATURE-----



