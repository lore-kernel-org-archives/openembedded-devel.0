Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI7yS-0001yn-0x
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 23:19:44 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00A6G2QR4P30@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 14:08:55 -0700 (PDT)
Message-id: <822E6C7A-8850-4C27-8030-D6348FC1D9A9@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245531218.29153.296.camel@lenovo.internal.reciva.com>
Date: Sun, 21 Jun 2009 01:08:34 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Writing a test program for libserial
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
X-List-Received-Date: Sat, 20 Jun 2009 21:19:44 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed

Hi Phil,
		Thanks for the help!!

Elvis

On Jun 21, 2009, at 12:53 AM, Phil Blundell wrote:

> Try:
>
> SRC_URI = "file://read_port.cpp"
> S = "${WORKDIR}"
>
> If you have multiple source files, just list them all in SRC_URI,
> separated by spaces.
>



