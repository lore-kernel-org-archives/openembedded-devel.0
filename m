Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 1922 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Jan 2016 10:40:40 UTC
Received: from mx6-11.smtp.antispamcloud.com (mx6-11.smtp.antispamcloud.com
	[95.211.2.202])
	by mail.openembedded.org (Postfix) with ESMTP id 13B71731D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:40:40 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aHTyB-0005Go-Mj for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2016 11:08:38 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 Jan 2016 11:06:37 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <568F67B8.7060001@topic.nl>
	<B75422EE-16C0-4C07-8B55-124859899C82@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <568F8A9E.1080300@topic.nl>
Date: Fri, 8 Jan 2016 11:08:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <B75422EE-16C0-4C07-8B55-124859899C82@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrGdvwCI1FSC+XchGESnvFyb7UT5VYLs9bPFSY8Fj0rdZ6C3MFTIPW6y2MPd
	OhSXp4Bc9aUV1oY4fX3W5eOCNA39IMF/tWq0Xia4BSmFvzyHGTjedCBNA121Y38SeyRMCs3XcWpW
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
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: Building java
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
X-List-Received-Date: Fri, 08 Jan 2016 10:40:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 08-01-16 10:48, Jens Rehsack wrote:
>
>> Am 08.01.2016 um 08:39 schrieb Mike Looijmans <mike.looijmans@topic.nl>:
>>
>> Someone in our project decided he wanted Java on the board, so I just ad=
ded "meta-java" to the layers and attempted to follow the README.
>>
>> So without a clue as to what I'm really doing (I haven't touched Java in=
 15 years) I added these to my local.conf:
>>
>> # Headless java
>> PREFERRED_PROVIDER_classpath =3D "classpath-minimal"
>> # Possible provider: cacao-initial-native and jamvm-initial-native
>> PREFERRED_PROVIDER_virtual/java-initial-native =3D "cacao-initial-native=
"
>> # Possible provider: cacao-native and jamvm-native
>> PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
>>
>> And of course added meta-java to bblayers.conf.
>>
>> I added "openjdk-8" to the image's things to install, and let things bui=
ld.
>>
>> While building "openjdk-8-native", things went south, and I get the foll=
owing error message:
>>
>> ERROR: no configure script found at /home/mike/projects/.../build/tmp-gl=
ibc/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/configur=
e
>>
>>
>> What did I do wrong?
>
> meta-java is master, so you need poky on master, too - or cherry-pick the=
 autotools.bbclass patch

I was close to master already, but apparently not close enough.

Upgrading everything to current master results in:

ERROR: ParseError at=20
/home/mike/projects/.../meta-oe/meta-oe/recipes-extended/sip/sip_4.16.4.bb:=
19:=20
Could not inherit file classes/qmake2.bbclass


>
>> (Note: the board does not have a display, so I don't need/want x11. I tr=
ied building openjdk-7 instead, but that fails to parse because it requires=
 x11 in the distro)
>
> You could port the remove-x11-patches to openjdk-7, since we currently ne=
ed Java8, I have no "business case" to fix openjdk-7 :/

I don't care either, I'm happy when "helloworld.java" runs on target.



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






