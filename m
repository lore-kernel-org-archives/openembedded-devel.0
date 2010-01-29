Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NatSi-0002i7-7p for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 17:12:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NatQ6-0007Tb-47 for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 17:10:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 17:10:06 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 17:10:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 29 Jan 2010 17:05:49 +0100
Message-ID: <hjv10s$rvb$2@ger.gmane.org>
References: <E1Naol0-0001BB-G8@melo.openembedded.org>
	<94415AF6-0778-4FAA-8EBD-D61FB655B9F3@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <94415AF6-0778-4FAA-8EBD-D61FB655B9F3@vanille-media.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : mplayer svn: make SRCREV go backwards to fix audio and dvd playback
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
X-List-Received-Date: Fri, 29 Jan 2010 16:12:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-01-10 16:44, Dr. Michael Lauer wrote:
> 
> Am 29.01.2010 um 12:11 schrieb git version control:
> 
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: a9e2573fd6764685720bc5532370bad2c039d9be
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=a9e2573fd6764685720bc5532370bad2c039d9be
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Fri Jan 29 11:53:32 2010 +0100
>>
>> mplayer svn: make SRCREV go backwards to fix audio and dvd playback
>>
>> * bisecting to the offending commits is nigh impossible since mplayer doesn't compile for about 70% of the affected revision range :(
> 
> What about bumping PE?

That would involve bumping PE for all other mplayer recipes as well,
which I think is a bit too much
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLYwddMkyGM64RGpERAjVDAKCVdln4Mt4zszZowQgiZHg1qyoZ2gCff0/D
qlNV58tC7nMj9psd140nCF0=
=iYuj
-----END PGP SIGNATURE-----



