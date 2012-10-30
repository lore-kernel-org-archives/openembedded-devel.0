Received: from host46-141-dynamic.2-87-r.retail.telecomitalia.it
	([87.2.141.46] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gnutoo@no-log.org>) id 1TTAG9-0006Eo-QB
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 12:45:29 +0100
Received: from [192.168.1.121] (helo=gnutoo-desktop)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.76) (envelope-from <gnutoo@no-log.org>)
	id 1TT9bx-0002ni-Kf; Tue, 30 Oct 2012 12:03:57 +0100
Date: Tue, 30 Oct 2012 12:04:28 +0100
From: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121030120428.2400e67b@gnutoo-desktop>
In-Reply-To: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
References: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
X-Mailer: Claws Mail 3.7.9 (GTK+ 2.24.6; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: clarson@kergoth.com
Subject: Re: [meta-browser] Question regarding status of chromium recipes
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
X-List-Received-Date: Tue, 30 Oct 2012 11:45:29 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Oct 2012 11:01:00 -0700
Chris Larson <clarson@kergoth.com> wrote:

> I'm wondering if the chromium recipes in this layer have ever been
> build tested.
I rebuilt from scratch locally the SHR packages and images some days
ago, that included chromium....
And it produced 3 ipk:
chromium_19.0.1049.3-r1_armv7a-vfp-neon.ipk
chromium-dbg_19.0.1049.3-r1_armv7a-vfp-neon.ipk
chromium-dev_19.0.1049.3-r1_armv7a-vfp-neon.ipk

I then installed them with opkg install that fetch it from my local
feed.

I tested a bit youtube in html5 and it worked fine...(I had to create a
non-root account to make chromium start tough).

Patches for fixing the issues you have are welcome.

Denis.


