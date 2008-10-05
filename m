Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KmXcT-0005U1-P4
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Oct 2008 19:42:14 +0200
Received: from 60-248-25-201.hinet-ip.hinet.net ([60.248.25.201]
	helo=tamarin.local) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KmXYC-00085u-4t
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Oct 2008 19:37:48 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 5 Oct 2008 19:37:38 +0200
User-Agent: KMail/1.9.9
References: <359c5480810050806t6e368b2fta20d1edecd165757@mail.gmail.com>
In-Reply-To: <359c5480810050806t6e368b2fta20d1edecd165757@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200810051937.40377.zecke@selfish.org>
Subject: Re: Qt 4.4.1 and sqlite
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
X-List-Received-Date: Sun, 05 Oct 2008 17:42:15 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 05 October 2008 17:06:53 Nicola Mfb wrote:
> Hi,
> while trying to port a custom qt/application to angstrom i noted that the
> qt sqlite driver is not available.
> May be it possible to have support for it?

sqlite2 or sqlite3? sqlite3 should always be part of Qt, and we do accept 
patches too.

z


