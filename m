Received: from [217.116.0.60] (helo=correo13.acens.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <joaquinduran@adtelecom.es>) id 1JCy4z-0006Um-V0
	for openembedded-devel@openembedded.org; Thu, 10 Jan 2008 15:08:23 +0100
Received: (qmail 31255 invoked from network); 10 Jan 2008 13:41:34 -0000
Received: from unknown (HELO [194.179.62.51])
	(joaquinduran.adtelecom.es@[217.125.169.184])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by correo13.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	10 Jan 2008 13:41:34 -0000
Message-ID: <47862D3B.5050207@adtelecom.es>
Date: Thu, 10 Jan 2008 15:35:39 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.9 (X11/20071116)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1824361960.20080106235611@gmail.com>	<47825896.7030301@kernelconcepts.de>	<1133928457.20080108163429@gmail.com>	<1199810941.6053.50.camel@localhost.localdomain>	<456018236.20080110111917@gmail.com>	<4785F7D7.7030506@kernelconcepts.de>	<4786102C.7040703@adtelecom.es>
	<47860F56.7050205@kernelconcepts.de>
In-Reply-To: <47860F56.7050205@kernelconcepts.de>
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
X-List-Received-Date: Thu, 10 Jan 2008 14:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

En/na Florian Boor ha escrit:
> Hi,
> 
> Joaquim Duran schrieb:
>> Is it possible only apply the patch if GUI_MACHINE_CLASS = "smallscreen"
>> is set?
> 
> in theory yes, but that makes your GTK package specific for each device. It
> would be better if the screen size is checked at runtime. Ideally GTK would do
> this once and adjust spacing definitions that can be used by GTK implementation
> and applications. libgpewidget does it in this way too.
> 
> Greetings
> 
> Florian
> 

OK, I see.

Joaquim Duran



