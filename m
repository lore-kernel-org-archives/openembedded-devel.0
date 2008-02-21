Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSACJ-0000R1-Ph
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 13:07:00 +0100
Received: by fk-out-0910.google.com with SMTP id 18so7856fks.12
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 04:06:40 -0800 (PST)
Received: by 10.82.187.2 with SMTP id k2mr18411616buf.16.1203595599851;
	Thu, 21 Feb 2008 04:06:39 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id z33sm1122702ikz.0.2008.02.21.04.06.37
	(version=SSLv3 cipher=OTHER); Thu, 21 Feb 2008 04:06:38 -0800 (PST)
Date: Thu, 21 Feb 2008 14:08:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080221140821.6c5ec794@widy.localdomain>
In-Reply-To: <fpjo00$218$1@ger.gmane.org>
References: <fb8538570802200452r5d4360f2ld6330218f4c5c0b6@mail.gmail.com>
	<20080220213121.69007f37@widy.localdomain>
	<1203591205.6860.103.camel@hammer.suse.cz>
	<20080221131810.2f58c40e@widy.localdomain>
	<fpjo00$218$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.189
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: no2spam@nospam.arcornews.de, openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] Best place to send new/updated bb files?
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
X-List-Received-Date: Thu, 21 Feb 2008 12:07:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 21 Feb 2008 12:40:48 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Paul Sokolovsky wrote:
> >> Simple search shows 50 potential open bugs with new recipes:
> >> http://bugs.openembedded.org/buglist.cgi?query_format=advanced&short_desc_type=allwordssubstr&short_desc=&long_desc_type=substring&long_desc=&bug_file_loc_type=allwordssubstr&bug_file_loc=&keywords_type=allwords&keywords=&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&emailassigned_to1=1&emailtype1=substring&email1=&emailassigned_to2=1&emailreporter2=1&emailcc2=1&emailtype2=substring&email2=&bugidtype=include&bug_id=&votes=&chfieldfrom=&chfieldto=Now&chfieldvalue=&cmdtype=doit&order=Reuse+same+sort+as+last+time&field0-0-0=attachments.filename&type0-0-0=substring&value0-0-0=.bb
> 
> > We even have http://bugs.openembedded.net/show_bug.cgi?id=2194 ,
> > maintained by Rolf.
> 
> Thanks for bringing that up.  I'd like to see more core devs pay

Like that, except not "core devs", but just "devs". If OE must depend
on core devs for each sneeze, then it's feet-tied. Core devs should
work on general problems and rules for OE, not on mundane recipes.

> attention to 2194 which is essentially the bug "I reviewed it, it
> contains a patch or request for change in unmistakable terms, but it
> touches something I don't understand and might have too far-reaching
> implication for me to dare and commit it" - triaged.  IOW, it needs
> more experienced people to actually commit or reject the bug.
> 
> The bug with the new or updated bb files is 2228, not 2194.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


