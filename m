Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JCuxG-0007sL-An
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2008 11:48:11 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1JCvMD-0007Dr-9S; Thu, 10 Jan 2008 12:13:57 +0100
Message-ID: <4785F7D7.7030506@kernelconcepts.de>
Date: Thu, 10 Jan 2008 11:47:51 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <1824361960.20080106235611@gmail.com>	<47825896.7030301@kernelconcepts.de>	<1133928457.20080108163429@gmail.com>	<1199810941.6053.50.camel@localhost.localdomain>
	<456018236.20080110111917@gmail.com>
In-Reply-To: <456018236.20080110111917@gmail.com>
X-Enigmail-Version: 0.95.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Thu, 10 Jan 2008 10:48:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Paul Sokolovsky schrieb:
>   Well, not much joy here. Here's screenshot (as installed under
> Angstrom, I'm sorry beforehand if Poky is different):
> http://linuxtogo.org/gowiki/PaulSokolovsky?action=AttachFile&do=view&target=Poky-smallscreen.png
> 
>   So, what we see is that the design of the dialog is changed,
> simplifying it to just a file list, parent dir button, and buttons for
> mounted filesystems (same icons appeared in Angstrom image). There're
> still "desktop" gaps and dialog sizing (3/4 of screen width, no resize
> with matchbox).

The screenshot pretty much indicates that the default Gnome spacing wastes too
much of space and looks ugly on these small screens. In fact I would make this
window fullscreen on such a small screen. This dialog style does not make much
of sense and only reduces usability. Just keep in mind that a file selector is
usually a window that displays a lot of information at one time and needs all
the space it can get.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


