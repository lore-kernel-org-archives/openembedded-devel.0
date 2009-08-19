Received: from [63.228.1.57] (helo=gate.crashing.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galak@kernel.crashing.org>) id 1MdqEA-00065C-Ca
	for openembedded-devel@openembedded.org; Wed, 19 Aug 2009 20:49:42 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id n7JIWSKw020122
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 13:32:28 -0500
Message-Id: <4580C4E7-8991-46E7-AC1A-1DEDEF9A9F65@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 19 Aug 2009 13:32:26 -0500
X-Mailer: Apple Mail (2.936)
Subject: fedora 11 package list on wiki
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
X-List-Received-Date: Wed, 19 Aug 2009 18:49:42 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The wiki page:

http://wiki.openembedded.net/index.php/OEandYourDistro

lists:

python-psyco

as one of the packages to install on fedora 11.  however this package  
does not exist.  I'm not sure exactly which of the following should  
replace it:

python-psycopg.x86_64 : PostgreSQL database adapter for Python
python-psycopg2.x86_64 : A PostgreSQL database adapter for Python
python-psycopg2-doc.x86_64 : Documentation for psycopg python PostgreSQL
                            : database adapter

- k


