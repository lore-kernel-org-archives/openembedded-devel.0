Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OD25q-0004Qu-AY
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 23:06:51 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OD223-0001LQ-0X
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 22:02:55 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BEDAF6D.5010704@eukrea.com>
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>
	<4BED67FB.1060900@eukrea.com>
	<3D406A77-A498-47BB-A8DD-6BEC7E55D5B6@student.utwente.nl>
	<4BED85C7.8000909@eukrea.com> <hsk1il$v4j$2@dough.gmane.org>
	<4BED8C2F.1080500@eukrea.com>
	<1273866959.4465.5.camel@lenovo.internal.reciva.com>
	<4BEDAF6D.5010704@eukrea.com>
Date: Fri, 14 May 2010 22:02:56 +0100
Message-ID: <1273870976.4465.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
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
X-List-Received-Date: Fri, 14 May 2010 21:06:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-05-14 at 22:15 +0200, Eric B=C3=A9nard wrote:
> So actually the fix I propose is needed as while MACHINE_KERNEL_PR is=20
> not required by policy, module-base.bbclass is broken for machines=20
> without MACHINE_KERNEL_PR.

Yes, agreed.  I think your fix is the right thing.

p.




