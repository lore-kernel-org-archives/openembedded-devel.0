Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-05.smtp.antispamcloud.com (mx6-05.smtp.antispamcloud.com
	[95.211.2.196])
	by mail.openembedded.org (Postfix) with ESMTP id A7E07755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 08:23:53 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZrM1L-0006zl-0T for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2015 09:23:51 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 28 Oct 2015 09:22:35 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <55EAE272.5010904@topic.nl> <20151027182121.GF2577@jama>
	<CAMKF1spKg10RUh3O3f+skxykHvGHA9Si-LvD1jKLDUQCrE2rtw@mail.gmail.com>
	<20151027195742.GG2577@jama> <20151027202503.GH2577@jama>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5630860B.50701@topic.nl>
Date: Wed, 28 Oct 2015 09:23:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20151027202503.GH2577@jama>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrGdvwCI1FSC+XchGESnvFybI5fa2A36RIhVA62ZQk0Uj+tq03E0lOPYQbSV
	/LyKrKtc9aUV1oY4fX3W5eOCNA39IMF/tWq0Xia4BSmFvzyHGTjedCBNA121Y38SeyRMCs3XcWpW
	rY6lCH8L7CDV11D5JM7Xk65yci5j+xTRr7HgZJNWyY7q5BA/5iDO7tJWc5LW0A0HkzG7uPVDzc3F
	/UDJomVIDsS/itDc6L24kzSY8UBJuULIpDl323znR+D07qSzNrGWwyxYQNxlGlctos9lj2eb1EIT
	aM/sZt80S+wHyfpIUb1+kQ3sB5+pcGh69v1UE7Q9WvntXa9VPL9K4cA+8t3Xj/LzZ5s/OJg1L2as
	ZxEp4Bv7TWEUoKzFQfrYUeyRYVR0payg4cttk4bRt/Zdg8CBO1Snvm6qXHQp7O9kdfgKq5/ukPRo
	6r9EQdnU18VWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5loqO8n5Tkj3jzX/sRnep+cTmW
	u1fDVz0geMmPEfDrUHDxZLEzWz/H7disenK3OVCk7hHP+qX+PCU7V0fBbBTVPJg=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJXhXyDRoOQM5J3kcUr0HrMvJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00747268488635)
X-Recommended-Action: accept
Subject: Re: "krb" fails to build, suspect GCC bug
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
X-List-Received-Date: Wed, 28 Oct 2015 08:23:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 27-10-15 21:25, Martin Jansa wrote:
> On Tue, Oct 27, 2015 at 08:57:42PM +0100, Martin Jansa wrote:
>> On Tue, Oct 27, 2015 at 11:26:32AM -0700, Khem Raj wrote:
>>> On Tue, Oct 27, 2015 at 11:21 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>>>> On Sat, Sep 05, 2015 at 02:39:14PM +0200, Mike Looijmans wrote:
>>>>> I got this weird build failure from the "krb" package:
>>>>>
>>>>> | make[3]: Entering directory
>>>>> '/TOPDIR/build/tmp/work/mips32el-oe-linux/krb5/1.13.2-r0/krb5-1.13.2/=
src/lib/krb5/ccache'
>>>>> | mipsel-oe-linux-gcc  -mel -mabi=3D32 -mhard-float -march=3Dmips32
>>>>> --sysroot=3D/TOPDIR/build/tmp/sysroots/formuler1 -fPIC -DSHARED
>>>>> -DHAVE_CONFIG_H  -I../../../include -I../../../include -I./ccapi -I. =
-I.
>>>>>    -DKRB5_DEPRECATED=3D1 -DKRB5_PRIVATE  -Os -pipe -g
>>>>> -feliminate-unused-debug-types -DDESTRUCTOR_ATTR_WORKS=3D1
>>>>> -I/TOPDIR/build/tmp/sysroots/formuler1/usr/include/et -Wall -Wcast-al=
ign
>>>>> -Wshadow -Wmissing-prototypes -Wno-format-zero-length -Woverflow
>>>>> -Wstrict-overflow -Wmissing-format-attribute -Wmissing-prototypes
>>>>> -Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-functi=
on
>>>>> -Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas
>>>>> -Wsign-compare -Werror=3Duninitialized -Werror=3Dpointer-arith
>>>>> -Werror=3Ddeclaration-after-statement
>>>>> -Werror-implicit-function-declaration -pthread -c cc_file.c -o
>>>>> cc_file.so.o && mv -f cc_file.so.o cc_file.so
>>>>> | cc_file.c: In function 'fcc_next_cred':
>>>>> | cc_file.c:368:9: error: 'maxsize' may be used uninitialized in this
>>>>> function [-Werror=3Dmaybe-uninitialized]
>>>>> |      ret =3D load_data(context, id, maxsize, buf);
>>>>> |          ^
>>>>> | cc_file.c:1091:12: note: 'maxsize' was declared here
>>>>> |      size_t maxsize;
>>>>> |             ^
>>>>> | cc1: some warnings being treated as errors
>>>>>
>>>>> Looking at the source, this doesn't make any sense at all. The
>>>>> declaration of the variable isn't even in the same method body. And t=
he
>>>>> line it complains about is about the fifth time it passes that variab=
le
>>>>> to another method.
>>>>>
>>>>> And working around it by initializing maxsize=3D0 just makes the comp=
iler
>>>>> choke on a similar situation elsewhere:
>>>>> | packet.c:50:67: error: 'id' may be used uninitialized in this funct=
ion
>>>>>
>>>>>
>>>>> I suspect the problem here is GCC and not the krb code. Anyone seen t=
his?
>>>>
>>>> I've seen it today in my world builds, It seems to fail only when buil=
ding with -Os.
>>>>
>>>> I've seen similar issue in mdadm, also only with -Os.
>>>>
>>>
>>> is this regression ? or seen for first time?
>>
>> krb5 fails to build like this with -Os at least since dizzy

Since the move to gcc5 this fails. This workaround makes the build pass onc=
e more:

https://github.com/OpenPLi/openpli-oe-core/commit/781fea2e5e5e9a18ee905a01b=
1e2ee80b3aa4721

...
> Quick grep in my last -Os world build shows 2 more recipes with
> similar issue (smbnetfs is failing in krb5 dependency already):
...

I suspect the bug is in GCC, not in the code of these recipes.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at : Aerospace Electrical Systems Expo Europe which will be held f=
rom 17.11.2015 till 19.11.2015, Findorffstrasse 101 Bremen, Germany, Hall 5=
, stand number C65
http://www.aesexpo.eu



