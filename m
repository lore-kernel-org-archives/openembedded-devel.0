Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KNsv9-0001wP-Nf
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jul 2008 19:23:36 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 17D898BBD4F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 14:21:57 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 6FB1E1BAFB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 14:21:56 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 29 Jul 2008 14:21:56 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 5E9DDC0DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 11:22:03 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 1545061006A; Tue, 29 Jul 2008 14:21:19 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<g6naum$ure$1@ger.gmane.org>
	<87abg0ej9q.fsf@neumann.lab.ossystems.com.br>
	<20080729170055.GC2795@smtp.west.cox.net>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 29 Jul 2008 14:21:19 -0300
In-Reply-To: <20080729170055.GC2795@smtp.west.cox.net> (Tom Rini's message of
	"Tue\, 29 Jul 2008 10\:00\:55 -0700")
Message-ID: <87r69cbo8g.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 17:23:36 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <trini@kernel.crashing.org> writes:

> On Tue, Jul 29, 2008 at 01:40:17PM -0300, Otavio Salvador wrote:
>> Rolf Leggewie <no2spam@nospam.arcornews.de> writes:
>> 
>> > Hi Richard,
>> >
>> > thank you for the update.
>> >
>> > Richard Purdie wrote:
>> >> There is also the issue of commit ID naming. I'm tempted to propose we
>> >> use commit IDs with a domain such as userid@developers.openembedded.org.
>> >
>> > I think something under openembedded.org is a good idea for several
>> > reasons.  But how about userid@dev.openembedded.org?
>> 
>> I disagree. Using real mail address give a real view of who can be
>> sponsoring work and using OE.  
>
> One of the big problems there is what happens when developer X stops
> doing stuff for company Y?  Or does something on their own? Submission /
> Signed-off/Ack'ed by, that's fine.  But for commit work I think it's
> best that it's always the same and a can made functional email.

For maintainers, I think we could have a MAINTAINERS file as is
available on Linux sources. This allows for a cannonical place for
look at.

When someone stops to work for company Y the credit should still go to
the sponsoring of the company since this doesn't changes who paid the
work.

Besides that, forcing all commits to be done from a "cannonical mail
domain" will enforce a difficult to follow policy and turn problematic
the merging of ordinary trees with fixes.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


