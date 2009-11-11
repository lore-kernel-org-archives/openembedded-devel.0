Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8H2x-0000DQ-JF
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 18:31:58 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8H1j-0008CI-42
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:30:39 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091111161608.GA3246@denix.org>
References: <4AF963A3.1050906@balister.org>
	<20091110131554.GA25450@denix.org> <4AF996BE.2080904@balister.org>
	<20091111161608.GA3246@denix.org>
Date: Wed, 11 Nov 2009 17:30:36 +0000
Message-ID: <1257960636.25369.404.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mailing lists
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
X-List-Received-Date: Wed, 11 Nov 2009 17:31:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 11:16 -0500, Denys Dmytriyenko wrote:
> On Tue, Nov 10, 2009 at 11:37:18AM -0500, Philip Balister wrote:
> > On 11/10/2009 08:15 AM, Denys Dmytriyenko wrote:
> >> On Tue, Nov 10, 2009 at 12:59:15PM +0000, Philip Balister wrote:
> >>> We have made some changes to DNS to try and sort out the oe.org versus
> >>> www.oe.org issue (and a few other nits). If the mailing list stops 
> >>> working,
> >>> send me an email direct and we will try and get things going again ASAP. 
> >>> I
> >>> think we have the correct DNS incantation this time.
> >>
> >> Ah, nice! Thanks. Have you added rewrite rules in exim to avoid 
> >> duplication of
> >> mails sent to lists.oe.org vs oe.org? Let me try it with this email... :)
> >
> > It will take some time for this to take effect and for us to fix anything 
> > that needs fixing :)
> >
> > I still do not see the DNS change. Dotster is low to copy updates made on 
> > their website to actual DNS.
> 
> DNS seems to work fine, but it still takes hours to bounce an email...

This particular mail of yours was delayed for an hour due to
greylisting; this happens the first time you try to send mail to the
list from a particular host (vms173001.mailsrvcs.net in this case).  I
haven't seen any instances recently of mail taking any more than that,
and for folks who aren't greylisted it should only be a minute or two.

If you are routinely seeing round-trip times of "hours", please send me
a copy of the headers for one of the offending messages and I will take
a look at it.

p.




