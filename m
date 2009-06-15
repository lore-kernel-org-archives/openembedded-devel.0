Received: from [17.148.16.91] (helo=asmtpout016.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGAHH-0002Bv-4X
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 13:23:03 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp016.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA00BTS1T8OK30@asmtp016.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 04:12:48 -0700 (PDT)
Message-id: <ED279EA4-A74C-42B1-83A8-6D0B470A98E7@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2009 15:12:34 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: How to get rxtx recipe to work
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
X-List-Received-Date: Mon, 15 Jun 2009 11:23:03 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	What are the recommended settings for the following preferred  
providers for using the rxtx recipe?

I have set the following, are they okay?

PREFERRED_PROVIDER_virtual/javac-native = "openjdk-javac-native"
PREFERRED_PROVIDER_classpath = "classpath"
PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"


Elvis




