Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KMIBQ-0006TF-Vc
	for openembedded-devel@openembedded.org; Fri, 25 Jul 2008 09:57:49 +0200
Received: (qmail 19562 invoked by uid 813007); 25 Jul 2008 07:56:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Jul 2008 07:56:29 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jul 2008 09:56:39 +0200
User-Agent: KMail/1.10.0 (Linux/2.6.26; KDE/4.1.0; x86_64; ; )
References: <4889169C.7040108@gmx.de> <20080725030222.GC4715@smtp.west.cox.net>
	<d1b08f940807250044k51c6b1f8h9d5f976d83069a54@mail.gmail.com>
In-Reply-To: <d1b08f940807250044k51c6b1f8h9d5f976d83069a54@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200807250956.39492.openembedded@haerwu.biz>
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 07:57:49 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 25 of July 2008 09:44:20 Andrea Adami wrote:
> Thomas,
>
> > I've got a bug and patch (4450) to fix the other instance of this,
> > please use ${KERNEL_OUTPUT} instead.
>
> while you're there please weak-assign too:
>
>  KERNEL_IMAGETYPE ?= "zImage"

Thats default set by kernel.bbclass




