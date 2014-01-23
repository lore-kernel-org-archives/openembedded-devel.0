Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E964C6B05F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 10:00:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W6H4u-0001lV-9R for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jan 2014 11:00:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:00:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:00:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 23 Jan 2014 10:57:28 +0100
Message-ID: <lbqp0j$b55$2@ger.gmane.org>
References: <1390332748-31444-1-git-send-email-koen@dominion.thruhere.net>	<CAJTo0LZOjUDhRCN7QPHwPckvDxzbvOWwEb3iT7ZRdnWwD3zZew@mail.gmail.com>
	<CAP9ODKr+d8tG=XUsAR=btn3=vfetvQusu=oid-bCkPGonmGXsw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <CAP9ODKr+d8tG=XUsAR=btn3=vfetvQusu=oid-bCkPGonmGXsw@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] xf86-video-ati: recommend linux-firmware
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2014 10:00:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio Salvador schreef op 22-01-14 15:36:
> On Tue, Jan 21, 2014 at 6:21 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>> On 21 January 2014 19:32, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>> Technically it won't work without, but it's possible to build the
>>> firmware into the kernel, so use RRECOMMENDS.
>> 
>> A blanket recommendation like that seems like you should be splitting 
>> the relevant firmware into a separate package first.
> 
> Agreed; this helps to reduce the footprint increase from this change.

http://patches.openembedded.org/patch/65573/

I'll send an updated patch for xf86-video-ati after the above lands in oe-core.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS4OeIMkyGM64RGpERApRhAJ4lMjwhZUchxfoBVAZEho0g9H0oTgCfRude
EGTQJzxZft0XY4k+6tnadew=
=mbHG
-----END PGP SIGNATURE-----


