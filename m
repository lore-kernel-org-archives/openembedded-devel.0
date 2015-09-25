Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 1003 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Sep 2015 06:28:57 UTC
Received: from mx6-14.smtp.antispamcloud.com (mx6-14.smtp.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABBD76FF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 06:28:57 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZfMEk-0000SW-8r for openembedded-devel@lists.openembedded.org;
	Fri, 25 Sep 2015 08:12:11 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 25 Sep 2015 08:11:16 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <5603FD45.5030308@topic.nl>
	<CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
	<CALbNGRR9eL001Y7UByvKuoeQuOr=93OHX_WxjD2NHO5WKNmg-w@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5604E5AE.1060400@topic.nl>
Date: Fri, 25 Sep 2015 08:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRR9eL001Y7UByvKuoeQuOr=93OHX_WxjD2NHO5WKNmg-w@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrGdvwCI1FSC+XchGESnvFybJH20M/iVnwSD2kUWe7/TJmP9nrK+H6uvYJRX
	84wSAbRc9aUV1oY4fX3W5eOCNA39IMF/tWq0Xia4BSmFvzyHGTjedCBNA121Y38SeyRMCs3XcWpW
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
Subject: Re: "libgudev" fails to build with current master
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
X-List-Received-Date: Fri, 25 Sep 2015 06:28:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 25-09-15 01:22, Andreas M=C3=BCller wrote:
> On Thu, Sep 24, 2015 at 6:45 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Thu, Sep 24, 2015 at 3:40 PM, Mike Looijmans <mike.looijmans@topic.nl=
> wrote:
>>> | checking for LIBUDEV... no
>>> | configure: error: Package requirements (libudev >=3D 199) were not me=
t:
>>> |
>>> | Requested 'libudev >=3D 199' but version of libudev is 182
>>> |
>>> ...
>>>
>>> ERROR: Task 5548
>>> (/.../meta-oe/meta-oe/recipes-gnome/libgudev/libgudev_230.bb, do_config=
ure)
>>> failed with exit code '1'
>>>
>> Which init system are you using - I guess not systemd
>>
> Let's assume it is not systemd. Could you try attached  0001.. for
> oe-core and 0002.. foe meta-oe and give feedback. I tested these for
> systemd distro without new issues.

Applied both patches, and the errors went away. Have yet to test if it=20
actually produces a working image as there are still a few more issues I ne=
ed=20
to look into.

M.


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






