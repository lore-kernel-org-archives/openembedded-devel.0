Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRcRw-00060L-IQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 01:04:38 +0100
Received: by ug-out-1314.google.com with SMTP id i24so4000015ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 16:03:45 -0800 (PST)
Received: by 10.67.21.11 with SMTP id y11mr2336877ugi.10.1203465825358;
	Tue, 19 Feb 2008 16:03:45 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id j33sm2710584ugc.63.2008.02.19.16.03.43
	(version=SSLv3 cipher=OTHER); Tue, 19 Feb 2008 16:03:44 -0800 (PST)
Date: Wed, 20 Feb 2008 02:04:18 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Paul Sokolovsky <pmiscml@gmail.com>
Message-ID: <20080220020418.1e4dda5a@widy.localdomain>
In-Reply-To: <20080220015817.1e33f547@widy.localdomain>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>
	<20080220015817.1e33f547@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.172
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev - Ignore false toggle signals (work-around for OE#3390).
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
X-List-Received-Date: Wed, 20 Feb 2008 00:04:38 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 20 Feb 2008 01:58:17 +0200
Paul Sokolovsky <pmiscml@gmail.com> wrote:

> Hello,
> 
> On Wed, 20 Feb 2008 00:16:17 +0100
> "utx commit" <openembedded-commits@lists.openembedded.org> wrote:
> 
> > - Ignore false toggle signals (work-around for OE#3390).
> > - Fixed default ALSA state for SL-Cxx00 (OE#2617).
> > - Do not alter incorrect mixer levels by zaurus-mixer-callback.
> > - Allow to disable rotation by touch ~/.norot.
> > - Fixed detection of panel_user.
> > 
> > Author: utx@openembedded.org
> 
> Stanislav, congratulations on getting commit access to OE! There're
> few guidelines for developers at
> http://www.openembedded.org/wiki/Policies . In particular, adhering to
> http://www.openembedded.org/wiki/CommitPolicy allows for easy peer
> review and per-package commit search.

P.S.
More formal and detailed description of commit message format:
http://www.openembedded.org/wiki/MonotonePhraseBook , section 
"Committing". I happen to to not have login for that wiki, so cannot
consolidate that info, but someone should do that.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


