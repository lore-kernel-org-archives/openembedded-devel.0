Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NUnti-0002iz-Pt
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 22:03:35 +0100
Received: from 88-109-31-216.dynamic.dsl.as9105.com ([88.109.31.216]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NUnrO-0004f2-RB
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 21:01:09 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263304959.18954.38.camel@balakrishnan-desktop>
References: <1263304959.18954.38.camel@balakrishnan-desktop>
Date: Tue, 12 Jan 2010 21:00:45 +0000
Message-ID: <1263330045.457.260.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding PXA270 based Machine....
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
X-List-Received-Date: Tue, 12 Jan 2010 21:03:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-01-12 at 19:32 +0530, balakrishnan wrote:
> I going to add pxa270 based machine with Angstrom distribution
> to OE, regarding this can I have answer of list of my doubts...   
> 
> 1.Whether I can send machine conf ,linux recipes, U-Boot recipes and
> Image recipes are in single patch or separated patch?  

Please send them as separate patches.

> 2.If OE-Dev mailing list accepted my patches then, what is my next step?

If they are accepted then someone will commit them to the repository.
You don't need to take any action.

> 3.If it commited by myself then, what commit rights I have?
> 4.Can I commit with out "Signed-off-by" line?

If you need to ask the question then the answer is that you don't have
any commit access: if you did have direct checkin access to the tree
then you would know about it.

p.




