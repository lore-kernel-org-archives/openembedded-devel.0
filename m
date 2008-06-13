Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1K7F65-0007MN-Bx
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jun 2008 21:38:18 +0200
Received: from e180141002.adsl.alicedsl.de ([85.180.141.2] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1K7F5r-0002li-R5
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jun 2008 21:37:51 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jun 2008 21:37:50 +0200
User-Agent: KMail/1.9.9
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <87od65rxi8.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Message-Id: <200806132137.51103.zecke@selfish.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 19:38:58 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 13 June 2008 20:38:23 Otavio Salvador wrote:

> I don't know how kernel people do to amend the patch to add the
> acked-by/whatever data into each patch. It can be a big amount of work
> to do an iteractive rebase for every ack given on ml for each patch
> and with a high risk of human mistake while doing it.

For (qt)webkit we have a script to merge a git branch. It is amending the 
commit with such a line. To grab patches from the ML one could use 
git-am/git-apply and then use the script to merge/cherry-pick the changes.

z.


