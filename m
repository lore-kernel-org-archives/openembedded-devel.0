Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 114BC62176
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:07:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7F27SKv003558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2013 22:07:28 -0400 (EDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 14 Aug 2013 19:07:28 -0700
Message-ID: <520C37DD.4050907@windriver.com>
Date: Thu, 15 Aug 2013 10:07:25 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1376294039.git.hongxu.jia@windriver.com>
	<20130814115226.GV17945@jama>
In-Reply-To: <20130814115226.GV17945@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH V2 0/3] add perl database library to create meta-perl layer
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
X-List-Received-Date: Thu, 15 Aug 2013 02:07:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2013 07:52 PM, Martin Jansa wrote:
> On Mon, Aug 12, 2013 at 04:00:18PM +0800, Hongxu Jia wrote:
>> Change in V2: Use 'meta-perl' instead of 'meta-cpan' to name the layer
> All patches are misssing 'meta-perl/' prefix so I had to apply them
> manually.
>
> Now they are in jansa/in-test so you don't need to resend them.
Sorry for the missing, I will update the branch and not resend the pull 
request again.
git://git.pokylinux.org/poky-contrib hongxu/meta-perl

Thanks,
Hongxu
>> The following changes are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib hongxu/meta-perl
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hongxu/meta-perl
>>
>> Hongxu Jia (3):
>>    meta-perl creation
>>    libdbi-perl: add version 1.628
>>    libdbd-sqlite-perl: add version 1.40
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


