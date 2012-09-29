Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1THmZr-0005jk-6K
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 04:14:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8T21pxs010322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2012 19:01:51 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 28 Sep 2012 19:01:51 -0700
Message-ID: <5066568D.5090801@windriver.com>
Date: Sat, 29 Sep 2012 10:01:49 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1348802495-13651-1-git-send-email-jackie.huang@windriver.com>
	<k45351$rm0$1@ger.gmane.org>
In-Reply-To: <k45351$rm0$1@ger.gmane.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 1/2] ptpd: migrate from meta-oe into meta-networking
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
X-List-Received-Date: Sat, 29 Sep 2012 02:14:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/2012 5:00 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 28-09-12 05:21, jackie.huang@windriver.com schreef:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com> ---
>> .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26
>> ++++++++++++++++++++ meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |
>> 20 +++++++++++++++ .../ptpd/ptpd-1.0.0/add-limit-h.patch              |
>> 26 -------------------- meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
>> |   20 ---------------
>
> Can you resend that with -m?

Resent, thanks!

Thanks,
Jackie

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQZg/jMkyGM64RGpERAmQGAJ9FvNdtkcgp25H/NSAQn0jUH3adAgCeIdTv
> OYcMi5OfStUutSiA4pTuEG8=
> =TXyy
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


