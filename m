Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q5E3m-0007SU-Vk
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:20:59 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q5E1t-0001oQ-6t
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:19:01 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <imvq1h$8hl$2@dough.gmane.org>
References: <AANLkTi=r1KzyDtTfZ74f0ZhJVpo=cTZV5n_azfAKQEHt@mail.gmail.com>
	<imvq1h$8hl$2@dough.gmane.org>
Date: Thu, 31 Mar 2011 10:19:09 +0100
Message-ID: <1301563149.14449.52.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/6] Add support for the Technologic Systems TS7500 ARM SBCs
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
X-List-Received-Date: Thu, 31 Mar 2011 09:20:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-30 at 19:42 +0200, Koen Kooi wrote:
> On 30-03-11 18:40, R.T. McGee wrote:
> > Its true, the FA526 is not a ARM920T but it's a bit different from other
> > standard ARMv4 types.
> > 
> > Comments about the FA526 and ARM920T similarity are based on work like this:
> > http://openocd.sourcearchive.com/lines/0.3.1/fa526_8c-source.html
> > This are not from the perspective of the instruction set, but it more or
> > less talking about hardware features.
> 
> So it's more like a ARM920?

It's sort of like an ARM920 might perhaps be if such a thing existed,
yeah, but even then it probably wouldn't be an exact equivalent.  The
original description of "resembles ARM920T without Thumb" sounds like
it's about as good as it's going to get in terms of drawing an analogy
between the ARM cores and the Faraday ones.

p.




