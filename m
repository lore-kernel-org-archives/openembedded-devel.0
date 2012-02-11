Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RwLhv-0005HJ-FW for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 23:46:15 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RwLa3-0005le-Ka for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 23:38:07 +0100
Received: from 108.60.121.130 ([108.60.121.130])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 23:38:07 +0100
Received: from koen by 108.60.121.130 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 23:38:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 11 Feb 2012 23:37:57 +0100
Message-ID: <jh6qk3$vck$1@dough.gmane.org>
References: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 108.60.121.130
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-xfce] xfce4-session: move static libraries to ${PN}-staticdev to avoid QA warnings
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
X-List-Received-Date: Sat, 11 Feb 2012 22:46:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-02-12 01:14, Andreas Müller schreef:
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
> .../xfce4-session/xfce4-session_4.8.2.bb           |    4 ++--

Which of the other patches listed in
http://patches.openembedded.org/project/oe/list/?q=meta-xfce should I push
as well?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk827cMACgkQMkyGM64RGpHLtgCfQkJKQ45w7zzrITl2M7r1/CTA
xUoAn396EZvBJM+cvR6AfA3KFaD9qHZT
=TxXO
-----END PGP SIGNATURE-----



