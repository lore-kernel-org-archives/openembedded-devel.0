Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KfrVu-0005kv-Hj; Wed, 17 Sep 2008 09:31:50 +0200
Received: from ip-89-168-141-231.cust.homechoice.net ([89.168.141.231]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KfrS5-00077K-K0; Wed, 17 Sep 2008 08:27:54 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080916171910.GL29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<20080914235938.GH29676@smtp.west.cox.net>
	<1221469471.24620.7.camel@mill.internal.reciva.com>
	<20080916002127.GK29676@smtp.west.cox.net>
	<1221580166.24620.59.camel@mill.internal.reciva.com>
	<20080916171910.GL29676@smtp.west.cox.net>
Date: Wed, 17 Sep 2008 08:27:52 +0100
Message-Id: <1221636472.4641.334.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Wed, 17 Sep 2008 07:31:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-09-16 at 10:19 -0700, Tom Rini wrote:
> OK, done.  Checked with zeroconf and we can get away with not expanding
> rdepends in that case.
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>
> 
> #
> # old_revision [4ac14ced8bc6330634ea2b24a201a4f6a556ef24]
> #
> # patch "classes/package.bbclass"
> #  from [6f3deeb912b24b09204110bd00e94e30f64d3936]
> #    to [0255f64eac991d83a518c70b907131f1d30bfc58]

OK, great.  This patch looks fine.  I think you can go ahead and check
that in.

p.




