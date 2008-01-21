Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JGvX4-00058y-2u
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2008 13:13:42 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1JGvxK-0007Qx-NG; Mon, 21 Jan 2008 13:40:50 +0100
Message-ID: <47948C77.9070300@kernelconcepts.de>
Date: Mon, 21 Jan 2008 13:13:43 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: Canadian Doctor Lou <openembedded-devel@lists.openembedded.org>
References: <15810137585.20080121005051@gmail.com>
In-Reply-To: <15810137585.20080121005051@gmail.com>
X-Enigmail-Version: 0.95.0
Cc: gpe-list@linuxtogo.org
Subject: Re: [Gpe-list] [RFC] Making libmimedir-0.4.2 default in OE
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
X-List-Received-Date: Mon, 21 Jan 2008 12:13:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Paul Sokolovsky schrieb:
>   Currently, libmimedir-0.3.1 is marked DEFAULT_PREFERENCE = "1". That
> version of the lib has at least 2 serious bugs:

how did that happen? I can't imagine that this would be a good idea.

>   So, I'd like to propose to remove mentioned DEFAULT_PREFERENCE and
> make other steps as needed to make 0.4.2 the default version.

I agree, that can't be wrong :-)

> 2. There appears to be (at least) two libmimedir's, another one is
> http://sourceforge.net/projects/libmimedir/ (at 0.5, versions up to
> 0.4 were part of synce project). Debian names package for the lib in
> question "libmimedir-gnome", we may want to disambiguate too.
> http://packages.qa.debian.org/libm/libmimedir-gnome.html

Yes we should follow Debian here. I don't know if the synce one is relevant in
any way but it might be better to change the name of the package to be safe.

Greetings

Florian


-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


