Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF4DA72DD3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 09:30:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S9UMQW027987
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Jan 2015 01:30:22 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 28 Jan 2015 01:30:22 -0800
Message-ID: <54C8AC2B.4050407@windriver.com>
Date: Wed, 28 Jan 2015 17:30:19 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1422415423-19807-1-git-send-email-Chong.Lu@windriver.com>
	<5351926.a74nUugD2W@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <5351926.a74nUugD2W@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-oe][PATCH] samba: disable service by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Jan 2015 09:30:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/28/2015 04:59 PM, Paul Eggleton wrote:
> Hi Chong,
>
> On Wednesday 28 January 2015 11:23:43 Chong Lu wrote:
>> Disable smb, nmb, winbind service by default.
> The commit message says what you are doing, but doesn't explain the reason -
> why do you want to do this?
>
> Cheers,
> Paul
>

Hi Paul,

The config file need configure by user, else I think there is no meaning 
for enable samba by default.

Best Regards
Chong


