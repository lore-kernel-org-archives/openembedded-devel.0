Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfUFs-00069w-Im for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:18:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfUDN-0001Sw-UF for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:15:57 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 09:15:57 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 09:15:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Feb 2010 09:15:31 +0100
Message-ID: <hl0eb2$j9c$1@ger.gmane.org>
References: <alpine.LFD.2.00.1002101712580.4390@localhost>	<19c1b8a91002101504g4a35ef13w50eb66548d8188b@mail.gmail.com>
	<19c1b8a91002101531v17e4421cp76126722c3f09f97@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <19c1b8a91002101531v17e4421cp76126722c3f09f97@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: freshly updated u-boot has malformed patch
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
X-List-Received-Date: Thu, 11 Feb 2010 08:18:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-02-10 00:31, Khem Raj wrote:
> On Wed, Feb 10, 2010 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Feb 10, 2010 at 2:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>>
>>>  beagleboard image as usual:
> 
> hmm I guess I should have read this line. Seems like beagle is using a
> revision which already has
> this patch applied. I will fix it.

And a lot of other machines I maintain as well, so for the time being
I'm going to revert this patch till someone actually boot tests this on
all affected machines.
I object to this untested patching of bootloaders.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLc7yjMkyGM64RGpERAmJqAJwMllh7QS+rKsxPJTqxleLh2JDDSACeNY7P
H4BfSD/udzhExoEGSGorbeY=
=2Wl9
-----END PGP SIGNATURE-----



