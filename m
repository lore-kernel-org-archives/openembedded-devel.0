Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OfAsQ-00061u-5G for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 14:09:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OfAs2-0003nz-5h for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 14:08:54 +0200
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 14:08:54 +0200
Received: from k.kooi by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 14:08:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 31 Jul 2010 14:08:44 +0200
Message-ID: <i313oc$el$1@dough.gmane.org>
References: <9D2EA12D-A6C9-4965-A833-3B6CDCD8CD7B@mac.com>	<i30rks$8aq$2@dough.gmane.org>
	<1E016302-3017-40E6-9999-2A5DF47AF1F8@mac.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <1E016302-3017-40E6-9999-2A5DF47AF1F8@mac.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Which OE branch for beagleboard?
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
X-List-Received-Date: Sat, 31 Jul 2010 12:09:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-07-10 12:58, Elvis Dowson wrote:
> 
> On Jul 31, 2010, at 1:50 PM, Koen Kooi wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 31-07-10 11:46, Elvis Dowson wrote:
>>> Hi, 
>>>        Which OE branch should I use to build angstrom images for the beagleboard?
>>
>>
>> Use http://gitorious.org/angstrom/angstrom-setup-scripts [1], that will
>> setup the right branch and bitbake for you.
>>
> 
> I've been working on the overo till now, and switching to beagleboard, there used to be a linux-omap3-2.6.xx series, but I don't see the omap3 linux recipes anymore. 
> 
> http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux
> 
> Have they been replaced?
> 
> Which recipe would now how the correct omap3 recipe for beagle board with a TI OMAP 3530 processor?

'virtual/kernel' was, is and always will be the correct kernel for your
machines.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMVBJMMkyGM64RGpERAtK1AKC1sOuE4JZCiqYwG5ypwCcKpY2SKQCgkss7
mbcMuOxhpKrpzb5MPzhyBTg=
=3hK6
-----END PGP SIGNATURE-----



