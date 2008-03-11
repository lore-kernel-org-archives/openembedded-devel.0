Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1JZ1Ws-0002AM-IK
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 11:16:24 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 11 Mar 2008 10:14:20 +0000
	id 00030435.47D65B7C.000036C1
Date: Tue, 11 Mar 2008 10:14:33 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311101433.77a09fd2@cimmeria>
In-Reply-To: <20080311120056.748ec358@widy.localdomain>
References: <200803110807.11368.zecke@selfish.org> <47D64717.3050804@gmail.com>
	<20080311113256.461ad5d1@widy.localdomain>
	<200803111045.12166.zecke@selfish.org>
	<20080311120056.748ec358@widy.localdomain>
X-Mailer: Claws Mail 3.2.0 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 10:16:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Nice, your argumentation is pretty convincing. I just guess that we're
> going to have lots of "I'd love to see branches in OE" votes in this
> thread, and I'd just love to see them treated separately from "I need
> branches", "I'm ok with using branches for my changes", "Branches are
> going to complicate my work, but I might try", and "I hate branches -
> I already barely have time to do real work" votes.
> 

I need branches.

I need to be able to have an openmoko branch which follows .dev closely
but has some stuff that hasnt reached QA level required to allow in
.dev yet.

I probably need the openmoko branch to be only served by the openmoko
servers.

What I don't know is how this works with monotone, and I haven't had
time to sit down with the manual and trial it.

Graeme


