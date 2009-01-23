Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1LQJPl-00086l-6u
	for openembedded-devel@openembedded.org; Fri, 23 Jan 2009 11:37:29 +0100
Received: (qmail 10506 invoked by uid 107); 23 Jan 2009 10:30:08 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Fri, 23 Jan 2009 11:30:08 +0100
Message-ID: <49799C30.90508@epfl.ch>
Date: Fri, 23 Jan 2009 11:30:08 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <200901230131.09511.mickey@vanille-media.de>
	<87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
Subject: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 10:37:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> 
> I propose to change the workflow a bit (and reuse few points you've proposed):
> 
>  1. stop using bugtracker to handle patches
>  2. use mailing list to handle patches (comments bellow)
>  3. drop autobuilder bug reporting (comments bellow)
> 
> Besides, I have no objection about your points 2.2 and 2.3 but I'm too
> new in the OE environment to comment about them so let me comment
> about my points:
> 
>  1 and 2:
> 
>  We're trying to get more people to review the changes to be done in
>  OE dev tree and bugzilla UI is horrible and difficult to use (at
>  least for me). Most people ends up redoing someone else patch since
>  we don't watch carefully the bugtrack.
> 
>  I propose we move to mailing list reviewing process mostly like Linux
>  kernel does. We can use PatchWork (http://ozlabs.org/~jk/projects/patchwork/)
>  tool to make our life easier. I see some pros for that:
> 
>   . people will get more review into the patches
>   . people will be aware of ongoing work and what is being prepared to
>     be merged
>   . less forgotten patches
>   . less duplicated work
> 
>  I also see a single con for that:
> 
>   . more mailing list traffic
> 

Even if I am not very much involved in the OE development, I completely
agree with Otavio. The few patches that I have proposed are often stuck
on the bugzilla. Maybe it would be better with a mailing-list.

Furthermore, now that we use git, we have plenty of tools to send
patches to a mailing-list (format-patch, send-email and am).

I would definitely support a patch review style like on the linux kernel
mailing-lists even if this implies a high-traffic list (with simple
filter rules in your mail client, it's easy to handle). However, I don't
think it would be a good idea to have two lists.

My 2 c.

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


