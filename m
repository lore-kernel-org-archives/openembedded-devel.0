Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HNtyT-0000S7-53
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 17:54:17 +0100
Received: from [91.64.160.193] (helo=[192.168.1.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HNtyS-0006uz-Ln
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 17:54:16 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sun, 4 Mar 2007 17:54:08 +0100
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.160.193
Subject: Recent wordpress attacks and md5sum
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
X-List-Received-Date: Sun, 04 Mar 2007 16:54:17 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

Hello,
the recent wordpress attacks illustrates the danger of changed  
sourcecode. Luckily we do not package wordpress but our packages  
would have contained this backdoor! Now to use the buzz words  
terrorism, danger, security and you all should be scared.
Luckily we do not need a homeland security act to avoid this situation:

<THE_MAIN_POINT>
Please add md5sum to your SRC_URI on http/ftp/sctp.
</THE_MAIN_POINT>


sincerly
	Secretary and Chief Donk of Free Software Security


PS: I wonder if bitbake should refuse to fetch code without md5sum/ 
shasum
PPS: Yeah md5 is cracked, so is the sha family, any other options?


