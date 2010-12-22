Received: from asmtpout029.mac.com ([17.148.16.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@mac.com>) id 1PVWzS-0000ku-P2
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 23:16:58 +0100
MIME-version: 1.0
Received: from [192.168.1.30] ([87.201.169.175])
	by asmtp029.mac.com (Sun Java(tm) System Messaging Server 6.3-7.04
	(built Sep
	26 2008; 64bit)) with ESMTPSA id <0LDU00BWMLR77M70@asmtp029.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Dec 2010 13:16:23 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=1 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx engine=6.0.2-1010190000 definitions=main-1012220117
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2010-12-22_09:2010-12-22, 2010-12-22,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <4D12671D.1050008@eukrea.com>
Date: Thu, 23 Dec 2010 01:16:06 +0400
Message-id: <C3CB9E8E-9B24-417B-8F37-34509EDD4D2B@mac.com>
References: <ABD557DA-5595-4CD8-AE87-C5FCC45F41BF@mac.com>
	<4D12671D.1050008@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1082)
Subject: Re: compat-wireless recipe
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
X-List-Received-Date: Wed, 22 Dec 2010 22:16:59 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable

Hi Eric,

On Dec 23, 2010, at 1:01 AM, Eric B=E9nard wrote:

> I did one which worked on x86 but didn't have time to update/test it =
for integration. You can find it here :
> http://patchwork.openembedded.org/patch/2013/

Awesome!! :-)=20

I'm still processing some more dependencies. I've managed to build the =
wl1271 driver, but need to backport the wl12xx platform data to get the =
wl1271_sdio.ko module built before I can test it out.

Once I finish getting it to work the manual way, I'll try to modify your =
OE recipe to work with wl1271.

Best regards,

Elvis Dowson=


