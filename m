Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LQmhK-0004ao-Sa
	for openembedded-devel@openembedded.org; Sat, 24 Jan 2009 18:53:35 +0100
Received: (qmail 20116 invoked by uid 813007); 24 Jan 2009 17:46:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 Jan 2009 17:46:14 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jan 2009 18:45:44 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
References: <4976D10A.9050000@gmx.net> <497B1685.20504@gmail.com>
	<glf66f$p9u$1@ger.gmane.org>
In-Reply-To: <glf66f$p9u$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200901241845.44831.openembedded@haerwu.biz>
Subject: Re: FOSDEM OE stand
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
X-List-Received-Date: Sat, 24 Jan 2009 17:53:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 24 of January 2009 14:47:58 Koen Kooi wrote:
> On 24-01-09 14:24, Marco Cavallini wrote:
> > Florian Boor ha scritto:
> >> Just apart from the fact that I'd like to
> >> see some other architectures than ARM at our stand.
> > What about this Vortex86SX ?

> > If someone could help me creating a configuration for this machine,
> > we could show it FOSDEM OE stand :-)

> Try making a copy of qemux86.conf, that builds and works.

Vortex86sx is i486 based non-FPU device so rather base on x86 + proper 
kernel config.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




