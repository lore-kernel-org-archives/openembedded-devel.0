Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1S8GOJ-0003YM-Ho
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 20:31:15 +0100
Received: from trisquel.localnet (188.10.102.36) by smtp203.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5E2303CA0E01; Thu, 15 Mar 2012 20:16:55 +0100
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Mar 2012 20:16:54 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-13-generic; KDE/4.6.5; x86_64; ; )
References: <CALbNGRR-jB0_h6u-g6KswZAQkfwUVmK4V=U_OL=GbLF3UWB1gw@mail.gmail.com>
	<CALbNGRTQNbk7JR0fu1iwxZN=brys-uOvKc3jZLdfMUBvW6Z8Ew@mail.gmail.com>
In-Reply-To: <CALbNGRTQNbk7JR0fu1iwxZN=brys-uOvKc3jZLdfMUBvW6Z8Ew@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201203152016.54415.GNUtoo@no-log.org>
Subject: Re: libertas seems broken since udev 180
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
X-List-Received-Date: Thu, 15 Mar 2012 19:31:15 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

hi,

I've the same problem:
[  267.110534] libertas: command 0x0000 timed out
[  267.115142] libertas: Timeout submitting command 0x0000

And I remember seeing something on linux-wireless mailing list about udev 
changing when the firmware has to be loaded, which resulted in changing all 
the drivers to acomodate udev, but I don't remember the details...

Denis.


