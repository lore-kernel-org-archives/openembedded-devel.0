Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qwx1x-0007BE-0y for openembedded-devel@lists.openembedded.org;
	Fri, 26 Aug 2011 16:05:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QwwxG-0004uQ-2S for openembedded-devel@lists.openembedded.org;
	Fri, 26 Aug 2011 16:00:18 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2011 16:00:18 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2011 16:00:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 26 Aug 2011 16:00:04 +0200
Message-ID: <j388t4$9u$1@dough.gmane.org>
References: <1314364721-3871-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314364721-3871-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3
Subject: Re: [PATCH] evas: add evas-loader-svg back to RRECOMMENDS
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
X-List-Received-Date: Fri, 26 Aug 2011 14:05:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-08-11 15:18, Martin Jansa schreef:
> * it doesn't look like whole Gtk+ anymore, but still needs gdk-pixbuf, libcairo2 etc.
> 
> Package: evas-loader-svg Depends: libxcb1 (>= 1.7), libxrender1 (>= 0.9.6), libpixman-1-0 (>= 0.22.2), libxml2 (>= 2.7.8), libz1 (>= 1.2.5), librsvg-2-2 (>= 2.32.1), libfreetype6 (>= 2.4.6), eina (>= 1.0.999+svnr62850), libgcrypt11 (>= 1.4.6), libpng12-0 (>= 1.2.46), libffi5 (>= 3.0.9),
> gdk-pixbuf (>= 2.22.1), libcairo2 (>= 1.10.2), libstdc++6 (>= 4.6.1+svnr175454), libglib-2.0-0 (>= 2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4), libxau6 (>= 1.0.6), libjpeg8 (>= 8c), libx11-6 (>= 1.4.3), evas (>= 1.0.999+svnr62850), libfribidi0 (>= 0.19.2), libc6 (>= 2.13), pango (>=
> 1.28.3), libgpg-error0 (>= 1.10), libgnutls26 (>= 2.12.5), libeet1 (>= 1.4.999+svnr62850), libtasn1-3 (>= 2.9), libexpat1 (>= 2.0.1), libxdmcp6 (>= 1.1.0), libfontconfig1 (>= 2.8.0)
> 
> Package: librsvg-2-2 Depends: libx11-6 (>= 1.4.3), libpixman-1-0 (>= 0.22.2), libxcb1 (>= 1.7), libc6 (>= 2.13), libxrender1 (>= 0.9.6), libffi5 (>= 3.0.9), libxml2 (>= 2.7.8), libz1 (>= 1.2.5), libfreetype6 (>= 2.4.6), gdk-pixbuf (>= 2.22.1), libpng12-0 (>= 1.2.46), libcairo2 (>= 1.10.2),
> libstdc++6 (>= 4.6.1+svnr175454), libglib-2.0-0 (>= 2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4), libxau6 (>= 1.0.6), libexpat1 (>= 2.0.1), pango (>= 1.28.3), libxdmcp6 (>= 1.1.0), libfontconfig1 (>= 2.8.0)
> 
> * but otherwise e-wm keeps complaining about missing svg support <<<< Enlightenment Error >>>> Enlightenment found Evas can't load SVG files. Check Evas has SVG loader support.
> 
> * we can also RRECOMMEND it only from e-wm, so people using only evas without e-wm won't get it by default

whatever option you choose, you must bump PR :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOV6bkMkyGM64RGpERAk9DAJwJ5aM6OlF3EiroT+s+mCZkeiH9UACdEUzX
PafTuNaHZE7jL4I5l17zErk=
=Cfge
-----END PGP SIGNATURE-----



