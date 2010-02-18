Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni2z2-0003TP-0h for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:47:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni2wS-0006de-Dp for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:45:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 10:45:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 10:45:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Feb 2010 10:43:44 +0100
Message-ID: <hlj24e$fdf$2@ger.gmane.org>
References: <20100214135613.GF5364@jama>
	<hlc4jp$cfc$1@ger.gmane.org>	<1266271477.31865.4.camel@trini-m4400>
	<201002181020.06007.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <201002181020.06007.marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Thu, 18 Feb 2010 09:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-02-10 10:20, Marcin Juszkiewicz wrote:
> Dnia poniedziałek, 15 lutego 2010 o 23:04:37 Tom Rini napisał(a):
> 
>> What are you (and everyone else saying it's fine) running the VM with?
>> I've got people reporting just unusable build times inside VMs on what
>> should be reasonable hardware.
> 
> From my tests VM builds are slower on my hardware. But thats due to fact that 
> VirtualBox or KVM use just one core for VM when natively I can use all 
> 4 cores. And this makes a difference.

Virtualbox uses 2 cores for my vm, but my laptop only has 2 :) You can
even assign it virtual cores if you wish. In the XP and OSX vbox,
haven't tried the linux one yet.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfQvQMkyGM64RGpERAiJmAKCeYVyOn67vFW16DiBNagBqvAjWMACdG7p2
RIcTn8+tG1eIcDFeccakerY=
=qVR5
-----END PGP SIGNATURE-----



