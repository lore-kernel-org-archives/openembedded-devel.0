Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pu4Cu-0004tK-9S
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 15:36:19 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pu4BT-0005t9-El from Tom_Rini@mentor.com ;
	Mon, 28 Feb 2011 06:34:47 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 28 Feb 2011 06:34:47 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Feb 2011 06:34:46 -0800
Message-ID: <4D6BB274.1070708@mentor.com>
Date: Mon, 28 Feb 2011 07:34:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Henning Heinold <heinold@inf.fu-berlin.de>
References: <4D6AE512.1070009@mentor.com>
	<20110228092308.GA28024@mi.fu-berlin.de>
In-Reply-To: <20110228092308.GA28024@mi.fu-berlin.de>
X-OriginalArrivalTime: 28 Feb 2011 14:34:47.0300 (UTC)
	FILETIME=[A608A440:01CBD754]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: openjdk-6 sources moved
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
X-List-Received-Date: Mon, 28 Feb 2011 14:36:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2011 02:23 AM, Henning Heinold wrote:
> On Sun, Feb 27, 2011 at 04:58:10PM -0700, Tom Rini wrote:
>> Hey all,
>>
>> I was looking into fixing the current open security issues for openjdk
>> and ran into the problem that as part of java.net re-org, the SRC_URIs
>> don't fetch anymore.  Real quick poking on my part didn't reveal where
>> to, so I've punted on fixing CVE-2010-4476, CVE-2010-4476, and
>> CVE-2009-3555
>>
>> --
>> Tom Rini
>> Mentor Graphics Corporation
>
> Hi Tom,
>
> could you wait, we are getting contracted from buglabs, to do this
> and other stuff on openjdk.
>
> Bye Henning

That's fine.  But it'd be real nice if 2011.03 has fetchable openjdk, if 
you know how to fixup the SRC_URI already.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


