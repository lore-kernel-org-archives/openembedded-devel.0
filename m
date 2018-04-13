Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B294F6AC00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:25:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3D9Pp0b013866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Apr 2018 02:25:51 -0700
Received: from [128.224.163.159] (128.224.163.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 02:25:50 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1523609863-13079-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRRf+Dx67AvU-YO_6g2bre94pXtrMJOWqMiqU391TBwrkw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <baabb5b1-be95-d8f4-2683-3c83fd0debb5@windriver.com>
Date: Fri, 13 Apr 2018 17:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRf+Dx67AvU-YO_6g2bre94pXtrMJOWqMiqU391TBwrkw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] networkmanager: enable gobject introspection
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
X-List-Received-Date: Fri, 13 Apr 2018 09:25:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年04月13日 17:18, Andreas Müller wrote:
> On Fri, Apr 13, 2018 at 10:57 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> While networkmanager upgraded to 1.10.6, it disable
>> gi which caused network-manager-applet build faulure
>> ...
>> Couldn't find include 'NM-1.0.gir'
>> ...
> AFAIK it should be in autobuilder queue already [1]
>
> [1] https://patchwork.openembedded.org/patch/150027/

Yes, thanks for pointing it out

//Hongxu

>
> Andreas



