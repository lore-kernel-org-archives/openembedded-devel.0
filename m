Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q3s1E-0002X2-Co
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 17:36:44 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q3rzK-00053i-2d from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 08:34:46 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 27 Mar 2011 08:33:28 -0700
Received: from [172.30.80.83] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 27 Mar 2011 08:34:45 -0700
Message-ID: <4D8F5910.1060803@mentor.com>
Date: Sun, 27 Mar 2011 08:34:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110326023201.GA13132@denix.org>
In-Reply-To: <20110326023201.GA13132@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Mar 2011 15:33:28.0755 (UTC)
	FILETIME=[52234830:01CBEC94]
Subject: Re: [2011.03-maintenance] Pull request for external toolchains updates	and matrix-gui
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
X-List-Received-Date: Sun, 27 Mar 2011 15:36:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/25/2011 07:32 PM, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull these 8 commits for the external CSL and Angstrom toolchains, as well
> as a trivial SRCREV update for TI's matrix-gui. All are cherry picked from oe.dev
> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>

$ git pull git://arago-project.org/git/people/denix/openembedded.git
2011.03-maintenance
fatal: The remote end hung up unexpectedly

Otherwise I'd apply this.  Thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEbBAEBAgAGBQJNj1kQAAoJEI4NMjfc3nJxMwMH+I14nU3I3rlFiFI9f/rsKD6E
s34FhZZxtTdQ8iYK+fZP00UPlIyvUkFm1BGwpm0OCPUhMIgajRIJeKqFoDK9YQ2M
R2SmzG09bQDjo9lGJFJ+9+YSJI2KigcpVE70ARZfgaSENvRbYzUnekrffg3pvfGs
QuTFgI4BQnZn9PChxD60OQnXyda4l+4HtlMgS/BYnqswOZTuJdpeVpaQpNCl33Pm
YAtozoVPCRgecZMQ5PEyG/J2wuQOboENZ3rTkrXIJu+e24a/FcVhGfo+sSXbpC3w
mcXwrkMNo4uraQwTwGbq8RTcKpjOqIIOXJUoGVbYXMs7o6+Cj2m2yH9sZb9HNQ==
=DSaz
-----END PGP SIGNATURE-----


