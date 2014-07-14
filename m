Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF4370254
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:06:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E96idC022898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 02:06:44 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 14 Jul 2014 02:06:43 -0700
Message-ID: <53C39DA2.4090603@windriver.com>
Date: Mon, 14 Jul 2014 17:06:42 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>
References: <1405318339-20529-1-git-send-email-rongqing.li@windriver.com>
	<53C394BF.3050708@windriver.com>
In-Reply-To: <53C394BF.3050708@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-perl] libxml-libxml-perl: add recipe
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
X-List-Received-Date: Mon, 14 Jul 2014 09:06:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/14/2014 04:28 PM, Hongxu Jia wrote:
> On 07/14/2014 02:12 PM, rongqing.li@windriver.com wrote:
>> +++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
>
> s/libxml-libxml-perl/libxml-perl/
>
> How about rename the recipe with "libxml-perl" ?
>
> //Hongxu
>

there is a libxml-perl under oe-core

/oe-core/meta/recipes-devtools/perl/libxml-perl_0.08.bb

>

-- 
Best Reagrds,
Roy | RongQing Li

