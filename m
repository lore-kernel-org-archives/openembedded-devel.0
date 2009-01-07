Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LKYvW-00024l-KL
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 14:58:30 +0100
Received: (qmail 11712 invoked by uid 813007); 7 Jan 2009 13:52:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Jan 2009 13:52:25 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Jan 2009 14:52:25 +0100
User-Agent: KMail/1.10.92 (Linux/2.6.28; KDE/4.1.86; x86_64; ; )
References: <200901071345.43987.openembedded@haerwu.biz>
	<4964A7D3.8060205@gefanuc.com>
In-Reply-To: <4964A7D3.8060205@gefanuc.com>
MIME-Version: 1.0
Message-Id: <200901071452.26383.openembedded@haerwu.biz>
Subject: Re: [REVIEW] conf/machine cleanup
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
X-List-Received-Date: Wed, 07 Jan 2009 13:58:30 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 07 of January 2009 14:02:11 Martyn Welch wrote:
> Marcin Juszkiewicz wrote:
> > --- a/conf/machine/include/tune-pentiumpro.inc
> > +++ b/conf/machine/include/tune-pentiumpro.inc
> > @@ -1,4 +1,4 @@
> >  TARGET_CC_ARCH = "-march=pentiumpro"
> >  BASE_PACKAGE_ARCH = "i686"
> >  FEED_ARCH = "i686"
> > -PACKAGE_EXTRA_ARCHS += "i386 i486 i586"
> > +PACKAGE_EXTRA_ARCHS += "x86 i387 i486 i586"
>
> This looks like a typo         ^^^^

indeed, fixed

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




