Received: from [17.148.16.95] (helo=asmtpout020.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGpQ0-0006Yg-TT
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 09:18:51 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp020.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLD00EPEFTUGA70@asmtp020.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Jun 2009 00:08:22 -0700 (PDT)
Message-id: <3ADE3519-83F0-4C57-893D-E5FBF8805E18@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <DDF68D7F-F730-4372-A098-5F25AE7845B6@mac.com>
Date: Wed, 17 Jun 2009 11:08:07 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
	<A2AED021-1D87-4921-A330-FE9AF01C9FCD@mac.com>
	<303CFF24-F38E-46D2-A01D-16756614815F@mac.com>
	<d1b08f940906160324h11f182e2i82f92d2f65575724@mail.gmail.com>
	<8C98050F-2C26-4376-9A32-BAC900B5E832@mac.com>
	<A08B4996-5193-4730-9C12-D669170223C5@mac.com>
	<025E75AE-8E03-4BC6-B123-208388FC2B9E@mac.com>
	<DDF68D7F-F730-4372-A098-5F25AE7845B6@mac.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Wed, 17 Jun 2009 07:18:58 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I think the problem might be due to the fact that there is no ecj- 
initial binary being created :

checking if /tool/overo-oe/tmp/staging/i686-linux/usr/bin/ecj-initial  
is a version of gcj... /tool/overo-oe/tmp/work/i686-linux/classpath- 
initial-0.98-r6/classpath-0.98/configure: line 30425: /tool/overo-oe/ 
tmp/staging/i686-linux/usr/bin/ecj-initial: No such file or directory

How can I fix this?

Elvis



