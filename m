Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F34EF745BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:04:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3D94D3U028089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Apr 2018 02:04:13 -0700 (PDT)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 02:04:12 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
	<20180330133151.25882-22-schnitzeltony@gmail.com>
	<720f4b6d-e60e-9085-23ef-ef8edbcb0e80@windriver.com>
	<CALbNGRSx3K9pR7ANg8MfwE5ZnkxpSgAGJ_x7+yNGqS85m8fweg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <c678b0ae-f1fe-59bb-89ad-8677ba300bce@windriver.com>
Date: Fri, 13 Apr 2018 17:04:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSx3K9pR7ANg8MfwE5ZnkxpSgAGJ_x7+yNGqS85m8fweg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 21/39] metacity: remove
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
X-List-Received-Date: Fri, 13 Apr 2018 09:04:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年04月13日 14:41, Andreas Müller wrote:
> On Fri, Apr 13, 2018 at 4:53 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 2018年03月30日 21:31, Andreas Müller wrote:
>>> * as far as I can see nothing uses it - please stand up if I am wrong
>>
>> On github, it is still alive and maintained
>>
>> https://github.com/GNOME/metacity/blob/master/NEWS
>>
>> I think we should keep it.
>>
>> The 2.*.* is based on gtk2, and the latest version
>> 3.28.0 is based on gtk3.
>>
>> V2 which change the upstream incoming
>>
>> //Hongxu
>>
> Ok - let's re-add it. Are there dependencies requiring revival too?

My test build is successfully, no other depends is require.

//Hongxu

> Andreas



