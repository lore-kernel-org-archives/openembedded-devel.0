Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>)
	id 1IMTjw-0004CN-S3; Sat, 18 Aug 2007 21:13:40 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.1.23]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>)
	id 1IMTjF-0008UR-Tj; Sat, 18 Aug 2007 21:12:58 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <44C22A1C-2EC8-41C9-AC47-17C35A1389A2@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sat, 18 Aug 2007 21:12:45 +0200
To: openembedded-users@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.1.2 (Tiger)
X-Gpgmail-State: signed
X-Mailer: Apple Mail (2.752.3)
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: [ANN] BitBake 1.8.8 available for download
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
X-List-Received-Date: Sat, 18 Aug 2007 19:13:41 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

For Your Information,

Version 1.8.8 of BitBake from the stable branch is available for  
download [1]. Thanks to the hard labor of Richard this release  
contains support for SRCREV, bug fixes and speed improvements. For  
more changes please consult the ChangeLog.

This release adds a requirement on pysqlite2 for sqlite3. On most  
distributions this package is called python-pysqlite2. It is required  
to support concurrent access to persistent data. This is a  
requirement of the SRCREV implementation.

We have tested the branch on old and new OE metadata and it should  
work for you as well. Please send comments and issues to the bitbake- 
dev mailinglist and file bug reports.


kind regards
	z.







[1]  http://download.berlios.de/bitbake/bitbake-1.8.8.tar.gz and  
http://download2.berlios.de/bitbake/bitbake-1.8.8.tar.gz
PS: 78f6c7507d33e7dcd7e001e7c7c113898114f001d3489e30a2ad556c56139171   
bitbake-1.8.8.tar.gz
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (Darwin)

iD8DBQFGx0SvGckbdURWU2oRAiI0AJ9sa8ExX+f8paQYxnohN51WZM3CjQCcCsiW
6ZImbCpEX30yCOKJVfnT1vc=
=/Hjh
-----END PGP SIGNATURE-----


