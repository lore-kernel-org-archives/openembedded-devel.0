Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGZqg-00055n-2u
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 16:41:20 +0200
MIME-version: 1.0
Received: from [87.201.169.67] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLC00KGB5MHXA30@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 07:30:24 -0700 (PDT)
Message-id: <025E75AE-8E03-4BC6-B123-208388FC2B9E@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <A08B4996-5193-4730-9C12-D669170223C5@mac.com>
Date: Tue, 16 Jun 2009 18:30:06 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
	<A2AED021-1D87-4921-A330-FE9AF01C9FCD@mac.com>
	<303CFF24-F38E-46D2-A01D-16756614815F@mac.com>
	<d1b08f940906160324h11f182e2i82f92d2f65575724@mail.gmail.com>
	<8C98050F-2C26-4376-9A32-BAC900B5E832@mac.com>
	<A08B4996-5193-4730-9C12-D669170223C5@mac.com>
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
X-List-Received-Date: Tue, 16 Jun 2009 14:41:27 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I think I spoke too soon. As soon as I ran bitbake rxtx, the entire  
thing went back to it's old state and wouldn't configure any more.

Could someone who has managed to get rxtx or classpath to build  
correctly on oe please help? Or if someone could just give it a go and  
see this classpath errors occur, either when you bitbake classpath or  
if you bitbake rxtx, which internally depends on classpath?

Best regards,

Elvis



