Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TZJ8D-00042V-Ef
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 11:26:42 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Fri, 16 Nov 2012
	11:12:42 +0100
X-TM-IMSS-Message-ID: <f1b1916e0020763f@nedap.com>
Received: from [10.17.24.8] ([10.17.24.8]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id f1b1916e0020763f ;
	Fri, 16 Nov 2012 11:12:33 +0100
Message-ID: <50A61199.3010309@nedap.com>
Date: Fri, 16 Nov 2012 11:12:41 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50A4F6E6.9040507@nedap.com>
	<20121116092221.GA6265@mi.fu-berlin.de>
In-Reply-To: <20121116092221.GA6265@mi.fu-berlin.de>
Subject: Re: llvm issue
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
X-List-Received-Date: Fri, 16 Nov 2012 10:26:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/2012 10:22 AM, Henning Heinold wrote:
> On Thu, Nov 15, 2012 at 03:06:30PM +0100, Jaap de Jong wrote:
>> Hi All,
>>
>> when I checkout openjdk-7 on meta-java and bitbake <anything> I get
>> these errors:
>>
>> ERROR: Unable to parse /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb
>> | ETA:  00:00:15
>> ERROR: Command execution failed: Exited with 1
>> NOTE: Error expanding variable populate_packages
>> NOTE: Error during finalise of /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.8_2.8.bb
>> NOTE: Error expanding variable populate_packages
>> NOTE: Error during finalise of /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb
>>
>> Anyone already know what is wrong here?
>>
>> Cheers!
>> Jaap
> Hi Jaap,
>
> khem posted some patches for the jdk7 branch unfornatly I dont have the much time
> to integrate them yet. Please look at the oe-dev patchwork or use his github repo.
So what would be the combination to go?
1) openembedded-core --> danny
2) meta-java --> khem: openjdk-7
Or something different?

>
> Maybee in christmas holiday I will find some time to merge jdk7 branch into master.
Sitting next to your Christmas tree! :-)



