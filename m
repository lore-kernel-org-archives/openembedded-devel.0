Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 413A07CD66
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 08:10:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2889VJj011364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2019 00:09:46 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 8 Mar 2019 00:09:32 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20190308013237.194105-1-kai.kang@windriver.com>
	<20190308013237.194105-4-kai.kang@windriver.com>
	<CALbNGRSzvkdwr24cvwrp1MW29JeduDKqza2epCaqJGQqXXUD-g@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <a0071efe-cb11-7398-c49c-2b35e302e4bd@windriver.com>
Date: Fri, 8 Mar 2019 16:08:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRSzvkdwr24cvwrp1MW29JeduDKqza2epCaqJGQqXXUD-g@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH 3/5] gvfs: 1.39.1 -> 1.39.92
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
X-List-Received-Date: Fri, 08 Mar 2019 08:10:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/3/8 下午3:57, Andreas Müller wrote:
> On Fri, Mar 8, 2019 at 2:33 AM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> I have overlooked your last update: Please don't update to unstable
> gnome releases (odd version numbers) in the future. As far as I can
> remember there were similar comments in oe-core already.
>
> Andreas
>
Hi Andreas,

I searched for gnome version policy and got

https://developer.gnome.org/programming-guidelines/stable/versioning.html.en

Most GNOME modules follow a convention for stable and unstable releases. 
The minor version is even for stable releases and is odd for unstable 
releases. For example, the 3.20.* versions are stable, but the 3.19.* 
versions are unstable. The 3.19.* versions can be seen as alpha and beta 
releases of the 3.20 version.

Thanks for reminder.

-- 
Kai Kang


