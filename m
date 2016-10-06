Return-Path: <prvs=0087855c4f=mike.looijmans@topicproducts.com>
Received: from mx12-04.smtp.antispamcloud.com (mx12-04.smtp.antispamcloud.com
	[46.165.232.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC0271A46
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 05:54:31 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bs1dU-0001yU-TE for openembedded-devel@lists.openembedded.org;
	Thu, 06 Oct 2016 07:54:30 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Oct 2016 07:54:27 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
	<57E69552.9040209@topic.nl>
	<CAMKF1so4gZ9zYqS17E-xRq0U-bu27aiv6v_EiR2zc3OqCgDSYg@mail.gmail.com>
	<CA+chaQcftFerFC0S9_+XwsZqZ6EAMtdfOjGj5yjoy2mut9wO0Q@mail.gmail.com>
	<1475660078-12664-1-git-send-email-mike.looijmans@topic.nl>
	<CAMKF1sqTt+xuBTo4JyBDMUaHoygpuVUgcjQWyGfM9DAobaioyQ@mail.gmail.com>
	<20161005163247.GC2926@jama>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <845c18a2-7424-d286-a87a-4621a793ceca@topic.nl>
Date: Thu, 6 Oct 2016 07:54:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161005163247.GC2926@jama>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl7ueYq6S6jdj8kEu
	zqVO9P4+DKA2NNvQHVv9U39IvZ21x85OM4GWP9JQ/hHPc9c4dspy46MY4AXC06EFbOC1uAoX2ECf
	0tidf4f9xbnt4dr3ucE6FVHy9oQcVLiVeDoadp8jI9oH6dGc6edzLFJtSM1o5rQC2VE4ySdZe0mi
	K6wgOmG6/54gza7q5Za0AFsz6J51OyFNIoaxpS1mXZNdroDdpaan89csPuxNcrcm3g0VrZ+7KIxe
	L9a8yWCRhadOUlss+n2ffnQxt6aJ7klZab+9g1L5kxBIYGB7BJyUdlmpOtqAyNDaGu3M3V4NLSLw
	IF/664n8xZZ193ZhZHjQXRtPWfCpEalZkqHbJcTqNjqGWxwNFavLErUb39TUKcCiO2iH1Wgh6RAe
	nBR+licROGa7w33/14GVkNZ6okgvMpPoU75prjeyjuZlW2IsigoonmNIBxN+8iLMjiqr6CILtV73
	kf3bHfLz5oIsvwONwYzu
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.0030285043839)
X-Recommended-Action: accept
Subject: Re: [meta-networking][PATCH v2] phytool: Add recipe
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
X-List-Received-Date: Thu, 06 Oct 2016 05:54:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05-10-16 18:32, Martin Jansa wrote:
> On Wed, Oct 05, 2016 at 08:38:07AM -0700, Khem Raj wrote:
>> On Wed, Oct 5, 2016 at 2:34 AM, Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>>> A nice tool to directly read, write and interpret ethernet PHY data.
>>> Very useful when debugging PHY or MDIO problems, which ethtool does
>>> not do.
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>> v2: Fix LICENSE filename and checksum
>>>     Honor LDFLAGS value (patch accepted upstream)
>>>
>>>  meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>  create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
>>>
>>> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-=
networking/recipes-support/phytool/phytool.bb
>>> new file mode 100644
>>> index 0000000..d451aa9
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/phytool/phytool.bb
>>> @@ -0,0 +1,14 @@
>>> +SUMMARY =3D "PHY interface tool for Linux"
>>> +LICENSE =3D "GPLv2"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52=
fe3f0"
>>> +
>>> +PV =3D "1.0.1"
>>
>> perhaps its better to include SRCPV in PV above since the SRCREV
>> below is really 1.0.1+some more commits. moreover we get srcrev
>> accounted for task hashes

Will do.

>>
>>> +SRCREV =3D "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
>>> +SRC_URI =3D "git://github.com/wkz/phytool.git"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +do_install() {
>>> +       install -d ${D}${prefix}/bin
>>> +       oe_runmake 'DESTDIR=3D${D}' 'PREFIX=3D${prefix}' install
>
> We're not using tabs for indentation.
> see http://www.openembedded.org/wiki/Styleguide

Will fix in v3.

I also want to move it to another location in meta-oe, because meta-network=
ing=20
depends on meta-python and it's really weird to have to add meta-python to=
=20
your layers just to get a simple C binary tool.

Mike.


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






