Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0273972606
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 13:51:42 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Y7P7A-000348-61 for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jan 2015 14:51:36 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 14:51:36 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 14:51:36 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 03 Jan 2015 14:51:23 +0100
Message-ID: <m88s4r$9dv$1@ger.gmane.org>
References: <1419965292-10709-1-git-send-email-ben.shelton@ni.com>	<1419965292-10709-2-git-send-email-ben.shelton@ni.com>
	<217FC2A1-7DF3-4FAD-8F0D-500FCDB83B35@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
In-Reply-To: <217FC2A1-7DF3-4FAD-8F0D-500FCDB83B35@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] iperf3: Adds git and 3.0.8 version
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
X-List-Received-Date: Sat, 03 Jan 2015 13:51:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef op 01-01-15 om 04:11:
> 
>> On Dec 30, 2014, at 10:48 AM, Ben Shelton <ben.shelton@ni.com> wrote:
>> 
>> +PV = "3.0.8+git${SRCPV}" +SRCREV = "${AUTOREV}"
> 
> bad idea to use AUTOREV unless this is DP = -1 recipe otherwise its
> preferred to have a locked rev for less craziness.

Even with DP=-1 it should never go into meta-oe

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUp/PbMkyGM64RGpERAi2AAJ944GS/DS0pL47Y4jh3uAmcHmXwcgCeJuvn
ky9rfEmKwoZj57gSSpDXBA8=
=R+yQ
-----END PGP SIGNATURE-----


