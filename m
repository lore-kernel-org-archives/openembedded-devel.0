Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFDC71BF0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 02:23:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAM2Np2n025165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Nov 2017 18:23:51 -0800 (PST)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 21 Nov 2017 18:23:50 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: akuster808 <akuster808@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
References: <bfbfad0b-af40-5448-4aed-fc70eeb95c6c@windriver.com>
	<7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
	<37b787d0-ef5a-d821-0c09-a8547c58c52d@gmail.com>
	<e9e12bfb-1b89-d9f1-619e-1896e83837cb@windriver.com>
Message-ID: <23178b55-e416-a67f-f90f-041f2ab21080@windriver.com>
Date: Wed, 22 Nov 2017 10:26:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <e9e12bfb-1b89-d9f1-619e-1896e83837cb@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: +lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Contribute meta-installer to yocto
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
X-List-Received-Date: Wed, 22 Nov 2017 02:23:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年11月22日 10:10, Hongxu Jia wrote:
> On 2017年11月22日 04:10, akuster808 wrote:
>>
>> Hello,
>>
>>>
>>> The repository of meta-installer is temporary on the github
>>> for review:
>>> https://github.com/jiahongxujia/meta-installer
>>>
>>> In above github, the logo picture is undefined, if yocto
>>> could accept this layer, I will update the picture with
>>> "Yocto project Compatible".
>>>
>>> The attachments are the snapshots of a package based
>>> installation.
>>>
>>> Hopefully it is helpful for yocto, and any feedback is
>>> appreciated.
>>
>> I believe it can go beyond helping Yocto and help the overall OE 
>> community.
>>
>> CC'ing oe mailings lists
>>
>>>
>>> If yocto is interested in this layer and will accept it,
>>> I could send pull request or some one directly fetch
>>> from above github master branch.
>> If Yocto isn't I am sure OE will be.
>>
>
> Hi Armin,
>
> I am very glad to submit this layer to OE, previously I have
> added/submitted 40+ recipes to OE for the preparation of
> meta-instaler public (just in case public failed and still most
> of them are available in OE)
>
> http://cgit.openembedded.org/meta-openembedded/log/?qt=grep&q=hongxu
>
> If OE could accept meta-installer, it is very convenience to maintain
> all of them in one place. (My 2018 1st half year TODO plan is to
> upgrade anaconda and its required recipes to sync with Fedora 27)
>
> Hi Martin, Khem, Armin and the OE maintainers concerned
>
> If it is OK, I will send pull request to OE for review, and
> my opinion is to suggest to create meta-installer sub layer in OE.
>

To clarify, I mean to create sub dir meta-installer in
git://git.openembedded.org/meta-openembedded

//Hongxu

> Do you have suggestions or ideas?
>
> //Hongxu
>
>> Thank you Wind River for contributing your hard work for the greater 
>> good of the community.
>>
>> kind regards,
>> Armin
>>>
>>> //Hongxu
>>>
>>>
>>
>


