Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1Gl8wr-0004AE-Jd
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 20:00:32 +0100
Received: from [88.134.98.23] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1Gl8uY-0003nK-4k
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 19:58:02 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Gpgmail-State: !signed
Message-Id: <7945D74A-26A2-4B80-BF3C-9116B76913C2@inf.fu-berlin.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Fri, 17 Nov 2006 19:55:36 +0100
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 88.134.98.23
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: inherit autools?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Nov 2006 19:00:33 -0000
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed
Content-Transfer-Encoding: 7bit

Hey,

org.openembedded.dev ich$ grep -rni "autools" *
packages/nonworking/monotone-viz/monotone-viz_0.11.bb:8:inherit autools

z.

--
Holger Freyther
freyther@inf.fu-berlin.de




