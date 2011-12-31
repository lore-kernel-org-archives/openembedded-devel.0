Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rh4uS-00005F-AN for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 20:48:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rh4nQ-0002aK-PE for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 20:40:48 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 20:40:48 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 20:40:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 31 Dec 2011 20:40:40 +0100
Message-ID: <jdnofj$urk$1@dough.gmane.org>
References: <1325352759-321-1-git-send-email-bigotp@acm.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1325352759-321-1-git-send-email-bigotp@acm.org>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe] python-mysqldb: import from OE classic, update to 1.2.3
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
X-List-Received-Date: Sat, 31 Dec 2011 19:48:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-12-11 18:32, Peter A. Bigot schreef:
> From: "Peter A. Bigot" <bigotp@acm.org>
> 

> +++ b/meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb @@ -0,0
> +1,24 @@ +DESCRIPTION = "Python interface to MySQL" +HOMEPAGE =
> "http://sourceforge.net/projects/mysql-python/" +SECTION =
> "devel/python" +# "GPL or the original license based on Python 1.5.2's
> license" +LICENSE = "GPL"

That really needs a version specifier for the GPL version.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7/ZTYACgkQMkyGM64RGpFc8wCcCU8ufb4FiToMuk0WYns9eAea
+QkAoJd+xMnAHtk/Sf5eG2eoCusm8D/G
=maSn
-----END PGP SIGNATURE-----



