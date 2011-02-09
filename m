Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pn6O8-00068F-Ra
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:31:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id E878EA5671;
	Wed,  9 Feb 2011 09:29:59 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yLK7q8D4K-1f; Wed,  9 Feb 2011 09:29:59 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 0363EA50F6;
	Wed,  9 Feb 2011 09:29:58 +0000 (GMT)
Message-ID: <4D525ED2.7020000@xora.org.uk>
Date: Wed, 09 Feb 2011 09:30:58 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D4BE849.9070704@dresearch.de> <4D5247CD.20700@dresearch.de>
	<4D525A03.2020601@xora.org.uk> <4D525D27.5030902@dresearch.de>
In-Reply-To: <4D525D27.5030902@dresearch.de>
X-Enigmail-Version: 1.1.1
Cc: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IMOFbmdzdHLDtm0gdmVyc2lvbnM/?=
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
X-List-Received-Date: Wed, 09 Feb 2011 09:31:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/02/2011 09:23, Steffen Sledz wrote:
> Am 09.02.2011 10:10, schrieb Graeme Gregory:
>> On 09/02/2011 07:52, Steffen Sledz wrote:
>>> Am 04.02.2011 12:51, schrieb Steffen Sledz:
>>>> I'm a bit confused about the Angstrom versions.
>>>>
>>>> Setting in local.conf is
>>>>
>>>>   DISTRO =3D "angstrom-2008.1"
>>>>
>>>> but bitbake reports
>>>>
>>>>   Build Configuration:
>>>>   BB_VERSION        =3D "1.10.2"
>>>>   METADATA_BRANCH   =3D "testing-next"
>>>>   METADATA_REVISION =3D "3a7b93a"
>>>>   TARGET_ARCH       =3D "arm"
>>>>   TARGET_OS         =3D "linux-gnueabi"
>>>>   MACHINE           =3D "hipox"
>>>>   DISTRO            =3D "angstrom"
>>>>   DISTRO_VERSION    =3D "2010.7-test-20110204"
>>>>   TARGET_FPU        =3D "soft"
>>>>
>>>> Is this intented?
>>>>
>>>> BTW: Which is the suggested/released =C3=85ngstr=C3=B6m version? htt=
p://www.angstrom-distribution.org/ seems to be not very helpful here. e.g=
. the FAQ link results in an PAGE NOT FOUND. :(
>> 2008.1 is the "stable" version of Angstrom which has all the benefit o=
f
>> our extensive toolchain testing.
>>
>> 2010.x is angstrom-next and is the in progress version moving to gcc 4=
.5
>> blah blah blah.
> OK, but why bitbake reports DISTRO_VERSION =3D "2010.7-test-20110204" i=
f it is set to DISTRO =3D "angstrom-2008.1" ???
>
Because thats the actual version of the DISTRO produced.

We discovered if we rename the file people dont read emails or error
messages and waste a week debugging non issues so we stopped renaming
the file.

Graeme



