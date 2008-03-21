Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JcjTN-0006Ov-QW
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2008 16:48:01 +0100
Received: from [212.23.103.61] (helo=[10.129.246.98])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JcjTN-0005TG-8R
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2008 16:48:01 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Mar 2008 16:46:28 +0100
User-Agent: KMail/1.9.9
References: <47E3C6F7.8030902@gmail.com>
In-Reply-To: <47E3C6F7.8030902@gmail.com>
MIME-Version: 1.0
Message-Id: <200803211646.29107.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.61
Subject: Re: RPROVIDES problem for kdepimpi
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
X-List-Received-Date: Fri, 21 Mar 2008 15:48:01 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 21 March 2008 15:32:23 Junqian Gordon Xu wrote:
> Similar to the tzdata problem. kdepimpi recipe does not define a package
> ${PN}, and bitbake doesn't like the fact that ${PN} is missing in
> RPROVIDES.

Where is the issue? Why should there be a RPROVIDES=kdepimpi?

z.


