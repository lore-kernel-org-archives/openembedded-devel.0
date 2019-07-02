Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC457E73D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:23:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x621Nmw2010170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:23:48 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:23:47 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <fc78dc28-bc7c-2433-871f-3eb5047a0ee8@windriver.com>
	<20190628125845.GA5313@localhost>
	<d889a55b-ae41-dd51-c37f-a8114b234753@windriver.com>
	<20190701124825.GA7483@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d51ee662-ff44-cf1b-a6a9-116ee4f29599@windriver.com>
Date: Tue, 2 Jul 2019 09:23:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701124825.GA7483@localhost>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: RFC: Add DISTRO_FEATURES(xfce) to control meta-xfce
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
X-List-Received-Date: Tue, 02 Jul 2019 01:23:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 7/1/19 8:48 PM, Adrian Bunk wrote:
> I just sent
>    blueman: Enable thunar support by default but don't rdepend on it
> that should also fix this problem.

Thanks, it is exactly what we expect, then we do not need to do extra 
configure for xfce

//Hongxu


