Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-11.smtp.antispamcloud.com (mx6-11.smtp.antispamcloud.com
	[95.211.2.202])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBC0731AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 10:21:42 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aJf1u-0006f0-Uh for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2016 11:21:40 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 14 Jan 2016 11:19:25 +0100
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1452759356.git.yi.zhao@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <569776A1.4000205@topic.nl>
Date: Thu, 14 Jan 2016 11:21:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1452759356.git.yi.zhao@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrGdvwCI1FSC+XchGESnvFybbdN9asEU+3/FhG6XmjEBx2Afgkpi4H7s2Ns0
	C/w6zIFc9aUV1oY4fX3W5eOCNA39IMF/tWq0Xia4BSmFvzyHGTjedCBNA121Y38SeyRMCs3XcWpW
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
X-Spampanel-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
Subject: Re: [meta-oe][PATCH 0/4] host-user-contaminated fixes for meta-oe
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
X-List-Received-Date: Thu, 14 Jan 2016 10:21:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFInstead of patching things up with chown, you could also instruct =
the "cp"=20
command to not attempt to preserve ownership (the -a and -p options will do=
 that).

Instead of "cp -r -p ..." use "cp -r --preserve=3Dmode,links ..."

Instead of "cp -a ..." use "cp -R --no-dereference --preserve=3Dmode,links =
..."

This fixes these QA warnings in a more structured way.


On 14-01-16 09:19, Yi Zhao wrote:
>
> The following changes since commit 73af5c278f6617149a46b2d2a1549bc154fa79=
e5:
>
>    mime-construct: Perform more mangling for perl path (2016-01-06 13:27:=
21 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib yzhao/4-fixes
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dyzhao/4-fixes
>
> Yi Zhao (4):
>    debootstrap: fix host-user-contaminated
>    espeak: fix host-user-contaminated
>    orrery: fix host-user-contaminated
>    logwatch: fix host-user-contaminated
>
>   .../debootstrap/debootstrap_1.0.67.bb              |    1 +
>   .../recipes-extended/logwatch/logwatch_7.4.1.bb    |    1 +
>   meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |    1 +
>   meta-oe/recipes-support/espeak/espeak_1.37.bb      |    1 +
>   4 files changed, 4 insertions(+)
>



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






