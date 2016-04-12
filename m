Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 2470 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Apr 2016 06:47:30 UTC
Received: from mx18-13.smtp.antispamcloud.com (mx18-13.smtp.antispamcloud.com
	[207.244.64.182])
	by mail.openembedded.org (Postfix) with ESMTP id BA62B612E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:47:30 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aprSp-0004Nn-MV for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2016 08:06:18 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 Apr 2016 08:06:14 +0200
To: <openembedded-devel@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <570C9055.1020609@topic.nl>
Date: Tue, 12 Apr 2016 08:06:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw8GIk4znw5EcwHHi+ra9lypEmJCbamfqLB4wH/k+k+Tftor9O5jjWZI633McN2M/OUXR
	4XktS92Fqq3Qa0exZrH30SrPk8tfaSF+RZrpk8YKU12d2pmLLkAmzasehlwbl/VVzlisf55Rlzy3
	2kKwt18+DKA2NNvQHVv9U39IvZ21zdRUEyKgf06VPrRwa0cLJi8VvSW0y6Uj/HKysoQ9rdaXnIzi
	ZzrQF/NfyYQCBdPp8r0OwmyDSA3EucKVsviOWCBBDJ8BWkt4XtwAq0OGAww3WqOX5QcacqgJcR7c
	/W4Ta8zked5itrDd+BzMviaERchDn/SE2YB8+7dDpYmaGdjVHqnSNOEUb2G8shLx0S34J/7fZkj/
	D2hb6GRhlu8w2dJyhRNN93x8SjNuvSUWL0lk8c4VTjme8wVNJKVkN6pQWyz6fZ9+dDG3ponuSVlp
	v+iPkQ2WHT2iHf75ak3dIbarY2UQ+x03ihNeM8H4LR9edfis1O0p6F7CmaTsN5I7sqliI3vXy8qi
	7hPUhi1mSN4y+1rnANBVRukhwtJ4xu9GaIfVaCHpEB6cFH6WJxE4ZgKEq5rHBicuu6aCmggOqyZ8
	9c1EkKqVUNdHAhYhh59oMny9tYiXK7nj6P0rWU5Ug5YJgAs4KFgLYz1HAWczhpA=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: opencv was skipped: Recipe is blacklisted: Not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Tue, 12 Apr 2016 06:47:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFWith current master I cannot build any package that depends on Ope=
nCV. I get=20
the message:

opencv was skipped: Recipe is blacklisted: Not compatible with currently us=
ed=20
ffmpeg 3

I don't want or need (I guess) ffmpeg, so what can I do to unblacklist it=20
without hacking meta-openembedded itself?



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






