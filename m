Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9fNq-0006k0-13
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:56:50 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T9fBr-0005Zi-Jj
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:44:27 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 06 Sep 2012 17:44:26 +0100
In-Reply-To: <5048D11C.9050108@communistcode.co.uk>
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
	<5048BF04.2000904@communistcode.co.uk>
	<5048C7D5.70301@communistcode.co.uk>
	<1346947708.2673.201.camel@phil-desktop>
	<5048CC32.30705@communistcode.co.uk>
	<1346948364.2673.203.camel@phil-desktop>
	<5048D11C.9050108@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346949867.2673.204.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 16:56:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-06 at 17:36 +0100, Jack Mitchell wrote:
> One last thing though, should the libtinyxml.so be in the -dbg package?

No, -dev is correct.

I think you're still missing -fpic in C(XX)FLAGS.

p.




