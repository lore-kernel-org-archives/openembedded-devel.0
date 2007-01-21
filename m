Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H8YgH-0000qM-0Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jan 2007 10:08:05 +0100
Received: (qmail invoked by alias); 21 Jan 2007 09:08:04 -0000
Received: from c-134-232-84.f.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.232.84]
	by mail.gmx.net (mp054) with SMTP; 21 Jan 2007 10:08:04 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H8Ybr-00046u-00; Sun, 21 Jan 2007 10:03:31 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0701201646v68ef3fcevf0f6905fd46b6a13@mail.gmail.com>
References: <c384c5ea0701201646v68ef3fcevf0f6905fd46b6a13@mail.gmail.com>
Date: Sun, 21 Jan 2007 10:03:31 +0100
Message-Id: <1169370211.4172.7.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Interest for x86_64 target?
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
X-List-Received-Date: Sun, 21 Jan 2007 09:08:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-01-21 at 01:46 +0100, Leon Woestenberg wrote:
> any of the OE devs interested in adding x86_64 target support?
>
> I am, but I cannot pull this off alone due to time restrictions.
> However, if there is a group of ppl willing to go forward on this, I
> am in.

FYI, if you search the list for "cross-compiling for x86_64" you will
find a thread about my building an SDK for x86_64. It required some
patches, recorded under [1]. The scope was pretty limited though (I only
need the EDS-DBus libs).

[1] http://bugs.openembedded.org/show_bug.cgi?id=1728

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


