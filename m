Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ow8cQ-0001MD-DM for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 09:10:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ow8bb-0007BA-Q4 for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 09:10:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 09:10:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 09:10:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Sep 2010 09:06:23 +0200
Message-ID: <i6sflf$qq$3@dough.gmane.org>
References: <1284570332-6484-1-git-send-email-coolaj86@gmail.com>
	<AANLkTimiUfDtop++PS6YhwtYh3b_e7pMpEN7GuE2LLYc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTimiUfDtop++PS6YhwtYh3b_e7pMpEN7GuE2LLYc@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nodejs: replaced v0.2.0 with v0.2.1
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
X-List-Received-Date: Thu, 16 Sep 2010 07:10:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-09-10 19:55, Cliff Brake wrote:
> On Wed, Sep 15, 2010 at 1:05 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>> From: AJ ONeal <coolaj86+fastr@gmail.com>
>>
>> * now includes node-waf and node-repl
>> * updated pathname in libev-cross-cc and libev-cross-cc
>> * removed patch which is no longer necessary (applied upstream)
> 
> Pushed, thanks!

Could please pay more attention next time? This introduces 2 big
regressions that were previously fixed by:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3967caeb51d7427980e06fd8b6e23c8fdc75e791
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMkcHvMkyGM64RGpERAsElAJ9SOUdmISqP43r50YImwV8z248j1ACfcrha
kRAib6gnBmPQ5b1NBCPygTs=
=b0Gq
-----END PGP SIGNATURE-----



