Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05A07606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:21:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H8LJro000223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 01:21:19 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 01:21:18 -0700
Message-ID: <55D1997D.2040809@windriver.com>
Date: Mon, 17 Aug 2015 16:21:17 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1439544527-6806-1-git-send-email-rongqing.li@windriver.com>
	<mqlbb1$css$1@ger.gmane.org>
In-Reply-To: <mqlbb1$css$1@ger.gmane.org>
Subject: Re: [PATCH][meta-oe] collectd: upgrade to 5.5.0
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
X-List-Received-Date: Mon, 17 Aug 2015 08:21:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月15日 02:17, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 14-08-15 om 11:28 schreef rongqing.li@windriver.com:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> 1. remove two patch glibc-2.20-compatiblity.patch and
>> 0001-netlink-ensure-size_t-portability-in-DEBUG-statement.patch, which
>> have been merged into 2. update collectd-version.patch 3. redefine the
>> collectd dependence 4. update the checksum
>
> Could you also add a PACKAGECONFIG for libatasmart? Collectd finally stopped
> using hddtemp and switched to libatasmart for 5.5.x.


OK, I will

-Roy

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFVzjChMkyGM64RGpERApehAJ9T5j14amJRLb4UXs4RdmmQsnAkiACgllzN
> 4RlxlVEPpYNKEgEcOrddAjE=
> =ayit
> -----END PGP SIGNATURE-----
>

-- 
Best Reagrds,
Roy | RongQing Li

