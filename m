Received: from [209.85.134.184] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZa5v-0006cK-9k
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 00:10:51 +0100
Received: by mu-out-0910.google.com with SMTP id w9so3345419mue.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 16:08:41 -0700 (PDT)
Received: by 10.78.172.20 with SMTP id u20mr23719904hue.12.1205363321045;
	Wed, 12 Mar 2008 16:08:41 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id e8sm768425muf.8.2008.03.12.16.08.37
	(version=SSLv3 cipher=OTHER); Wed, 12 Mar 2008 16:08:39 -0700 (PDT)
Date: Thu, 13 Mar 2008 01:10:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313011002.215206d7@widy.localdomain>
In-Reply-To: <1718.1205362131@dls.net>
References: <1718.1205362131@dls.net>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.134.184
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
X-List-Received-Date: Wed, 12 Mar 2008 23:10:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 17:48:51 -0500
Mike Westerhof <mwester@dls.net> wrote:

[]

> I think this has gotten to the point where the arguments is for the
> sake of arguing, and little else.  

Maybe, and on git's side, there's surprisingly little variety of
arguments - 1) "it has lightweight branches" (hg has too, as was pointed
out, but as plugin (which is good) of experimental state (with
obvious entailments)); 2) "I use git, and it works well for me" - it's
hard to respond without calling CVS ghost; 3) "Don't make people learn
more stuff" - and nobody appears to care about people who *don't* know
git - there're still more such potential OE users - is it fair to force
them to learn its quirks, or leave out people who don't want to learn
quirks?

> I'm surprised that it hasn't been
> mentioned that "hg" has the advantage that its name is only two
> characters, a 33% savings in overhead compared to most other scm
> tools we've discussed.

Actually, there's almost noone argues for hg too insistently. Mostly,
there're calls to think better about git.

> So, who makes this decision, and what's the timeframe?

Apparently, core team? Original proposal named end of month?

> 
> Mike  (mwester)
> 
> Oh - btw, lightweight branching implies working, reliable tools to
> identify diffs and merge them, that's the part that really needs to
> be considered rather than how easy it is to just create a branch.

Aha, good. But not only that. We really should think are lightweight
branches so useful for OE, and do they really fit well into *our*
*current* infrastructure.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


