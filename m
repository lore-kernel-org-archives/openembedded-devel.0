Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ra6J9-0005LG-UM for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 14:52:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ra6CU-0004bx-Bj for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 14:45:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 14:45:50 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 14:45:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 12 Dec 2011 14:45:33 +0100
Message-ID: <jc50ht$phq$1@dough.gmane.org>
References: <1323687379-25490-1-git-send-email-s.stirtzel@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1323687379-25490-1-git-send-email-s.stirtzel@googlemail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] florence: Initial recipe added
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
X-List-Received-Date: Mon, 12 Dec 2011 13:52:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-12-11 11:56, Samuel Stirtzel schreef:
> Florence is a virtual keyboard used to input text with a touchscreen.
> 
> Tests: * Run tested on Overo Gumstix with xfce-nm-image * Build tested
> for Qemuarm
> 
> Known issues: * Florence cannot access the gconf settings?

Does adding 'inherit gconf' fix that?

For v2 don't forget to add --subject-prefix meta-oe to your git-send-email
command.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7mBXoACgkQMkyGM64RGpH67QCghKjiqTVzHTcu9vmFpYvJ2cAO
oEkAn3J+wddb2f8fIJeBkAvdwBQTkTKY
=oknF
-----END PGP SIGNATURE-----



