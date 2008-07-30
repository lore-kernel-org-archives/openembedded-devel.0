Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>)
	id 1KOFvT-00043R-Il; Wed, 30 Jul 2008 19:57:27 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>)
	id 1KOFto-0000LE-BB; Wed, 30 Jul 2008 18:55:44 +0100
Date: Wed, 30 Jul 2008 18:55:44 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
Message-ID: <20080730175542.GH6813@sirena.org.uk>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
	<489084EE.9070407@whitby.id.au>
	<1217434487.5510.64.camel@dax.rpnet.com>
	<871w1b1dih.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <871w1b1dih.fsf@neumann.lab.ossystems.com.br>
X-Cookie: Those who can't write, write manuals.
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk);
	SAEximRunCond expanded to false
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
X-List-Received-Date: Wed, 30 Jul 2008 17:57:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2008 at 02:35:18PM -0300, Otavio Salvador wrote:
> Richard Purdie <rpurdie@rpsys.net> writes:

> > Note that your AUTHORS file would also break with this approach unless
> > at merge time you grep the external tree for all email addresses and
> > then add them which would be tedious at best.

> His proposal is for the commiters ID not the authors ID. We can assume
> that someone who has push right is also an OE author.

Only if the person doing the push hasn't pulled commits from anywhere
else - git protocol transfers don't change the committer so if patches
enter the tree being pushed via a git pull then the committer may not be
an OE person.

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."


