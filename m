Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhIMx-00053c-I1 for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 10:05:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhIMC-0000Rz-Q1 for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 10:05:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 10:05:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 10:05:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 24 Jan 2011 10:03:33 +0100
Message-ID: <ihjf95$c5u$2@dough.gmane.org>
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>	<4D394AC0.90300@eukrea.com>	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>	<4D3A31FF.2010907@mwester.net>
	<AANLkTin=77JheFmKVs2Z7wKH6kWD+uKgHSDVRQ__cwF7@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTin=77JheFmKVs2Z7wKH6kWD+uKgHSDVRQ__cwF7@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Mon, 24 Jan 2011 09:05:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-01-11 19:27, Khem Raj wrote:
> On Fri, Jan 21, 2011 at 5:25 PM, Mike Westerhof <mike@mwester.net> wrote:
>> Isn't this kernel-specific, though?  I don't have any other OE-based
>> devices handy just now to check, but what's difference, specifically,
>> and should we change something to bring SlugOS into line with the rest
>> of the world?
>>
>> -Mike (mwester)
>>
> 
> yes seems like slugos kernel enables.
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
> 
> which enabled these.

Good luck using udev >125 with those enabled.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPUBlMkyGM64RGpERAtQ9AJ9uXJt3LkVLmFcdGtlzyXrkcS9GogCgsZd2
so8m83VyDJYV0ZRGbpxNrJA=
=DOKc
-----END PGP SIGNATURE-----



