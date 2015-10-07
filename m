Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id 69F2F73D13
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Oct 2015 07:30:17 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZjjAu-0004Vf-4j for openembedded-devel@lists.openembedded.org;
	Wed, 07 Oct 2015 09:30:15 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 7 Oct 2015 09:29:15 +0200
To: <openembedded-devel@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5614C9FA.20703@topic.nl>
Date: Wed, 7 Oct 2015 09:30:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrGdvwCI1FSC+XchGESnvFybuuAnQtp2X/gsw5byOvfppsryRLKaVhBzrtb6
	gGC7tFFc9aUV1oY4fX3W5eOCNA39IMF/tWq0Xia4BSmFvzyHGTjedCBNA121Y38SeyRMCs3XcWpW
	rY6lCH8L7CDV11D5JM7Xk65yci5j+xTRr7HgZJNWyY7q5BA/5iDO7tJWc5LW0A0HkzG7uPVDzc3F
	/UDJomVIDsS/itDc6L24kzSY8UBJuULIpDl323znR+D07qSzNrGWwyxYQNxlGlctos9lj2eb1EIT
	aM/sZt80S+wHyfpIUb1+kQ3sB5+pcGh69v1UE7Q9WvntXa9VPL9K4cA+8t3Xj/LzZ5s/OJg1L2as
	ZxEp4Bv7TWEUoKzFQfrYUeyRYVR0payg4cttk4bRt/Zdg8CBO1Snvm6qXHQp7O9kdV80mZTaHp0a
	hWtMDpo3C39MbYOEJdE462Jlg4EydpQqASJFC/49WOPBr5nlEUI4xFStEsRuY3aE5aSb6OOXuaqW
	u1fDVz0geMmPEfDrUHDxZLEzWz/H7disenK3OVCk7hHP+qX+PCU7V0fBbBTVPJg=
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
Subject: meta-openembedded "toolchain-layer" is broken
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
X-List-Received-Date: Wed, 07 Oct 2015 07:30:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFIf you happen to have "toolchain-layer" in your bblayer list, it w=
ill trigger=20
this:

ERROR: ExpansionError during parsing=20
.../meta-oe/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk_4.6.bb: Failu=
re=20
expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which=
=20
triggered exception FetchError: Fetcher failure: SRCREV was used yet no val=
id=20
SCM was found in SRC_URI

I just happened to notice. Maybe it's time to take gcc 4.6 to the glue fact=
ory?


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






