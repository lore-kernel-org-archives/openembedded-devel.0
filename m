Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LJlVL-0007D0-DT
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 10:12:11 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LJlPR-0001u0-4h for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 17:06:14 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LJlQZ-00061P-Lp
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 17:07:15 +0800
Date: Mon, 5 Jan 2009 17:07:15 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090105090715.GE29421@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20081222100950.GA2135@buddha.tw.openmoko.com>
	<gio04p$i9p$1@ger.gmane.org>
	<20081224043359.GA29421@buddha.tw.openmoko.com>
MIME-Version: 1.0
In-Reply-To: <20081224043359.GA29421@buddha.tw.openmoko.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: Please review john_lee/openmoko-merges again
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
X-List-Received-Date: Mon, 05 Jan 2009 09:12:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 24, 2008 at 12:33:59PM +0800, John Lee wrote:
> On Mon, Dec 22, 2008 at 01:11:05PM +0100, Koen Kooi wrote:
> > On 22-12-08 11:09, John Lee wrote:
> >> Hi,
> >>
> >> I have reduced this to just 5 commits.  Most of them should be okay
> >> except I'm not sure about this one:
> >>
> >> commit 4d6693ebd979092a747a66cb1828b8b4af452b28
> >> Author: Erin Yueh<erin_yueh@openmoko.com>
> >> Date:   Tue Dec 2 13:57:18 2008 +0800
> >>
> >>      obexpush_1.0.0.bb: add opd_args file to append arguments for starting
> >>      opd
> >>
> >> Please review and comment, thank you!
> >
> > I don't think pointing a daemon to a user homedir is acceptable  
> > behaviour, much less pointing it /home/root.
> >
> > Would /var/tmp/obexpush be an acceptable path?
> 
> Branch updated to use /var/obexpush as suggested in other mail.
> Due to the Christmas vacation I will wait until next year to push
> these.  Please review.  :)

Pushed to org.openembedded.dev.  Could someone please delete
john_lee/openmoko-merges ?


- John


