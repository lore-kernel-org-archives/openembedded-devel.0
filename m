Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TRLJO-0003TI-WA for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 13:09:19 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TRL6V-0004pw-1I for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 12:55:59 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:55:59 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:55:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 25 Oct 2012 12:55:47 +0200
Message-ID: <k6b5r8$edu$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
X-Enigmail-Version: 1.4.4
Subject: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Thu, 25 Oct 2012 11:09:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

We need a branch to track oe-core 'danny' and I am swamped till ELC-E
happens, so I would like to hold off on patches that make meta-oe layers
incompatible with oe-core 'danny'.

As for branch maintenance: any volunteers for managing the meta-openembedded
'danny' branches? There doesn't need to be a single maintainer, but it would
be nice to have one person coordinating everything, even if it's just
pulling in danny-next branches from the layer maintainers every week or so.

As I said above, I'm swamped for the next 3 weeks, so can people who have
used or are using the 'denzil' branch weigh in with feedback/anecdotes/etc?
I have such a document for oe-core 'denzil', which I keep failing to send
out, but it boils down to "better predictability for merge windows". Please
share your experience for meta-oe here.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQiRqzMkyGM64RGpERAschAJ98yscNYLI9qNGRviDm+drBquLttACgoa0X
/YhGdFr+iYLy8n99sXb4zKE=
=ahtL
-----END PGP SIGNATURE-----



