Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1KnsJP-00046C-Gw
	for openembedded-devel@openembedded.org; Thu, 09 Oct 2008 12:00:05 +0200
Received: (qmail 21609 invoked from network); 9 Oct 2008 11:54:58 +0200
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 9 Oct 2008 11:54:58 +0200
Received: (qmail 16804 invoked by uid 9804); 9 Oct 2008 11:54:58 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 9 Oct 2008 11:54:14 +0200
Received: (qmail 16646 invoked by uid 9804); 9 Oct 2008 11:54:14 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 9 Oct 2008 11:54:14 +0200
Received: (qmail 14531 invoked from network); 9 Oct 2008 11:54:14 +0200
Received: from omsk.mi.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	9 Oct 2008 09:54:14 -0000
Received: from heinold by omsk.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1KnsDl-0002rh-DY
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Oct 2008 11:54:13 +0200
Date: Thu, 9 Oct 2008 11:54:13 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081009095412.GA11002@mi.fu-berlin.de>
References: <20081008233816.7410A189322@amethyst.openembedded.net>
	<1223538745.4714.27.camel@ip6-localhost>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[16650](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <1223538745.4714.27.camel@ip6-localhost>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: [oe-commits] : gettext.bbclass: make it simpler to understand
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
X-List-Received-Date: Thu, 09 Oct 2008 10:00:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 09, 2008 at 03:52:25PM +0800, Michael 'Mickey' Lauer wrote:
> Am Donnerstag, den 09.10.2008, 01:38 +0200 schrieb OE GIT Trial:
> > Module: org.openembedded.dev.git
> > Branch: org.openembedded.dev
> > Commit: 80bdb16c9dbefb4d06fe1e1d714ba042c833b92f
> > URL:    http://gitweb.openembedded.net/?p=org.openembedded.dev.git&a=commit;h=80bdb16c9dbefb4d06fe1e1d714ba042c833b92f
> > 
> > Author:  <woglinde2@openembedded.org>
> > Date:   Wed Oct  8 22:06:39 2008 +0000
> > 
> > gettext.bbclass: make it simpler to understand
> > * set the deps for package which can use NLS stuff
> > * filter the deps out if NLS is not requested
> 
> I have just reverted this commit as it lead to a dependency loop here
> rendering everything unbuildable.
> 
> Can you please recheck?
> 
> :M:
> 


I can not check with out your configuration.

Bye Henning
-- 
IBM Certified Specialist - eserver i5 iSeries Technical Solutions Designer V5R3


