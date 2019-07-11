Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9BB17EC44
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:51:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6B7oifa022297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2019 00:50:54 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Jul 2019 00:50:33 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
	<CALbNGRRWQW24kwTwjoB=0w3MkAMa-GCKgpP5jUsYhnzsD4ajtA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <2e8537cd-be5e-5e5a-31c6-490809fb00e2@windriver.com>
Date: Thu, 11 Jul 2019 15:50:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRRWQW24kwTwjoB=0w3MkAMa-GCKgpP5jUsYhnzsD4ajtA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch 00/11] Upgrade to xfce 4.14 pre2
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
X-List-Received-Date: Thu, 11 Jul 2019 07:51:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/2 下午3:47, Andreas Müller wrote:
> On Tue, Jul 2, 2019 at 3:29 AM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade core packages of xfce to 4.14pre2
>>
>> Kai Kang (11):
>>    thunar: 1.8.6 -> 1.8.7
>>    exo: 0.12.5 -> 0.12.6
>>    garcon: 0.6.2 -> 0.6.3
>>    thunar-volman: 0.9.2 -> 0.9.3
>>    xfce4-dev-tools: 4.12.0 -> 4.13.0
>>    xfce4-panel: 4.13.5 -> 4.13.6
>>    xfce4-power-manager: 1.6.2 -> 1.6.3
>>    xfce4-session: 4.13.2 -> 4.13.3
>>    xfdesktop: 4.13.4 -> 4.13.5
>>    xfwm4: 4.13.2 -> 4.13.3
>>    xfconf: 4.13.7 -> 4.13.8
> First of all thanks for taking care. One suggestion/wish: Could you
> please update xfce4-settings to latest upstream and move away from my
> fork?
>
> Background: The fork I created added two functionalities:
> * Optionally hide mouse pointer for certain pointer devices. This
> stopped working anyway (and was problematic for Qt application from
> the beginning)
> * Datetime-setter: I created a new project for that based on GTK3 [1].
> It is not quite finished but I use it frequently and am happy to have
> it (e.g on machines without RTC backup and missing network). So if
> somebody wants this either it could be added later.
>
> Unfortunately I have no time to do this myself.

Hi Khem,

Upgrade xfce4-settings doesn't bock this series update. Would you like 
to merge them? Thanks.


Kai


>
> Thanks
>
> Andreas
>

-- 
Kai Kang


