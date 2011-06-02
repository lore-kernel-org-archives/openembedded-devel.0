Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QSEdR-0003Bz-PS for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 22:36:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QSEaL-0000nJ-KP for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 22:33:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 22:33:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 22:33:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Jun 2011 22:33:26 +0200
Message-ID: <is8s2m$q7s$1@dough.gmane.org>
References: <1307029789-16236-1-git-send-email-pprakash@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1307029789-16236-1-git-send-email-pprakash@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v2] mcf-camera-app: Add new recipe for matrix camera streaming application
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
X-List-Received-Date: Thu, 02 Jun 2011 20:36:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-06-11 17:49, Punya Prakash wrote:

> +# Dude to CCSv5 limitation LDFLAGS cant be passed externally
> +# not providing INSANE_SKIP introduces GNU hash QA error
> +INSANE_SKIP_${PN} = "True"

That's a really, really poor excuse. If that were true all AMBU apps
would suffer from this, which they don't.

This recipe is not going in with either QA errors or INSANE_SKIP
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN5/OWMkyGM64RGpERAqzKAJ9gMErxk4sQKRfk2tQTORdTzv4umwCgvE69
Dq/4y3WQ7q4JH+bvuSIWDR8=
=Xug7
-----END PGP SIGNATURE-----



