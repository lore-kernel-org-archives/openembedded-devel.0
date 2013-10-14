Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 678A16CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 12:48:48 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VVhZp-0000af-BK for openembedded-devel@lists.openembedded.org;
	Mon, 14 Oct 2013 14:48:49 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:48:49 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:48:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Oct 2013 14:48:36 +0200
Message-ID: <l3gp6o$uq8$1@ger.gmane.org>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
	<1596233.ZQ7J3xl2Nd@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1596233.ZQ7J3xl2Nd@helios>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCH 1/6] libraw1394: add recipe
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
X-List-Received-Date: Mon, 14 Oct 2013 12:48:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-10-13 13:10, Paul Eggleton schreef:
> On Sunday 13 October 2013 01:43:50 Khem Raj wrote:
>> From: Cliff Brake <cbrake@bec-systems.com>
>> 
>> Initial recipe created by Khem Raj
>> 
>> Signed-off-by: Cliff Brake <cbrake@bec-systems.com> Signed-off-by: Khem
>> Raj <raj.khem@gmail.com> --- 
>> meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11
>> +++++++++++
> 
> Could these multimedia recipes go into meta-multimedia instead of
> meta-oe?

FWIW, libraw1394 is the libusb for firewire, so it's not multimedia related,
the other recipes like coriander and mikmod are. I'm not sure I'd put opencv
in the multimedia category, though.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSW+gkMkyGM64RGpERAigBAJ9ZVwxmHdO0BWF0dS1Ujk/3Zc7s5QCfU5DG
9HXtdaLlOUKJIfNhw1HUNf0=
=YFga
-----END PGP SIGNATURE-----


