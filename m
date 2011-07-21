Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qjmnl-00082X-Pi for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 08:32:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qjmjm-00047z-Jr for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 08:27:58 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:27:58 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:27:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Jul 2011 08:27:46 +0200
Message-ID: <j08gt2$tdv$1@dough.gmane.org>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <cover.1311195484.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH 0/5] Pull request #18
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
X-List-Received-Date: Thu, 21 Jul 2011 06:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-07-11 22:58, Martin Jansa schreef:
> The following changes since commit 037a063303d35c2fab8097d977aa5625c916c565:
> 
>   connman: update to 0.76 (2011-07-20 09:13:00 +0200)
> 
> are available in the git repository at:
>   git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe
> 
> Martin Jansa (5):
>   vala-dbus-binding-tool: inherit perlnative
>   pidgin: inherit perlnative
>   tangogps: add misssing dependency bluez4
>   bluez4: add missing dependency usbpath
>   vala-terminal: inherit perlnative

Thanks, I pulled these in and will push to the OE servers once ssh gets fixed. In the meantime, it's at github: https://github.com/koenkooi/meta-oe/commits/master
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOJ8biMkyGM64RGpERAnGHAJ0Rrn4XPdSBz2k+4OMPAnIstU7+/QCeMUdp
KfxAxrJoCbeL3mzP9Jm9Yms=
=lQSI
-----END PGP SIGNATURE-----



