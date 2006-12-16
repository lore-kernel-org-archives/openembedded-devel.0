Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <robert@linuxdevelopment.de>) id 1GvaTH-0008PF-W9
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Dec 2006 15:25:04 +0100
Received: from [85.212.137.120] (helo=[10.0.0.4])
	by mrelayeu.kundenserver.de (node=mrelayeu1) with ESMTP (Nemesis),
	id 0MKwpI-1GvaRN3Vrl-0006gs; Sat, 16 Dec 2006 15:23:06 +0100
Message-ID: <4584015A.2000502@linuxdevelopment.de>
Date: Sat, 16 Dec 2006 15:23:22 +0100
From: Robert Woerle <robert@linuxdevelopment.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de-AT; rv:1.7.13) Gecko/20060411
X-Accept-Language: de, en
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <456B0DC2.90300@dominion.kabel.utwente.nl>	<45780B2E.4020906@dominion.kabel.utwente.nl>	<1165496944.5601.32.camel@localhost.localdomain>
	<4583D0B0.2080203@dominion.kabel.utwente.nl>
In-Reply-To: <4583D0B0.2080203@dominion.kabel.utwente.nl>
X-Provags-ID: kundenserver.de abuse@kundenserver.de
	login:3a738c603c23670681f156cc7e748d26
Subject: Re: To be removed recipes
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
X-List-Received-Date: Sat, 16 Dec 2006 14:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Koen Kooi schrieb:
> Richard Purdie schreef:
>
>  >> Package Name:   task-bootstrap*
> >>> Reason:         Obsoleted by task-base
> >> Have we anyone still using this? I'm nervous removing this just yet...
>
> I pushed back removal to next week, but I still haven't noticed anyone
> using it, so it
> will go away next week.
Dear Koen

I was using it in order to create a small image for my pxa270
development which  i do currently .
but i was not satisfied with the installation afterwards when i
installed gtk and X onto it.

I bet task-base will do the same for my needs. I planned to use the
minimlistic image i can get and then only install my additions one by
one and end up with the smallest
footprint possible, but i am sure task-base will do that trick also

Cheers
>
> regards,
>
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




