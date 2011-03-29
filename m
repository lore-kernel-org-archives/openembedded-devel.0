Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q4d94-0004RF-Qg for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 19:55:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q4d78-00079L-M6 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 19:53:58 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 19:53:58 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 19:53:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 29 Mar 2011 19:53:44 +0200
Message-ID: <imt6b8$ktl$1@dough.gmane.org>
References: <E1Q3y4q-00047f-Ns@melo.openembedded.org>	<20110328083149.GA7337@xora-eee.xora.org.uk>
	<AANLkTikP801Wp0c2BVr+9EQ5S0yfrzO8ONa7V3cU1BCp@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTikP801Wp0c2BVr+9EQ5S0yfrzO8ONa7V3cU1BCp@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [oe-commits] Andrea Adami : udev: remove udev-compat for Zaurus devices since we use 2.6 .38 finally.
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
X-List-Received-Date: Tue, 29 Mar 2011 17:55:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-03-11 11:00, Andrea Adami wrote:
> On Mon, Mar 28, 2011 at 10:31 AM, Graeme Gregory <dp@xora.org.uk> wrote:
>> Shouldnt this patch have a PR bump so udev already on devices is updated?
>>
>> Graeme
> 
> Ah, yes ...if we only had working images on devices ;)
> IIRC udev-compat was not accepted in Narcissus.

That's because noone wants to support zaurus devices in angstrom, only
bitch about them being unsupported.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNkhynMkyGM64RGpERAkFoAJ0VA+kAaABhjSR/SjZLdtMoGuBRrgCdFUko
mfThfdyrOZwrVCd3CMs3KT4=
=cc+u
-----END PGP SIGNATURE-----



