Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E451660169
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 23:59:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9SNx7si006488
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 16:59:07 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 28 Oct 2014 16:59:06 -0700
Message-ID: <54502DD0.20004@windriver.com>
Date: Wed, 29 Oct 2014 07:59:12 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1414423721-6353-1-git-send-email-kai.kang@windriver.com>
	<CAP9ODKpZjSyvjwBuqVbvoweJ0vMbcA-3+rSd4vYpo3J8YVXPNg@mail.gmail.com>
In-Reply-To: <CAP9ODKpZjSyvjwBuqVbvoweJ0vMbcA-3+rSd4vYpo3J8YVXPNg@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Yue.Tao@windriver.com
Subject: Re: [PATCH 0/8] Some CVE fixes of postgresql and libyaml
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
X-List-Received-Date: Tue, 28 Oct 2014 23:59:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年10月28日 19:12, Otavio Salvador wrote:
> On Mon, Oct 27, 2014 at 1:28 PM, Kai Kang <kai.kang@windriver.com> wrote:
>> Kai Kang (8):
>>    Security Advisory - postgresql - CVE-2014-0064
>>    Security Advisory - postgresql - CVE-2014-0060
>>    Security Advisory - postgresql - CVE-2014-0061
>>    Security Advisory - postgresql - CVE-2014-0062
>>    Security Advisory - postgresql - CVE-2014-0063
>>    Security Advisory - postgresql - CVE-2014-0067
>>    Security Advisory - postgresql - CVE-2014-0065 and CVE-2014-0066
>>    Security Advisory - libyaml - CVE-2014-2525
> The commit log ought to be:
>
> postgresql: Add fix for CVE-2014-00xx Security Advisory
>
> to follow our commit guidelines.
>

Thanks. V2 will be sent.

-- 
Regards,
Neil | Kai Kang


