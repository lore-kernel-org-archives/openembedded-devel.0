Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q7PKy-0002Al-6Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 11:47:44 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q7PIx-0000vB-LZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 11:45:39 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110404150506.3995e1f6.ospite@studenti.unina.it>
References: <1301416483-7255-1-git-send-email-ospite@studenti.unina.it>
	<20110404150506.3995e1f6.ospite@studenti.unina.it>
Date: Wed, 06 Apr 2011 10:45:37 +0100
Message-ID: <1302083137.14449.352.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC, PATCH] classes/mirrors.bbclass: add mirror for download.osgeo.org
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
X-List-Received-Date: Wed, 06 Apr 2011 09:47:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-04 at 15:05 +0200, Antonio Ospite wrote:
> On Tue, 29 Mar 2011 18:34:43 +0200
> Antonio Ospite <ospite@studenti.unina.it> wrote:
> 
> > The host download.osgeo.org is not reachable from some network/country
> > because of some routing issue, and this makes the do_fetch task of the
> > libtiff recipe to fail:
> > 
> [..]
> 
> > Add a reachable mirror for it, so that the tiff recipe can build fine.
> > 
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > ---
> > 
> > A less invasive solution would be to change the SRC_URI address directly in 
> > the recipe, but I don't know if that can affects anyone else, or we can even 
> > have a copy of the archive hosted on mirrors.openembedded.org and live with 
> > that until the next release. What is  your opinion?
> > 
> 
> Ping.

Acked-by: Phil Blundell <philb@gnu.org>

p.




