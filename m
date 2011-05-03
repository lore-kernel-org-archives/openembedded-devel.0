Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHJvo-0002A4-GB for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 20:02:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHJtI-0000sV-8f for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 20:00:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 20:00:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 20:00:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 May 2011 19:59:48 +0200
Message-ID: <ippfqk$8lq$1@dough.gmane.org>
References: <iplshp$vse$1@dough.gmane.org> <4DC01BD9.8000304@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DC01BD9.8000304@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] Pull request #16
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
X-List-Received-Date: Tue, 03 May 2011 18:02:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-05-11 17:14, Tom Rini wrote:
> On 05/02/2011 02:12 AM, Koen Kooi wrote:
>> Tom,
> 
>> Please pull the 5 commits from here:
> 
>> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
>> Branch: 2011.03-maintenance
> 
>> Jeff Lance (1):
>>       am-benchmarks: add return values
> 
>> Koen Kooi (3):
>>       opencv 2.2: fix opencv-dev dependency chain
>>       opencv 2.2: include actual headers in the -dev package
>>       linux-omap-psp 2.6.32: add support for 5MP camera board
> 
>> Michael 'Mickey' Lauer (1):
>>       qt4-embedded: enable support for the built-in LinuxInput keyboard
> 
>> Philip Balister (1):
>>       uhd : Update to latest release. Both source and fpga images.
> 
>> These are all cherry-picks from .dev.
> 
> (Aside: I'm going to start giving all pull requests a day or so to
> settle before I pull them, to make sure anyone that wants to comment on
> them can, wiki updated).

FWIW Denys and I are also giving commits a (working) day in .dev before
putting them in a pull requests to help catch silly typo bugs.

So for TI things that means there's a 2 day minimum delay between
hitting .dev and maintenance. That seems to be a good trade-off between
speed and review.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNwEKUMkyGM64RGpERAqL7AJ4kbCFvyfGc1clLNeNSqDVzZZ3lUQCfQVtc
GnZRMck12ogEgzsuYg7zU/E=
=r9la
-----END PGP SIGNATURE-----



