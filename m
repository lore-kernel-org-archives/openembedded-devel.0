Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxNPv-0005ni-52 for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 21:20:11 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxNEd-0006LB-Ct for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 21:08:31 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 21:08:31 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 21:08:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 03 Aug 2012 21:08:17 +0200
Message-ID: <jvh7it$saj$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
	<E805BE26-25B7-4EC5-80C6-4200151E1DC5@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <E805BE26-25B7-4EC5-80C6-4200151E1DC5@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Fri, 03 Aug 2012 19:20:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-08-12 20:39, Khem Raj schreef:
> 
> On Aug 3, 2012, at 8:36 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>>> . However, my original motivation is to make this layer independent 
>>> enough and remove the layer dependencies it has It will make both
>>> layers thrive IMO. I proposed removal of using gitpkgv you did not
>>> like that, then I proposed this to remove use of SRCREV completely
>>> this also is objected on. may I ask what other option do you have ? I
>>> am willing to make a solution. Ultimately this will make systemd
>>> integration into OE-Core as reference init system easier.
>> 
>> Move gitpkgv into oe-core
> 
> 
> will it even be necessary with autopr ?

PV != PR!!!!One!!!!eleven!!!!

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQHCGhMkyGM64RGpERAuUrAKCcsXZzLSoVOK6qVS+dHz3ohp5EsgCgs0XS
ssK5c/quhHOFaekH02udVn4=
=tQVt
-----END PGP SIGNATURE-----



