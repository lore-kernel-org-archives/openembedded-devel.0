Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1PxIZr-0002xv-71
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 13:33:24 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 9 Mar 2011 13:31:44 +0100
X-TM-IMSS-Message-ID: <112a217600006b04@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 112a217600006b04 ;
	Wed, 9 Mar 2011 13:31:44 +0100
Message-ID: <4D77732F.1000005@nedap.com>
Date: Wed, 09 Mar 2011 13:31:43 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D773276.1040907@nedap.com>	<AANLkTinccRRrmRgcLkf0=cP_eA4Grm2HyyWrDPbT-CFw@mail.gmail.com>
	<20110309113959.GA22507@mi.fu-berlin.de>
In-Reply-To: <20110309113959.GA22507@mi.fu-berlin.de>
X-OriginalArrivalTime: 09 Mar 2011 12:31:44.0163 (UTC)
	FILETIME=[F30F1730:01CBDE55]
Subject: Re: release-2011.3
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
X-List-Received-Date: Wed, 09 Mar 2011 12:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>>> If I use DISTRO=angstrom-2010.x and start a complete new fresh build, I get
>>>
>> Seems like a different bitbake must be used. You better start from the
>> Angstrom web site Getting Started notes as that's the only place where
>> this is up-to-date.
Don't know what went wrong in the previous attempt but a new fresh start 
helped a lot...

> and please use uclibc-git, they other versions dont have nptl support.
>
How should I accomplish that?


Thanks!
Jaap


