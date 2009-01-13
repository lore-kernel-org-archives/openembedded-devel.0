Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LMoQ1-0007U1-Jx
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 19:55:17 +0100
Received: (qmail 11328 invoked by uid 813007); 13 Jan 2009 18:48:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Jan 2009 18:48:45 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2009 19:48:28 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
References: <200901071345.43987.openembedded@haerwu.biz>
In-Reply-To: <200901071345.43987.openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200901131948.29894.openembedded@haerwu.biz>
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
X-List-Received-Date: Tue, 13 Jan 2009 18:55:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 07 of January 2009 13:45:43 Marcin Juszkiewicz wrote:

> I made cleanup in conf/machine directory today. All duplicates in
> EXTRA_PACKAGE_ARCHS are removed now. I moved EXTRA_PACKAGES_ARCHS to
> include/tune-* files (PPC and x86 targets), dropped it for ARM
> targets (as tune-arm* files have them defined properly).

Did someone tested that?

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




