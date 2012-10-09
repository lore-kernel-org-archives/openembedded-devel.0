Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLZ9R-0008MG-Cr for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:43:09 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLYwl-0003SB-UR for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:30:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 14:30:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 14:30:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 14:27:40 +0200
Message-ID: <k5157e$he4$2@ger.gmane.org>
References: <1348594741-21920-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1srkgtpOhjkY1hb_FTZjD+9e=PF8PbdX=tez_OyCxZwKpQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <CAMKF1srkgtpOhjkY1hb_FTZjD+9e=PF8PbdX=tez_OyCxZwKpQ@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-systemd][PATCH] systemd: Upgrade past v191
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
X-List-Received-Date: Tue, 09 Oct 2012 12:43:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-10-12 20:06, Khem Raj schreef:
> ping
> 
> On Tue, Sep 25, 2012 at 10:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Booted on eglibc/uclibc i586 systems
>> 

Let's update to 011afa76fb7b888a0a29e46665708c404f991e5d so we also get the
infamous udev firmware fix for people not running 3.7-rc0 or newer.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQdBg8MkyGM64RGpERAsEEAJ9QxIoa84dpN5u4xbnPich48KI7OQCfcdNr
NdJbTKPY/EvlF4oKghKsTK8=
=A6F3
-----END PGP SIGNATURE-----



