Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>)
	id 1K8ETM-00068c-RO; Mon, 16 Jun 2008 15:10:13 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>)
	id 1K8ESi-0007p0-Ui; Mon, 16 Jun 2008 14:09:33 +0100
Date: Mon, 16 Jun 2008 14:09:32 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
Message-ID: <20080616130932.GA22229@sirena.org.uk>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<g2tv3m$t5l$1@ger.gmane.org>
	<74d0deb30806130925u7ec0c1e4sfdf2144e703f2b9a@mail.gmail.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <87od65rxi8.fsf@neumann.lab.ossystems.com.br>
X-Cookie: Avoid contact with skin.
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk);
	SAEximRunCond expanded to false
Subject: Re: Switching SCM to git and commit/review policy
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
X-List-Received-Date: Mon, 16 Jun 2008 13:10:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2008 at 03:38:23PM -0300, Otavio Salvador wrote:

> I don't know how kernel people do to amend the patch to add the
> acked-by/whatever data into each patch. It can be a big amount of work
> to do an iteractive rebase for every ack given on ml for each patch
> and with a high risk of human mistake while doing it.

For the most part everything except the Signed-off-by is added by the
patch submitter as they submit and resubmit the patch - often that
information will just get dropped on the floor otherwise.

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."


