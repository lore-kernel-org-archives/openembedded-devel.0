Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5OeB-00041b-Cz
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:39:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q5OcG-0007A7-Hu from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 13:37:16 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 13:35:37 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 13:37:15 -0700
Message-ID: <4D94E5F2.7080401@mentor.com>
Date: Thu, 31 Mar 2011 13:37:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <in2jl3$i21$1@dough.gmane.org>
In-Reply-To: <in2jl3$i21$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 20:35:37.0646 (UTC)
	FILETIME=[317384E0:01CBEFE3]
Subject: Re: [2011.03-maintenance] Pull request #10 (replaces #9)
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
X-List-Received-Date: Thu, 31 Mar 2011 20:39:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/31/2011 12:11 PM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 3 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Philip Balister (3):
>       autoconf: Fix paths for scripts installed on the target.
>       automake: Fix paths in scripts installed on target.
>       qmake2: Define env var for strip. Convert to use INC_PR.

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlOXxAAoJEI4NMjfc3nJx3HAH/izVxo3dz+2R4LERWg/R7Kjb
EESJHLvkYHOBDyodCApOigPT+yNf7rOFKS51LBXD8Jl5D+SvAUbtWXoSbDaY5Pff
GW92W1KnxLPDVyGh55HxQ6ei2cuwlqjo2Pr6c/0tMcbkMQYVOX3SoZqlHgxyPhOd
Hi+aQnYbgbXCsuWphkEmAmhV8ggxruW0UTaTQd6punoaqOvAFI9dQ2BUzrN60eku
ki+jlMyCH7NmigkJwCOHR8uPnx5S0jYvQY9EnY+c43/b6783csBnQ44OpxInA7nn
LkzEqEtgqfR5c8u6ZqzSlXLktYW96b3xov1VvqhaDNyHjcvj8HxRX+sK2SjhFq4=
=F7RD
-----END PGP SIGNATURE-----


