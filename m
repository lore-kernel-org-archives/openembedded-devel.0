Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 04DF16AC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 07:39:49 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aHRe6-0003Ab-28 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2016 08:39:45 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 Jan 2016 08:37:43 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <568F67B8.7060001@topic.nl>
Date: Fri, 8 Jan 2016 08:39:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrGdvwCI1FSC+XchGESnvFyb7UT5VYLs9bPFSY8Fj0rdZw98eryZwb+Vsbgd
	saBB5cNc9aUV1oY4fX3W5eOCNA39IMF/tWq0Xia4BSmFvzyHGTjedCBNA121Y38SeyRMCs3XcWpW
	rY6lCH8L7CDV11D5JM7Xk65yci5j+xTRr7HgZJNWyY7q5BA/5iDO7tJWc5LW0A0HkzG7uPVDzc3F
	/UDJomVIDsS/itDc6L24kzSY8UBJuULIpDl323znR+D07qSzNrGWwyxYQNxlGlctos9lj2eb1EIT
	aM/sZt80S+wHyfpIUb1+kQ3sB5+pcGh69v1UE7Q9WvntXa9VPL9K4cA+8t3Xj/LzZ5s/OJg1L2as
	ZxEp4Bv7TWEUoKzFQfrYUeyRYVR0payg4cttk4bRt/Zdg8CBO1Snvm6qXHQp7O9kdewWsgzDQueY
	8/6mgCJU+cRMbYOEJdE462Jlg4EydpQqASJFC/49WOPBr5nlEUI4xEGzvv/YJUvIMZnAWOuyTtoz
	k7kDxRWbP/RnPb5MYDVUMny9tYiXK7nj6P0rWU5Ug5YJgAs4KFgLYz1HAWczhpA=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
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
Subject: Building java
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
X-List-Received-Date: Fri, 08 Jan 2016 07:39:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFSomeone in our project decided he wanted Java on the board, so I j=
ust added=20
"meta-java" to the layers and attempted to follow the README.

So without a clue as to what I'm really doing (I haven't touched Java in 15=
=20
years) I added these to my local.conf:

# Headless java
PREFERRED_PROVIDER_classpath =3D "classpath-minimal"
# Possible provider: cacao-initial-native and jamvm-initial-native
PREFERRED_PROVIDER_virtual/java-initial-native =3D "cacao-initial-native"
# Possible provider: cacao-native and jamvm-native
PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"

And of course added meta-java to bblayers.conf.

I added "openjdk-8" to the image's things to install, and let things build.

While building "openjdk-8-native", things went south, and I get the followi=
ng=20
error message:

ERROR: no configure script found at=20
/home/mike/projects/.../build/tmp-glibc/work/x86_64-linux/openjdk-8-native/=
72b05-r0/jdk8u-e8bed1496ff2/configure


What did I do wrong?



(Note: the board does not have a display, so I don't need/want x11. I tried=
=20
building openjdk-7 instead, but that fails to parse because it requires x11=
 in=20
the distro)


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






