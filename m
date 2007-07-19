Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IBZix-0005Wg-6E
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2007 19:23:35 +0200
Received: by ug-out-1314.google.com with SMTP id i24so473358ugd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2007 10:22:53 -0700 (PDT)
Received: by 10.82.126.5 with SMTP id y5mr3575024buc.1184865773493;
	Thu, 19 Jul 2007 10:22:53 -0700 (PDT)
Received: from ?192.168.20.110? ( [77.122.179.115])
	by mx.google.com with ESMTPS id h1sm2210707nfh.2007.07.19.10.22.51
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2007 10:22:52 -0700 (PDT)
Date: Thu, 19 Jul 2007 20:22:50 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <606544311.20070719202250@gmail.com>
To: Rob Kramer <robk@starhub.net.sg>
In-Reply-To: <f7nvum$kaj$1@sea.gmane.org>
References: <f7kde4$rum$1@sea.gmane.org> <f7nvum$kaj$1@sea.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Packaging problem.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2007 17:23:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rob,

Thursday, July 19, 2007, 6:28:15 PM, you wrote:

> Or more succinctly put:

> --------
BB>>> peek base-passwd FILES_base-passwd
> None
BB>>> peek base-passwd FILES_base-passwd-doc
>  /usr/share/doc
> --------

> It seems all my packages are incompletely packaged or missing due to this.
> What could cause the FILES_${PN} from bitbake.conf to be unset?

  Whatever it is, you at least know good "workaround" (depends, I'd
assume that interactive mode is actually internal debugging/workaround
mode) - use bitbake from command line.

  As for issue, suggested is to submit bugreport with all the details
you had in the last mail.

> Cheers,

>     Rob


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



