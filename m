Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE537FE30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 02:44:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBH2iYtI006144
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 16 Dec 2019 18:44:35 -0800 (PST)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 16 Dec 2019 18:44:34 -0800
To: Kang Kai <Kai.Kang@windriver.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
	<schnitzeltony@gmail.com>,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
References: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
	<CALbNGRTaVVnL6qPcnSqV6w+_o-ad3=GT3D=cWOLGGDUsuYJ0Rw@mail.gmail.com>
	<4959ba0d-54ff-eff0-4a24-b516e86aad9c@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <524c1c2a-1475-df8d-5be1-05e9d3359d21@windriver.com>
Date: Tue, 17 Dec 2019 10:44:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4959ba0d-54ff-eff0-4a24-b516e86aad9c@windriver.com>
X-Originating-IP: [128.224.162.189]
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
X-List-Received-Date: Tue, 17 Dec 2019 02:44:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12/13/19 5:36 PM, Kang Kai wrote:
> On 2019/12/13 下午5:27, Andreas Müller wrote:
>> On Fri, Dec 13, 2019 at 9:45 AM <changqing.li@windriver.com> wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> * Part of xfce 4.14 changelog
>>>    Theme Engine (gtk-xfce-engine)
>>>        The gtk-xfce-engine has been deprecated and archived.
>>>
>>> * repo have been remove from upstream
>>>    https://archive.xfce.org/src/xfce/
>>>    no gtk-xfce-engine now
>>>
>>> so remove this recipe
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> Think this is a good thing and wanted to test it. Unfortunately it did
>> not make it into patchwork - similar as Kai's patches sent recently.
>> Who can look into patchwork?
>
> I once thought it because I used 'Patch' rather than 'PATCH' in 
> subject. And it did in patchwork today with that change.
> But I don't know why Changqing's patch doesn't in patchwork either.
>
> Regards,
> Kai
>
I guess maybe the maintainer of patchwork can receive mail (title as 
"[Django] ERROR: Error when parsing incoming email")

about why the patch is not accepted by patchwork.  Maybe caused by 
reason like codec problem or other reason.

Maybe Michael can receive the mail,  so add him.

>
>>
>>
>> Andreas
>
>

