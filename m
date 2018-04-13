Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57A9D7198A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:08:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3D98Tmi013593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Apr 2018 02:08:30 -0700
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 02:08:29 -0700
To: Koen Kooi <koen@dominion.thruhere.net>,
	<openembedded-devel@lists.openembedded.org>
References: <CALbNGRT5ZWGZ=YCaSgpmryCzQFPKxDFYLCbOgSP3T1L9gJ0L3g@mail.gmail.com>
	<1523588270-121531-1-git-send-email-hongxu.jia@windriver.com>
	<papp8c$n9j$1@blaine.gmane.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <f6d6ee40-e3f2-d105-738b-2369bb26323a@windriver.com>
Date: Fri, 13 Apr 2018 17:08:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <papp8c$n9j$1@blaine.gmane.org>
Subject: Re: [PATCH V2][meta-gnome] metacity: add back and change upstream
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2018 09:08:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年04月13日 16:22, Koen Kooi wrote:
> Op 13-04-18 om 04:57 schreef Hongxu Jia:
>
>> +
>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
>> +PR = "r1"
> Please drop the PR=r1 line, since the recipe gets readded there shouldn't be an issue for package feeds.
>

I do not drop it on purpose, if the oe developer do not

update the repo frequently, the missing RP caused confusing?


//Hongxu





