Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDua1-0003yw-HM for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:49:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDuZD-0007ph-Di for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:49:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 08:49:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 08:49:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Nov 2010 08:48:51 +0100
Message-ID: <iatoh3$1mq$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org>	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>	<iaptb1$bpb$1@dough.gmane.org>
	<4CD07F3E.7040703@eukrea.com>	<4CD080E2.2000706@mentor.com>	<AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>	<4CD178C2.9010303@mentor.com>	<AANLkTi=D76QqygmJRdOPEeZJNL9N2X0vyYV8UPVNDPDH@mail.gmail.com>	<4CD1C33D.3040207@mentor.com>
	<AANLkTiknWyRh2L9u9jbgYgvK5dXx7x2VFeKGhh89TAxJ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTiknWyRh2L9u9jbgYgvK5dXx7x2VFeKGhh89TAxJ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 04 Nov 2010 07:49:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-11-10 21:44, Khem Raj wrote:

> I dont think it would make sense to put things like gcc and binutils
> and core components
> into overlays.

I would put those into a 'devtools' layer, like poky has done.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM0mVjMkyGM64RGpERAspiAKCCVvbm5EWD3OejRvjSCxAxbBEsoQCfVjND
kvkJ8A0aRkuCV5lP28eXLas=
=rw7D
-----END PGP SIGNATURE-----



