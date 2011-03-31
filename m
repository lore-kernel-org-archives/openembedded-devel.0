Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5MWi-0000Wt-Ah for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:23:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5MUn-0005MF-OU for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:21:25 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 20:21:25 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 20:21:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 31 Mar 2011 20:21:11 +0200
Message-ID: <in2gmn$ucl$1@dough.gmane.org>
References: <in21a8$jod$1@dough.gmane.org> <4D94AF48.1090500@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D94AF48.1090500@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] Pull request #9
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
X-List-Received-Date: Thu, 31 Mar 2011 18:23:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-03-11 18:43, Tom Rini wrote:
> On 03/31/2011 06:58 AM, Koen Kooi wrote:
>> Tom,
> 
>> Please pull the 5 commits from here:
> 
>> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
>> Branch: 2011.03-maintenance
> 
>> Philip Balister (3):
>>       autoconf: Fix paths for scripts installed on the target.
>>       automake: Fix paths in scripts installed on target.
>>       qmake2: Define env var for strip. Convert to use INC_PR.
> 
>> Tom Rini (2):
>>       In a large number of patches, remove unneeded '..' in paths.
>>       tcl: Rework mips-tclstrtod.patch
> 
>> You can view the branch online at
>> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
> 
>> The ones from Philip fix the native toolchain and you know what your
>> patches do :)
> 
> Actually, I want to NAK my own patches here.  After pushing here (and
> Mark Hatle pushing to oe-core) I ran into patchdir param which lets us
> not have to do patches in do_configure (which is really kinda wrong).
> Unfortunately I haven't had time yet to re-do my patches, but I'll try
> and get to that today.

Can you pull in the 3 from Philip or do you want me to send a new request?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNlMYXMkyGM64RGpERAnWoAJ4pvPPRt4Za1xgRHch0XRAosDIlRwCdGWsS
65yoUsOlZNROzCl8IopOI9g=
=AvtY
-----END PGP SIGNATURE-----



