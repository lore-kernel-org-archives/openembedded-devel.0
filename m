Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCyKu-0002ad-RV for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:06:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCyH5-0006au-RB for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:02:11 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 19:02:11 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 19:02:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 14 May 2010 19:01:57 +0200
Message-ID: <hsjvm5$m40$1@dough.gmane.org>
References: <alpine.DEB.2.00.1005141154440.30572@lynx>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <alpine.DEB.2.00.1005141154440.30572@lynx>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: current angstrom/beagle breakage: firefox and abiword
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
X-List-Received-Date: Fri, 14 May 2010 17:06:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-05-10 17:56, Robert P. J. Day wrote:
> 
>   long story short:
> 
> ... snip ...
> ERROR: Task 3295 (/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb, do_install) failed
> ERROR: Task 3457 (/home/rpjday/oe/openembedded/recipes/abiword/abiword_2.8.3.bb, do_install) failed
> NOTE: Tasks Summary: Attempted 11085 tasks of which 11085 didn't need to be rerun and 2 failed.
> ERROR: '/home/rpjday/oe/openembedded/recipes/mozilla/firefox_3.6.3.bb' failed
> ERROR: '/home/rpjday/oe/openembedded/recipes/abiword/abiword_2.8.3.bb' failed
> 
>   i can post log file contents but, if experience is any guide, by the
> time i notice build breakage, someone else is already testing a fix.

Reading and applying http://catb.org/~esr/faqs/smart-questions.html
would help you a lot. My crystal ball is still in repairs.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL7YIEMkyGM64RGpERAlTAAJ4uzp7uxMj40XgAHFY20sVxWFDl2QCeJG2k
N9Nxncue6beHLHt3U+2y09c=
=X/JE
-----END PGP SIGNATURE-----



