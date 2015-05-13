Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A794660138
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 05:11:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4D5BHN5004930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 22:11:17 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 22:11:17 -0700
Message-ID: <5552DCF4.2000108@windriver.com>
Date: Wed, 13 May 2015 13:11:16 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1431491234-7155-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1431491234-7155-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH 1/1] apache2: upgrade to 2.4.12
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
X-List-Received-Date: Wed, 13 May 2015 05:11:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年05月13日 12:27, rongqing.li@windriver.com wrote:
> From: Roy Li<rongqing.li@windriver.com>
>
> upgrade to include CVE fixes.
> Remove apache-CVE-2014-0117.patch which apache2.4.12 has
> Update apache-ssl-ltmain-rpath.patch



Please drop this duplicate, I see it has been in maste-next

Thanks

-- 
Best Reagrds,
Roy | RongQing Li

