Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 697127F962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 09:37:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBD9b07q021616
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 13 Dec 2019 01:37:00 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 13 Dec 2019 01:37:00 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, Changqing Li
	<changqing.li@windriver.com>
References: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
	<CALbNGRTaVVnL6qPcnSqV6w+_o-ad3=GT3D=cWOLGGDUsuYJ0Rw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <4959ba0d-54ff-eff0-4a24-b516e86aad9c@windriver.com>
Date: Fri, 13 Dec 2019 17:36:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CALbNGRTaVVnL6qPcnSqV6w+_o-ad3=GT3D=cWOLGGDUsuYJ0Rw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] gtk-xfce-engine: remove this recipe
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
X-List-Received-Date: Fri, 13 Dec 2019 09:37:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/12/13 下午5:27, Andreas Müller wrote:
> On Fri, Dec 13, 2019 at 9:45 AM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * Part of xfce 4.14 changelog
>>    Theme Engine (gtk-xfce-engine)
>>        The gtk-xfce-engine has been deprecated and archived.
>>
>> * repo have been remove from upstream
>>    https://archive.xfce.org/src/xfce/
>>    no gtk-xfce-engine now
>>
>> so remove this recipe
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Think this is a good thing and wanted to test it. Unfortunately it did
> not make it into patchwork - similar as Kai's patches sent recently.
> Who can look into patchwork?

I once thought it because I used 'Patch' rather than 'PATCH' in subject. 
And it did in patchwork today with that change.
But I don't know why Changqing's patch doesn't in patchwork either.

Regards,
Kai


>
>
> Andreas


-- 
Kai Kang


