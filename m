Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdB5H-0001Kd-Qi
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 01:30:36 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PdB4k-0001wy-Kp from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 16:30:02 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 12 Jan 2011 16:30:02 -0800
Received: from [172.30.80.227] ([172.30.80.227]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 12 Jan 2011 17:30:00 -0700
Message-ID: <4D2E4782.3080008@mentor.com>
Date: Wed, 12 Jan 2011 17:29:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
	<4D2E1209.1090805@gmail.com>
In-Reply-To: <4D2E1209.1090805@gmail.com>
X-OriginalArrivalTime: 13 Jan 2011 00:30:00.0251 (UTC)
	FILETIME=[033240B0:01CBB2B9]
Subject: Re: [PATCH 0/3] autotools.bbclass misc trivia
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jan 2011 00:30:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2011 01:41 PM, Khem Raj wrote:
> On 1/12/2011 12:15 PM, Bernhard Reutner-Fischer wrote:
>> Hi,
>>
>> In an isolated test with dash and busybox ash the AC_CONFIG_MACRO_DIR
>> patch works as expected. Testers welcome.
>>
>> Bernhard Reutner-Fischer (3):
>> autotools.bbclass: pass distro_imposed_configure_flags
>> autotools.bblass: mkdir also AC_CONFIG_MACRO_DIR
>> autotools.bbclass: use grep -q
>>
>> classes/autotools.bbclass | 29 ++++++++++++++++++++++++-----
>> 1 files changed, 24 insertions(+), 5 deletions(-)
>>
> Whole series
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


