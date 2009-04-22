Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwV4v-0007Wk-7f
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 07:33:01 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwV0Y-000AMs-7I
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 09:28:30 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 09:28:27 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <gsl3do$sov$1@ger.gmane.org> <200904220025.33983.khimov@altell.ru>
	<gslbjh$pvu$1@ger.gmane.org>
In-Reply-To: <gslbjh$pvu$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904220928.27353.khimov@altell.ru>
Subject: Re: Cleaning out patchwork queue
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
X-List-Received-Date: Wed, 22 Apr 2009 05:33:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 22 April 2009 00:50:57 Koen Kooi wrote:
> On 21-04-09 22:25, Roman I Khimov wrote:
> > On Tuesday 21 April 2009 22:31:20 Koen Kooi wrote:
> >> If you have outstanding patches and no commit access (hi Roman!) ping
> >> them again on this list and pester people in IRC to apply them.
> >
> > Well, don't like to pester people in general, but there you go.
>
> Could you have a look at your patches listed here:
> http://patchwork.openembedded.org/project/openembedded/list/?state=3D3

=46rom that list tnef, bison-native-2.3, glibc-initial 2.7 and glibc 2.7 FT=
BFS=20
are commited already as commits

97b340db7c7b9ee3ed53e02eaa63c9873f4e1610
f03f431e75c4e8d5f811a95595821189315a0da1
1536adf83fc2645906081f7064a229f9e7f9b877
fea3ee7d662126e76ff65d82b1ec0027330f93ad

respectively. So the only left is siproxd and that should work, at least I'=
ve=20
rebased its local branch successfully here.


