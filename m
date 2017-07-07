Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B31872F2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 00:44:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v670iuFn021616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Jul 2017 17:44:56 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:44:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
	<CAJTo0LZrjeVU+Dz6qZBX-6VGdXVP3yxhXoEj=W1wrswCXBYzMA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e70b1f31-ce4f-52d0-27da-70c4d96bafc2@windriver.com>
Date: Fri, 7 Jul 2017 08:48:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZrjeVU+Dz6qZBX-6VGdXVP3yxhXoEj=W1wrswCXBYzMA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Fix compile errors if distro feature openssl-no-weak-ciphers exists
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
X-List-Received-Date: Fri, 07 Jul 2017 00:44:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年07月06日 23:30, Burton, Ross wrote:
>
> On 5 July 2017 at 09:11, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     Patches to add distro feature openssl-no-weak-ciphers have been
>     sent to oe-core.
>
>
> FWIW I'm still not very keen on a distro feature for this.

How about use a global variable rather than a distro feature and check 
whether it has been set?

Thanks,
Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


