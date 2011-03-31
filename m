Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5L1R-0002ye-K4
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 18:47:01 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5KzW-000023-UG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 09:45:02 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 09:45:02 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 09:45:01 -0700
Message-ID: <4D94AF84.8020000@mentor.com>
Date: Thu, 31 Mar 2011 09:44:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110331074506.GB23178@denix.org> <in1gf0$aun$1@dough.gmane.org>
In-Reply-To: <in1gf0$aun$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 16:45:02.0764 (UTC)
	FILETIME=[FB380EC0:01CBEFC2]
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 16:47:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/31/2011 02:10 AM, Koen Kooi wrote:
> On 31-03-11 09:45, Denys Dmytriyenko wrote:
>> Tom,
> 
>> Please pull these 8 commits for the external Angstrom toolchain fix,
>> qt4 security advisory fix, as well as for addition of new TI machines.
>> All are cherry picked from oe.dev
> 
> Merging it like this creates a few broken commits because the machines
> were added first. Is that really what we want?

We do not.  Denys, please re-order the commits so that things are
building in each commit.  Thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlK+EAAoJEI4NMjfc3nJxFiAIAKTxXOFRRJ1EmYy3meXOX3yJ
WVaXrFmCYcFSU+E9YcFuW9NPd1k4rpSZfI7n4Ezdsqo+GiwMmNwFbAm63DL0al99
t/aEsSHxXsaoj++M529hTmnyS66WodqlYgIxbi8nzNx/ETYDyenQN1I278Ums3b3
RtTIsYJVHCthQTK0991lmjyqC9cFGKSyW2j4J3bLrozdP2tOIqt5j/rXOAnsTNK0
O/OonrOewcqolzSpEFRmwgvKTiB77q7VDYTJRWSZ/tZ2sx8Z1ZJ59Ms2KMB+CvMJ
MBT0zQgtJrSwizrCNUemeLYyDBdRb771e2A9trOEcFw54TeenMzeYm8Z60+iQQE=
=j3tp
-----END PGP SIGNATURE-----


