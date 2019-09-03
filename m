Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52F4F7F316
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:11:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x839BdwO017156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 02:11:39 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 3 Sep 2019 02:11:39 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190903064603.17637-1-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e20e23a0-5e44-be43-94c0-6ced5ca678b7@windriver.com>
Date: Tue, 3 Sep 2019 17:10:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903064603.17637-1-schnitzeltony@gmail.com>
Subject: Re: [meta-xfce][PATCH V2 0/3] meta-xfce upgrades
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
X-List-Received-Date: Tue, 03 Sep 2019 09:11:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/9/3 下午2:46, Andreas Müller wrote:
> V1 -> V2: imsettings dbus-glib from deps
>
> Andreas Müller (3):
>    imsettings: upgrade 1.7.3 -> 1.8.1 and rework recipe
>    xfce4-settings: upgrade 4.14.0 -> 4.14.1
>    xfce4-screenshooter: upgrade 1.9.5 -> 1.9.6
>
>   ..._1.9.5.bb => xfce4-screenshooter_1.9.6.bb} |  6 ++---
>   ...msettings_1.7.3.bb => imsettings_1.8.1.bb} | 22 ++++++++++---------
>   ...ngs_4.14.0.bb => xfce4-settings_4.14.1.bb} |  4 ++--
>   3 files changed, 17 insertions(+), 15 deletions(-)
>   rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.5.bb => xfce4-screenshooter_1.9.6.bb} (76%)
>   rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.3.bb => imsettings_1.8.1.bb} (64%)
>   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.0.bb => xfce4-settings_4.14.1.bb} (89%)
>
Fine with me.

Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,

-- 
Kai Kang


