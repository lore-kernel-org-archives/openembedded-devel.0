Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1LTLoI-00008s-9w
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 20:47:22 +0100
Received: from [92.116.132.184] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1LTLge-0004SF-UQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 20:39:30 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Jan 2009 20:36:59 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-9-generic; KDE/4.2.0; i686; ; )
References: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
In-Reply-To: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200901312037.00579.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.132.184
Subject: Re: [RFC Wild Ideas Department] create soft-links from <pkg>/<src>/patches/some_local.patch to <oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Sat, 31 Jan 2009 19:47:22 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 03 December 2008 17:46:04 Leon Woestenberg wrote:
> Hello,
>
> during maintenance of our local set of OE patches, it would be handy
> not having to copy patches back into the repository.
>
> i.e. the patch fetcher could instead of copy the patch to the work
> directory, soft-link from the repo.
>
> Does this make sense?

Yes it does, but I'm also toying with the idea of turning everything into a 
git checkout (using git am for the patches...)...

z.


