Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 1001 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Sep 2016 07:47:42 UTC
Received: from mx26-02.smtp.antispamcloud.com (mx26-02.smtp.antispamcloud.com
	[148.251.71.2])
	by mail.openembedded.org (Postfix) with ESMTP id 244BD600BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:47:42 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx26.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bp9KW-00044Q-CS for openembedded-devel@lists.openembedded.org;
	Wed, 28 Sep 2016 09:31:02 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 28 Sep 2016 09:30:59 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
	<57E69552.9040209@topic.nl>
	<CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
	<CA+chaQcftFerFC0S9_+XwsZqZ6EAMtdfOjGj5yjoy2mut9wO0Q@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57EB71B3.6060803@topic.nl>
Date: Wed, 28 Sep 2016 09:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcftFerFC0S9_+XwsZqZ6EAMtdfOjGj5yjoy2mut9wO0Q@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl3BHRhPmADMNxIri
	koqGIm8+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAoX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDdpaan89csPuxNcrcm3g0VrZ+7KIxe
	L9a8yWCRhadOUlss+n2ffnQxt6aJ7klZab+9g1L5kxBIYGB7BJyUdlmpOtqAyNDaGu3M3V4NLSLw
	IF/664n8xZZ193ZhZHjQXRvzMzgq9doiEWZJe3CYb7H6WxwNFavLErUb39TUKcCiO2iH1Wgh6RAe
	nBR+licROGZnAn7VHrMcznH6wzO89uwBw83SF9PefAmNUzEE2TEnz2NIBxN+8iLMjiqr6CILtV73
	kf3bHfLz5oIsvwONwYzu
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00484098572435)
X-Recommended-Action: accept
Subject: Re: [meta-networking][PATCH] phytool: Add recipe
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
X-List-Received-Date: Wed, 28 Sep 2016 07:47:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 26-09-16 22:34, Martin Jansa wrote:
> 2 more issues:
>
> WARNING: phytool-1.0.1-r0 do_populate_lic: Could not copy license file
> phytool/1.0.1-r0/git/COPYING to
> phytool/1.0.1-r0/license-destdir/phytool/COPYING: [Errno 2] No such
> file or directory: 'phytool/1.0.1-r0/git/COPYING'
> ERROR: phytool-1.0.1-r0 do_populate_lic: QA Issue: phytool:
> LIC_FILES_CHKSUM points to an invalid file:
> phytool/1.0.1-r0/git/COPYING [license-checksum]
> NOTE: recipe phytool-1.0.1-r0: task do_populate_lic: Succeeded
> ...

Weird, it didn't barf on that on my system until I cleaned it and started=20
over. Ah well, I;ll send a v2 which fixes it.

> NOTE: recipe phytool-1.0.1-r0: task do_package_qa: Started
> ERROR: phytool-1.0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
> elf binary: 'phytool/1.0.1-r0/packages-split/phytool/usr/bin/phytool'
> [ldflags]
> ERROR: phytool-1.0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
> elf binary: 'phytool/1.0.1-r0/packages-split/phytool/usr/bin/phytool'
> [ldflags]
> ERROR: phytool-1.0.1-r0 do_package_qa: QA run found fatal errors.
> Please consider fixing them.
> ERROR: phytool-1.0.1-r0 do_package_qa: Function failed: do_package_qa

I have no clue what that means. I also have no clue what I'm supposed to do=
=20
about it. And on my build it was only a warning.


>
>
> On Mon, Sep 26, 2016 at 9:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sat, Sep 24, 2016 at 8:01 AM, Mike Looijmans <mike.looijmans@topic.nl=
>
>> wrote:
>>> On 23-09-16 20:33, Khem Raj wrote:
>>>>
>>>> On Fri, Sep 23, 2016 at 5:33 AM, Mike Looijmans <
>> mike.looijmans@topic.nl>
>>>> wrote:
>>>>>
>>>>> A nice tool to directly read, write and interpret ethernet PHY data.
>>>>> Very useful when debugging PHY or MDIO problems, which ethtool does
>>>>> not do.
>>>>>
>>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>>> ---
>>>>>    meta-networking/recipes-support/phytool/phytool.bb | 14
>> ++++++++++++++
>>>>>    1 file changed, 14 insertions(+)
>>>>>    create mode 100644 meta-networking/recipes-support/phytool/
>> phytool.bb
>>>>>
>>>>> diff --git a/meta-networking/recipes-support/phytool/phytool.bb
>>>>> b/meta-networking/recipes-support/phytool/phytool.bb
>>>>> new file mode 100644
>>>>> index 0000000..9d541b7
>>>>> --- /dev/null
>>>>> +++ b/meta-networking/recipes-support/phytool/phytool.bb
>>>>> @@ -0,0 +1,14 @@
>>>>> +SUMMARY =3D "PHY interface tool for Linux"
>>>>> +LICENSE =3D "GPLv2"
>>>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df07=
9bae1
>> 9f"
>>>>> +
>>>>> +PV =3D "1.0.1"
>>>>> +SRCREV =3D "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
>>>>> +SRC_URI =3D "git://github.com/wkz/phytool.git"
>>>>> +
>>>>> +S =3D "${WORKDIR}/git"
>>>>> +
>>>>> +do_install() {
>>>>> +       install -d ${D}${prefix}/bin
>>>>
>>>>
>>>> perhaps use base_bindir here
>>>
>>>
>>> The makefile installs to $PREFIX/bin so I deliberately put the same
>> folder
>>> in the recipe (the makefile doesn't create the directory). If anyone
>> changes
>>> $bindir the install will fail.
>>
>> I see the logic,  if you dont want to use bitbake variables then perhaps
>> its
>> good to add a comment to explain why it was not done
>>
>>>
>>>>
>>>>> +       oe_runmake 'DESTDIR=3D${D}' 'PREFIX=3D${prefix}' install
>>>>> +}
>>>>> --
>>>>> 1.9.1
>>>>>
>>>>> --
>>>>>=20

Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail





_______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
>>> --
>>> Mike Looijmans
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


