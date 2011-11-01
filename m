Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RL9n7-0008Il-ET for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:33:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RL9h6-00086I-0A for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:27:40 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 09:27:39 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 09:27:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 01 Nov 2011 09:27:27 +0100
Message-ID: <j8oahf$g4n$1@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<1881c344694290d71556dec7d9e784b6819f7a17.1319884094.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1881c344694290d71556dec7d9e784b6819f7a17.1319884094.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl][meta-oe 07/12] e-base: bump EFL_SRCREV and refresh patches and elementary version
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
X-List-Received-Date: Tue, 01 Nov 2011 08:33:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-10-11 12:29, Martin Jansa schreef:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I get:

c evas_engine.c  -fPIC -DPIC -o .libs/module_la-evas_engine.o
| evas_engine.c: In function '_sym_init':
| evas_engine.c:493:115: warning: assignment from incompatible pointer type
| evas_engine.c:493:273: warning: assignment from incompatible pointer type
| evas_engine.c: In function 'eng_gl_make_current':
| evas_engine.c:3223:9: error: 'rsc' undeclared (first use in this function)
| evas_engine.c:3223:9: note: each undeclared identifier is reported only
once for each function it appears in
| evas_engine.c: In function 'eng_gl_api_get':
| evas_engine.c:3600:30: warning: assignment from incompatible pointer type
| make[5]: *** [module_la-evas_engine.lo] Error 1
| make[5]: *** Waiting for unfinished jobs...

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD4DBQFOr61vMkyGM64RGpERAnBUAJoD72qOUzuULyChDz8vLl13lBE5rgCY2RHN
HcL5T8UkOy84Lr+z6i7dIg==
=6yE7
-----END PGP SIGNATURE-----



