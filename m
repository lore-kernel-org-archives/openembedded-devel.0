Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 06CF26DD9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2013 08:40:47 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VqfLZ-0005mO-Dh for openembedded-devel@lists.openembedded.org;
	Wed, 11 Dec 2013 09:40:45 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:40:45 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:40:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 11 Dec 2013 09:40:36 +0100
Message-ID: <l898do$4h1$1@ger.gmane.org>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>	<14902072.IG3b8o4YqW@helios>	<l77732$ggi$1@ger.gmane.org>	<1825979.KGUos5WM3r@helios>	<l777t2$pcq$1@ger.gmane.org>	<CAGrhNMxYxbA-dL0iQFB_mD-s94nrKupCx-vJaijp=sPy5herwQ@mail.gmail.com>	<l86mmo$28c$1@ger.gmane.org>
	<52A74F65.3090202@felipetonello.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <52A74F65.3090202@felipetonello.com>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Wed, 11 Dec 2013 08:40:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Felipe Ferreri Tonello schreef op 10-12-13 18:29:
> Hi Koen,
> 
> On 12/10/2013 01:26 AM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Felipe Tonello schreef op 10-12-13 02:17:
>> 
>>> It does split into packages. I splited it up in packages just so if
>>> the user wants to have different backend options, it can.
>>> 
>>> The problem with this aproach, is that you will add the apt and opkg 
>>> dependency to the build even if the user doesn't care about it. I
>>> don't like this option to be honest.
>> 
>> It's only 2 small build time dependencies saving a lot of rebuilding
>> and runtime headaches.
> 
> So what's your suggestion for me to fix this patch?

Go with option 2)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSqCUEMkyGM64RGpERAppbAJ9UDWDc1ahBy8J5pneh3rYvZsborQCgoYoI
RU9Y/n8RZeflFP/tNjrr7QU=
=ro0O
-----END PGP SIGNATURE-----


