Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqCWR-0005Kf-Dh
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 21:59:07 +0200
Received: from [92.116.127.219] (helo=[10.129.127.219])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KqCRR-0004Gs-81
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 21:53:58 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2008 21:53:50 +0200
User-Agent: KMail/1.9.9
References: <200810151022.38477.zecke@selfish.org>
	<200810152016.25038.zecke@selfish.org> <gd5cg8$osk$1@ger.gmane.org>
In-Reply-To: <gd5cg8$osk$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200810152153.52020.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.127.219
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 19:59:07 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 October 2008 20:24:07 Koen Kooi wrote:

> I'm undecided about putting the linker stuff in angstrom.inc vs.
> angstroom-<libc>.inc. Go for what you think is best :)

Google couldn't tell me if uclibc supports GNU style hashes, so I only change 
eglibc and glibc... happy rebuilding and I'm sorry when I broke things.

I decided to land now as PRs are changing all the time and keeping up with 
things is pretty hard...

z.


