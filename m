Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NnKa0-0007VA-Dc
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 00:35:46 +0100
Received: from 88-108-113-12.dynamic.dsl.as9105.com ([88.108.113.12]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NnKX4-0006m8-Lh
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 23:32:45 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201003042313.03528.holger+oe@freyther.de>
References: <201003042313.03528.holger+oe@freyther.de>
Date: Thu, 04 Mar 2010 23:32:22 +0000
Message-ID: <1267745542.5437.1881.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Removal of gpdf from the repository
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
X-List-Received-Date: Thu, 04 Mar 2010 23:35:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-03-04 at 23:13 +0100, Holger Hans Peter Freyther wrote:
> I would like to remove recipes/gpdf from the OpenEmbedded repository and also 
> the checksums entries. The reason is simple. gpdf contains a copy of the xpdf 
> sourcecode which had various security issues since the release of gpdf 2.10 in 
> 2007.
> 
> Do I get an ack on the removal of it?

Sounds OK to me, so long as you also remove it from the GPE image
recipes at the same time.  I guess anybody who wants gpdf functionality
nowadays is probably using evince.

p.




