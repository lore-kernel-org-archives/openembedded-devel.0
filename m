Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QSDFc-0008D4-5Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 21:08:12 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QSDCW-0003Jy-QW from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 12:05:00 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 2 Jun 2011 12:01:21 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 2 Jun 2011 12:05:00 -0700
Message-ID: <4DE7DED8.3000209@mentor.com>
Date: Thu, 2 Jun 2011 12:04:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <BANLkTik9khWBXixj=_LDj5pGdi=PO=0WbA@mail.gmail.com>
In-Reply-To: <BANLkTik9khWBXixj=_LDj5pGdi=PO=0WbA@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Jun 2011 19:01:21.0829 (UTC)
	FILETIME=[76589550:01CC2157]
Subject: Re: [PATCH] perl-native multilib patch for ubuntu 11.04
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
X-List-Received-Date: Thu, 02 Jun 2011 19:08:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/01/2011 10:51 AM, George C. Huntington, III wrote:
> When I try to build perl-native under ubuntu 11.04 x86_64 from
> 2011.03-maintenance branch
> it fails unless I cherry-pick
> commit 86fde1fe0281cc8c9d2bf1012d8eff5e24a69e55  can we put this in
> the 2011.03-maintenance branch?
> 
> cherry-pick: 86fde1fe0281cc8c9d2bf1012d8eff5e24a69e55
> Tested-by: george huntington <george.huntingtoniii@gmail.com>

I've applied this.  Or rather, patchwork and pw-am.sh didn't agree this
would apply but I re-did the cherry-pick myself and added a note that
you did the testing and pushed it.  Thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN597UAAoJEI4NMjfc3nJxIZEIALmF7OIKlc5nfdWs+dBQkIDT
Ft9lybnSGegBYSMnsAhQzJ6PnP0L0T83Kiy9h+LBRLDm7WFnadnALlI3JfVpqpvc
n5offZe3cq8DMtt1Oky3BVy2RwkU5eGYq8NIkPVmOhYTIEphNk1ehrdFF8E75vqL
Lsc3PZ25StD1YzDHQxQS9QidegagYF71QeS8Yk80aPDYVBCiinT0KG7aVJeExIzo
asgMYG4k2JeLRVhMWgnyKVI8hZlQlGZQHCEk5DKCidG9l1jWkbspEh8wJfRZWzVP
DW/M3VPII1Bb5PgtnR0C4H5XxlvaxJ0Id7M6BP+oTH7Ssd6NT3ycylVugwHdFCI=
=GrZ2
-----END PGP SIGNATURE-----


