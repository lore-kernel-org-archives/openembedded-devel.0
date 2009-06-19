Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHVmf-0002gs-M9
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 06:33:02 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLG00CUEXH7KG70@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Jun 2009 21:22:23 -0700 (PDT)
Message-id: <17D8B8D1-E7F9-40BE-A1A3-284171C163BC@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jun 2009 08:22:08 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: additional armv7a-angstrom-linux-gnueabi folder in tmp/staging/i686-linux/usr/bin
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
X-List-Received-Date: Fri, 19 Jun 2009 04:33:02 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	After doing a recent update to the oe repository, I now noticed that  
there is a armv7a-angstrom-linux-gnueabi folder created under /tool/ 
overo-oe/tmp/staging/i686-linux/usr/bin. It wasn't there before until  
today.

Is this intentional?

I get this when I run the bitbake classpath command.

Elvis





