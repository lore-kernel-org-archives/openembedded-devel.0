Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R4TlE-0004Vr-Hv for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 10:27:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R4TgC-0005Qp-Hh for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 10:21:48 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 10:21:48 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 10:21:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Sep 2011 10:21:36 +0200
Message-ID: <j4v0ug$ojv$1@dough.gmane.org>
References: <cover.1316156746.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <cover.1316156746.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-efl][PATCH 0/4] Pull request #12
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
X-List-Received-Date: Fri, 16 Sep 2011 08:27:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-09-11 09:08, Martin Jansa schreef:
> The following changes since commit
> 9c4ff53d2fa688581d257eb7e045f9e6a20470d3:
> 
> vlc: update to 1.1.11 and fix xml2 build (2011-09-15 15:59:26 +0200)
> 
> are available in the git repository at: 
> git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl
>
>  pespin (4): enjoy: Add var LIC_FILES_CHKSUM to recipe enjoy: Add inherit
> gettext enjoy: Update gstreamer package names in RDEPENDS enjoy: Add
> gst-plugins-good-autodetect to RDEPENDS

I'm not going to pull the gstreamer ones till the oe-core situation is
sorted out on that front.
My other complaint is the lack of a proper author, could you please fix that up?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOcwcPMkyGM64RGpERAgdHAJ9RJ7X7Cd61X0U0a3MfOp6p6stQlwCgoKKj
6J+kRvXdfoWwt5MRmoNq9s8=
=Q+Ip
-----END PGP SIGNATURE-----



