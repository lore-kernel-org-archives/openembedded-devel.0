Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JBvIr-0005H1-MB
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2008 17:58:21 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JBvav-0006du-1C
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2008 18:17:01 +0100
Message-ID: <47825896.7030301@kernelconcepts.de>
Date: Mon, 07 Jan 2008 17:51:34 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1824361960.20080106235611@gmail.com>
In-Reply-To: <1824361960.20080106235611@gmail.com>
X-Enigmail-Version: 0.95.0
Subject: Re: [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Mon, 07 Jan 2008 16:58:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Paul Sokolovsky schrieb:
>   I've prepared a patch to make GtkFileChooser, a
> contemporary gtk's file open/save widget, to suite small, PDA-like
> screens (including QVGA) better.

>   The patch is available at
> http://bugs.openembedded.org/show_bug.cgi?id=3634 , with extensive
> description at
> http://pfalcon-oe.blogspot.com/2008/01/smallscreen-mod-for-gtkfilechooser.html

Looks pretty good. I like the patch because it is not that intrusive.
If you could make all changes depend on the screen size it would be worth trying
to get it upstream. This might save us a lot of work in future.

> . I'm glad I've written it in high detail, because Koen quickly
> pointed me to similar patches in Poky:
> 
> http://svn.o-hand.com/view/poky?rev=3408&view=rev
> http://svn.o-hand.com/view/poky?rev=2596&view=rev
> 
>   I didn't try them, but they appear to make more invasive changes to
> gtk+, though apparently add more features (for good, bad, or for
> vendor's requirements).

Do we have a screenshot around to see how it looks? :)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


