Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <normanschleicher@gmx.de>) id 1S51rR-0000ty-5S
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 22:23:57 +0100
Received: (qmail invoked by alias); 06 Mar 2012 21:08:40 -0000
Received: from 178-27-184-116-dynip.superkabel.de (EHLO [192.168.178.46])
	[178.27.184.116]
	by mail.gmx.net (mp002) with SMTP; 06 Mar 2012 22:08:40 +0100
X-Authenticated: #8134161
X-Provags-ID: V01U2FsdGVkX19RfNgOlwxROB7pja35uANbDDiaKp/aBXMeIfcxQv
	dvy1lzIsQsEFz4
Message-ID: <4F567CD3.4080604@gmx.de>
Date: Tue, 06 Mar 2012 22:08:35 +0100
From: Norman Schleicher <normanschleicher@gmx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
Subject: ca-certificates no longer available, upgrade needed
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
X-List-Received-Date: Tue, 06 Mar 2012 21:23:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
during build following error occours:

ERROR: Task 3064 (/var/lib/jenkins/jobs/pandaboard-angstrom/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb, do_fetch) failed with exit code '1'

a patch is available:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/038319.html

can someone fix please ?

Cheers Norman



