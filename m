Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KaWGD-0000z6-4t
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Sep 2008 15:49:33 +0200
Received: from [92.117.95.97] (helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KaWED-0002iz-Nn
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Sep 2008 15:47:31 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Sep 2008 15:47:04 +0200
User-Agent: KMail/1.9.9
References: <20080901105009.GC24372@buddha.tw.openmoko.com>
In-Reply-To: <20080901105009.GC24372@buddha.tw.openmoko.com>
MIME-Version: 1.0
Message-Id: <200809021547.04425.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.95.97
Subject: Re: bitbake 1.8 badness in using same git for different bb
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
X-List-Received-Date: Tue, 02 Sep 2008 13:49:33 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 01 September 2008 12:50:09 John Lee wrote:

> this can be fixed by the attached patch (created by Holger in
> bitbake-om), but that will reset the local count thus make anyone uses
> the OM repo stop upgrading these packages.

Which brings us to the second patch that needs some work and then merging.

z.


