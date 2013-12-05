Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD0036DF77
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 02:06:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB526iEi007691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Dec 2013 18:06:44 -0800 (PST)
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 4 Dec 2013 18:06:44 -0800
Message-ID: <529FDFB2.4000409@windriver.com>
Date: Thu, 5 Dec 2013 10:06:42 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Joe MacDonald <joe@deserted.net>, <koen@dominion.thruhere.net>
References: <1386153235-16411-1-git-send-email-jackie.huang@windriver.com>
	<l7n0m9$4go$1@ger.gmane.org> <20131204134937.GA5677@deserted.net>
In-Reply-To: <20131204134937.GA5677@deserted.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error
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
X-List-Received-Date: Thu, 05 Dec 2013 02:06:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/4/2013 9:49 PM, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error] On 13.12.04 (Wed 11:39) Koen Kooi wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> jackie.huang@windriver.com schreef op 04-12-13 11:33:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> Correct the usage of alternative link and target:
>>
>> Make the above the summary, 'fix simple bb rule error' is too vague when
>> looking through the output of 'git log --oneline'
>
> Agreed.  If there's no objection, I'll change this to:

No objection, thanks!

Thanks,
Jackie

>
> inetutils: use new update-alternatives syntax
>
> Though that does tend to render the rest of the commit log redundant.
> :-)
>
> -J.
>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>
>> iD8DBQFSnwZqMkyGM64RGpERAvn8AJwJgmIczTwCWNuTe6TdkiGUyl+kKgCdHrcA
>> ub+FZU7aXb7K84C447kCCqk=
>> =6wkg
>> -----END PGP SIGNATURE-----
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

