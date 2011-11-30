Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RVgfm-0008W5-6x for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:41:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RVgZM-0008PL-2U for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:35:12 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:35:12 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:35:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Nov 2011 10:28:41 +0100
Message-ID: <jb4t09$rmo$3@dough.gmane.org>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
	<ecba1c3e0b6a24b2dfe237b04ad6789b32014391.1322640506.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <ecba1c3e0b6a24b2dfe237b04ad6789b32014391.1322640506.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-efl 11/11] elementary: disable web support
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
X-List-Received-Date: Wed, 30 Nov 2011 09:41:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-11-11 09:16, Martin Jansa schreef:
> * we don't have webkit-efl in DEPENDS so it depends on build order if
> it's autodetected or not for elementary * libewebkit0 is quite bit so we
> don't want to pull it to every image with elementary

I was about to suggest splitting it...

> * and we cannot split elementary web support to different package because
> libewebkit is linked directly from libelementary-ver-pre-svn-09.so.0.8.0

... but you've already answered that :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7V90kACgkQMkyGM64RGpGU2QCeLWMPS7hTu+eOdbalBWFC7qGj
MksAoI4wCu7TWda3b8qNG0uRUeRMXC0/
=aOVT
-----END PGP SIGNATURE-----



