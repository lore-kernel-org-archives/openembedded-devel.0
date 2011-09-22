Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6dtW-00045B-S9 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 09:40:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R6doP-0000DY-1X for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 09:35:13 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 09:35:13 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 09:35:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Sep 2011 09:30:49 +0200
Message-ID: <j5eo79$fsf$2@dough.gmane.org>
References: <cover.1316616945.git.Imran_Mehmood@mentor.com>
	<f6663b97bd1237d2d9ea77ed839c446cb3aaa63e.1316616945.git.Imran_Mehmood@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
In-Reply-To: <f6663b97bd1237d2d9ea77ed839c446cb3aaa63e.1316616945.git.Imran_Mehmood@mentor.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH v3 2/2] twm: Add version 1.0.6 (initial recipe)
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
X-List-Received-Date: Thu, 22 Sep 2011 07:40:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-09-11 08:31, Mehmood, Imran schreef:
> From: Imran Mehmood <Imran_Mehmood@mentor.com>
> 
> * Imported from oe.dev commit id
> d90ee2735e9aa9d1a8dd7d0eb6a5917030a233d3 * Added bison-native to DEPENDS
> because during configure it searches for yacc and Defaults to the first
> program found out of: `bison -y', `byacc', `yacc' otherwise raises error
> 'yacc not found'. We don't face this error if we have built any other
> package that made yacc available, before building twm.

Applied, thanks!


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOeuQpMkyGM64RGpERAk/YAJwMpdOrJCgvsTDVZxxVXI6ejoYncQCfcYcY
6SewbpAfy1igP5lecYUHEAM=
=ffQX
-----END PGP SIGNATURE-----



