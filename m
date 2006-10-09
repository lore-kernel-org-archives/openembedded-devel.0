Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <dp@xora.org.uk>) id 1GWqRb-0004hy-Ax
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 10:25:03 +0200
Received: from xora.org.uk ([::ffff:85.210.161.143])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 09 Oct 2006 09:18:52 +0100
	id 000041DE.452A05EC.000043ED
Date: Mon, 9 Oct 2006 09:14:46 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061009081446.GA2541@stygia.hyboria>
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <45296EB8.7070704@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.11
Subject: Re: [RFC] Removing MAINTAINER field from recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 08:25:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I shall start by saying that I do not like this proposal.

>  * A lot of the MAINTAINER fields are stale
Not a reason to nuke fields of files where they are not stale.

>  * Not all people listed in the MAINTAINER fields (want to) have commit access
Then there should be a policy of only having a MAINTAINER field with
your email address if you are an oe developer.

>  * People have blindly copied recipes without contacting the respective MAINTAINER
This is due to the above staleness and peoples lack of commit status.

>  * Certain MAINTAINER only care about supporting their $DISTRO
Then they should no claim MAINTAINER of generic packages.

>  * The SCM (monotone) holds all the information about who added the recipes and who edited
> them.
> 
Not normally in a nice easy to read manner.

All the packages that I am listed as maintainer on I actively try and
maintain and improve the quality of. I would like people to feel they
can contact me to moan and complain about their lack of workingness on
their machine or distro of choice. I can then try and work with the
distro maintainers to get a fix into the generic .dev and then pushed
out into the distro that needs it.

I feel rather than nuking the MAINTAINER field which I feel is a useful
peice of information. That it would be more productive to come up with a
set of policies governing peoples MAINTAINERSHIP. I cant see debian for
example dropping all package maintainers overnight.

Maybe for example for people who dont want OE access but want to fix up
software we start some form of sponsorship where an OE dev with an
interest in that package can list as MAINTAINER but pass out bugs etc to
the actual MAINTAINER.

Thanks

Graeme

List of packages as like original proposers.

kismet, links. dillo, mplayer, sulpheed, sylpheed-claws, gqview, fbpanel
tightvnc, epdfview, xmms-tremor, xmms-mad



