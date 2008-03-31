Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JgS0N-0008Kl-72
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 23:57:27 +0200
Received: from [212.23.103.84] (helo=[10.161.84.136])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JgS0M-0007Bk-E8
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 23:57:26 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 22:58:08 +0200
User-Agent: KMail/1.9.9
References: <200803311351.54378.e.robertson.svg@gmail.com>
In-Reply-To: <200803311351.54378.e.robertson.svg@gmail.com>
MIME-Version: 1.0
Message-Id: <200803312258.08183.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.84
Subject: Re: OE.mtn snapshot md5sum incorrect
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
X-List-Received-Date: Mon, 31 Mar 2008 21:57:27 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 31 March 2008 20:51:47 E Robertson wrote:
> I think the md5sum for the _current_ snapshot needs updating.
>
> $md5sum -c OE.mtn.bz2.md5
> md5sum: OE-this-is-for-mtn-0.35.mtn.bz2: No such file or directory
> OE-this-is-for-mtn-0.35.mtn.bz2: FAILED open or read
> md5sum: WARNING: 1 of 1 listed file could not be read

Or just remove the md5 sum.

Reasoning:
a) Integrity checking can be done with mtn db check
b) md5 is not for security. pull yourself for security.


z.


