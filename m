Received: from asmtpout026.mac.com ([17.148.16.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NZ5fZ-0002kp-Al
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 17:50:40 +0100
MIME-version: 1.0
Received: from [87.201.169.25] by asmtp026.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWR00AAHD71LE30@asmtp026.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 07:47:35 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001240064
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <20100124154357.GG15943@jama>
Date: Sun, 24 Jan 2010 19:47:22 +0400
Message-id: <1F9F6029-E5F8-4B85-967C-7FB2C110CFCE@mac.com>
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
	<9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
	<20100124154357.GG15943@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.101
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 16:50:40 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi Martin,
                    Yes, just found that solution. I'm installing glibc-static right now.

http://old.nabble.com/Error-Compiling-Gumstix-Image-On-Fedora-12-x86_64-td26776355.html#a26776355

Anyway, I'm updating my setup notes for Fedora 12 x86 64-bit, so it will help others doing this.

Best regards,

Elvis


