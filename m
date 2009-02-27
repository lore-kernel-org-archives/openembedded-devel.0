Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1Ld6NE-0006xo-Ty
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 18:19:45 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.103]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1Ld6Je-0000e9-Gk
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Feb 2009 01:16:13 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1235751616.6800.1063.camel@alap>
References: <1235751616.6800.1063.camel@alap>
Date: Fri, 27 Feb 2009 10:15:53 -0700
Message-Id: <1235754953.6800.1077.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: Git phrase book
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
X-List-Received-Date: Fri, 27 Feb 2009 17:19:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-02-27 at 09:20 -0700, Angus Ainslie wrote:
> Hi,
> 
> I'm try to push a change onto the FSO 5.5 branch and was following
> through the git phrase book
> 
>  http://wiki.openembedded.net/index.php/GitPhraseBook
> 
> under feature branches it has an example of pushing the branch back to
> the server 
> 
> http://wiki.openembedded.net/index.php/GitPhraseBook#Feature_branches
> 
> When I try that it doesn't work
> 
> angus@builder:/usr/src/openmoko/openembedded$ git push origin fso/milestone5.5
> fatal: The remote end hung up unexpectedly
> 
> Thanks
> Angus
> 


Solved, I had a readonly checkout.

Angus



