Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCUFP-0001Qp-Bl for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 12:02:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCUD5-00076J-E9 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 12:00:35 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 12:00:35 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 12:00:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 20 Apr 2011 12:00:21 +0200
Message-ID: <iomarl$vjj$1@dough.gmane.org>
References: <cover.1303283391.git.michael.lippautz@gmail.com>	<iom5kt$2h5$1@dough.gmane.org>
	<1303291605.3979.10.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303291605.3979.10.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: state of oe and meta-oe
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
X-List-Received-Date: Wed, 20 Apr 2011 10:02:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-04-11 11:26, Paul Menzel wrote:

> Could you please clarify, what the current situation between the “old”
> OpenEmbedded repository and the layers, for example meta-oe, is.
> 
> I thought at some point the old repository would be imported, so that
> the history/commit log will be preserved.

Recipes get moved over piece by piece, cleaned up and added when people
need them. This way we don't get all the stale crud and we have people
cleaning up the recipes.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrq61MkyGM64RGpERAnE7AJ9qVk01J/mIWK4l4DY9GECqqPsa8ACghM+t
6QT9PfG2z9RG1i2Wy66h464=
=qLUy
-----END PGP SIGNATURE-----



