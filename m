Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 79A8B6B05F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 09:55:33 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W6H0W-00080y-GW for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jan 2014 10:55:32 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 10:55:32 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 10:55:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 23 Jan 2014 10:56:03 +0100
Message-ID: <lbqotu$b55$1@ger.gmane.org>
References: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>	<1688777.CYGoEHJ1ll@leo>	<CAP9ODKrEm_WCLnx2quebWu8rrpnGbvjXKp9Vn5_8c_J1unhMwg@mail.gmail.com>	<CAMKF1sru7FBY7o5guup7zvHD6BxJzkvav+DRqSzoe9t+KTnyJA@mail.gmail.com>
	<CAP9ODKpY8vTBn1uvs6umJsnfvf85hYHSF_UFG1KcR_p=ahXFqg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <CAP9ODKpY8vTBn1uvs6umJsnfvf85hYHSF_UFG1KcR_p=ahXFqg@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-initramfs][PATCHv2] dracut: add git version
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
X-List-Received-Date: Thu, 23 Jan 2014 09:55:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio Salvador schreef op 22-01-14 18:26:
> On Wed, Jan 22, 2014 at 3:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Jan 22, 2014 at 6:35 AM, Otavio Salvador 
>> <otavio@ossystems.com.br> wrote:
>>> I am not sure this is 'core'; maybe 'recipes-support'?
>> 
>> 
>> well we are in initramfs layer and dracut could be a core recipe for 
>> initramfs layer
> 
> Ok; agreed.

I'll send a new patch for that soon.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS4OczMkyGM64RGpERApRoAKC5MEwEuI3vdh7FN17Y2qi48vD9AQCgkYPK
u3CEw87X2dR2NJw6us9bhoQ=
=QQ2J
-----END PGP SIGNATURE-----


