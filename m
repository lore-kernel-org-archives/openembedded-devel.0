Received: from [209.85.128.185] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZZL1-0005jr-Mg
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 23:22:23 +0100
Received: by fk-out-0910.google.com with SMTP id 18so3579099fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 15:20:14 -0700 (PDT)
Received: by 10.78.195.10 with SMTP id s10mr23849590huf.10.1205360413577;
	Wed, 12 Mar 2008 15:20:13 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id u26sm16239634mug.17.2008.03.12.15.20.10
	(version=SSLv3 cipher=OTHER); Wed, 12 Mar 2008 15:20:12 -0700 (PDT)
Date: Thu, 13 Mar 2008 00:21:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313002145.17479f07@widy.localdomain>
In-Reply-To: <1138.1205359393@dls.net>
References: <1138.1205359393@dls.net>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.185
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 22:22:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 17:03:13 -0500
Mike Westerhof <mwester@dls.net> wrote:

>  On Wed 12/03/08  4:40 PM , Paul Sokolovsky pmiscml@gmail.com sent:
> ...
> > With mtn we seem to have very cheap and robust mirroring and
> > high-availability. Well, any DSCM lean on possibility of easy
> > mirroring, but Monotone with its super-cool concept of unbelievably
> > cheap branches (so-called heads), ...
> 
> Hehe! Yes, and I could describe an automobile spinning out-of-control
> on a patch of ice as "unbelievably cheap steering" just as well.
> Let's not overlook the fact that the multiple-heads issue with
> monotone is very seldom because the person doing it *wished* for that
> to happen.

Vice-versa, as was noted already, we have separate head created
almost on each commit (i.e. mtn merge almost always has something to
do on each run after commit). So, can one imagine more lightweight
branches - they are being created even without any explicit command!
Poor git is left far behind with its heavy branch commands! ;-D

> 
> > 
> > -- 
> > Best regards,
> > Paul                          pmiscml@gma
> > il.com
> 
> Mike (mwester)

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


