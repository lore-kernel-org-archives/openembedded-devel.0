Received: from [217.116.0.34] (helo=correo2.acens.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <joaquinduran@adtelecom.es>) id 1JCw90-0005E1-H7
	for openembedded-devel@openembedded.org; Thu, 10 Jan 2008 13:04:22 +0100
Received: (qmail 1984 invoked from network); 10 Jan 2008 11:37:35 -0000
Received: from unknown (HELO [194.179.62.51])
	(joaquinduran.adtelecom.es@[217.125.169.184])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by correo2.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	10 Jan 2008 11:37:35 -0000
Message-ID: <4786102C.7040703@adtelecom.es>
Date: Thu, 10 Jan 2008 13:31:40 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.9 (X11/20071116)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1824361960.20080106235611@gmail.com>	<47825896.7030301@kernelconcepts.de>	<1133928457.20080108163429@gmail.com>	<1199810941.6053.50.camel@localhost.localdomain>	<456018236.20080110111917@gmail.com>
	<4785F7D7.7030506@kernelconcepts.de>
In-Reply-To: <4785F7D7.7030506@kernelconcepts.de>
Cc: angstrom-distro-devel@linuxtogo.org
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
X-List-Received-Date: Thu, 10 Jan 2008 12:04:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

En/na Florian Boor ha escrit:
> Hi,
> 
> Paul Sokolovsky schrieb:
>>   Well, not much joy here. Here's screenshot (as installed under
>> Angstrom, I'm sorry beforehand if Poky is different):
>> http://linuxtogo.org/gowiki/PaulSokolovsky?action=AttachFile&do=view&target=Poky-smallscreen.png
>>
>>   So, what we see is that the design of the dialog is changed,
>> simplifying it to just a file list, parent dir button, and buttons for
>> mounted filesystems (same icons appeared in Angstrom image). There're
>> still "desktop" gaps and dialog sizing (3/4 of screen width, no resize
>> with matchbox).
> 
> The screenshot pretty much indicates that the default Gnome spacing wastes too
> much of space and looks ugly on these small screens. In fact I would make this
> window fullscreen on such a small screen. This dialog style does not make much
> of sense and only reduces usability. Just keep in mind that a file selector is
> usually a window that displays a lot of information at one time and needs all
> the space it can get.
> 
> Greetings
> 
> Florian
> 

Is it possible only apply the patch if GUI_MACHINE_CLASS = "smallscreen"
is set?

Thanks and Best Regards,
Joaquim Duran


