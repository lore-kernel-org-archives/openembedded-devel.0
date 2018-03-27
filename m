Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A05177BEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2R7lBno002425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 00:47:12 -0700 (PDT)
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 27 Mar 2018 00:47:11 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1522121018-192702-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRRWpiVmjMLDsTht1UcjHMOBfQ78PdUNmQ6AV5=b8sKR+w@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <dddf0e4a-53a3-f10c-a325-47bf1f945e10@windriver.com>
Date: Tue, 27 Mar 2018 15:47:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRWpiVmjMLDsTht1UcjHMOBfQ78PdUNmQ6AV5=b8sKR+w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] libgnome-keyring: fix dependency of glib-gettextize
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
X-List-Received-Date: Tue, 27 Mar 2018 07:47:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年03月27日 14:50, Andreas Müller wrote:
> On Tue, Mar 27, 2018 at 5:23 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> libgnome-keyring uses glib-gettextize so explicitly depend on
>> glib-2.0-native.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Thanks but I think it's obsolete - see [1]
>
> [1] https://patchwork.openembedded.org/patch/149554/
>
> Andreas


OK, thanks to upgrade it


//Hongxu


