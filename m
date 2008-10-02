Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KlCG7-0008VN-0J
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 02:41:35 +0200
Received: from 60-248-25-201.hinet-ip.hinet.net ([60.248.25.201]
	helo=tamarin.local) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KlCC5-00063V-HS
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 02:37:25 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Oct 2008 02:36:46 +0200
User-Agent: KMail/1.9.9
References: <48E36C18.4090504@smartlink.ee>
In-Reply-To: <48E36C18.4090504@smartlink.ee>
MIME-Version: 1.0
Message-Id: <200810020236.47828.zecke@selfish.org>
Subject: Re: git master not updating
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
X-List-Received-Date: Thu, 02 Oct 2008 00:41:37 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 01 October 2008 14:24:56 Kalev Lember wrote:
> Hello,
>
> http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=summary
> The master head of org.openembedded.dev is not updating. I already
> spotted two bug reports (4584 and 4590) which reported issues that were
> fixed in monotone 4 days ago, but never got into git master.

That is on purpose. People complained on irc that CIAbot reports everything 
twice (master, org.openembedded.dev)... and there is no real reason to have a 
branch called master.

z.


