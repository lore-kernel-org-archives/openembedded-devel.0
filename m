Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q2LDV-0007rb-If
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 11:23:05 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q2LBk-00082Q-Uw
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 11:21:17 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110322173047.GA10685@rhein.zuhause.netz>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
	<20110322171954.GA22283@sakrah.homelinux.org>
	<20110322173047.GA10685@rhein.zuhause.netz>
Date: Wed, 23 Mar 2011 10:21:50 +0000
Message-ID: <1300875710.2228.117.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Wed, 23 Mar 2011 10:23:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-22 at 18:30 +0100, Henning Heinold wrote:
> but how do you will filter it? We have no versions dep in bitbake.

You could arrange for gcc-cross 4.5 (and later) to PROVIDE
virtual/atomic-ops or some such.

p.




