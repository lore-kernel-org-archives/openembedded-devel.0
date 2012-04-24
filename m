Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SMnEZ-0002wk-2Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 23:25:15 +0200
Received: by vcbfl13 with SMTP id fl13so930058vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=p1C8t0Yq6jDtprgyLrZWXTsfF/jPPZn1lAsOCmuPMFk=;
	b=OJXPlozRhm49wtyFHHk2wJ8W5E2E63ae5/s8jwHNh8OyJJzkvd84LIt0qq0uVpsHKn
	Ja5ukP19Szc7Tbj8xHeGoVuHuCOywA1BPCMvh7Y3K/8zKFKn6JuN3zWDJy0St60EfMrR
	c6eUmcjGWsHnfcftBQbSN+BZnBwhes1d/WjQn58MqriyGSayAiLWlRvCDlyx+b5gbS9X
	+5caQPDTrcdwmX6K+wgRhTtDiTKrvrjpnxvfKM70Ucac/D0+cTnZs9+PDYAHnHtO4Xyc
	5trO57xtxsZEtjlZuyYRB+N97KWfmRCiZgkl0kd15rOWswwbKGHo3DI5OedVbCj50GpI
	CoIA==
Received: by 10.52.90.178 with SMTP id bx18mr13995905vdb.123.1335302139788;
	Tue, 24 Apr 2012 14:15:39 -0700 (PDT)
Received: from [192.168.1.14] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id i4sm33445095vdk.8.2012.04.24.14.15.35
	(version=SSLv3 cipher=OTHER); Tue, 24 Apr 2012 14:15:38 -0700 (PDT)
Message-ID: <4F9717ED.9020503@gmail.com>
Date: Tue, 24 Apr 2012 14:15:25 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F8C9E68.9050106@gmail.com>
	<4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com> <4F932ADB.7040003@gmail.com>
	<4F970F9C.7030508@gmail.com>
	<1335300289.3133.136.camel@x121e.pbcl.net>
	<4F9713C4.2020908@gmail.com>
	<1335301431.3133.144.camel@x121e.pbcl.net>
In-Reply-To: <1335301431.3133.144.camel@x121e.pbcl.net>
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
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
X-List-Received-Date: Tue, 24 Apr 2012 21:25:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2012 02:03 PM, Phil Blundell wrote:
> On Tue, 2012-04-24 at 13:57 -0700, j wrote:
>> The build machines all give messages like this just vary on libc version
>> listed
>>
>> [47152.769257] ld[22617]: segfault at 403 ip 00007f2149cfd435 sp
>> 00007fffb83ccb50 error 4 in libc-2.15.so[7f2149cb6000+197000]
>> 2012-04-18T14:50:08-07:00 localhost kernel: [47163.860996] ld[31096]:
>> segfault at 403 ip 00007fc2da152435 sp 00007fffab491c30 error 4 in
>> libc-2.15.so[7fc2da10b000+197000]
> Does this correlate with an actual problem, or did you just see those
> messages in the log and think that they were cause for concern?
I was assuming since the machine segfaulted and I could not get working 
images they were related.

>
> If I had to guess I would say that this is probably some autoconf test
> which is tickling a bug in ld.  You could probably establish which
> package is doing that by looking at the timestamps and correlating them
> with the build logs.

I will try this once the machines go through the process again.

>
>> qa.log has more than these messages but every machines logs are the same
>> like this
>>
>> udev-182: udev:
>> /home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/libgudev/lib/libgudev-1.0.so.0.1.1
>> links to something under exec_prefix
> That doesn't appear to be related to the ld segfault
> .
>> each one of the machines from a fresh install have this problem. The
>> resulting image boots but does not fully function. I have issues such as
>> the native sdk does not install all the packages correctly.
>> example would be install.
>> normall you would find it
>> /usr/bin/install
>> I end up with
>> /home/bill/OE/usr/bin/install
> ... and nor really does this.  This latter problem is almost certainly
> just a bug in the SDK packaging and nothing at all to do with your build
> host.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I will just focus on trying to match timestamps with the segfault and 
trying to sort out all the issues once I have a built image.

I know I do not fully grasp everything here so thank you for your help 
and if I find anything relevant or can post further info on this I will 
share. Unless there are more suggestions.

Thank you


