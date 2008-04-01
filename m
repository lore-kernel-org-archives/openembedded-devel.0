Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jgn9v-0000sU-2g
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 22:32:43 +0200
Received: from [212.23.103.106] (helo=[10.161.175.249])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jgn9u-0005fW-AZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 22:32:42 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Apr 2008 22:32:28 +0200
User-Agent: KMail/1.9.9
References: <200803311438.09825.e.robertson.svg@gmail.com>
	<200804011648.57903.zecke@selfish.org>
	<200804011053.07102.e.robertson.svg@gmail.com>
In-Reply-To: <200804011053.07102.e.robertson.svg@gmail.com>
MIME-Version: 1.0
Message-Id: <200804012232.28549.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.106
Subject: Re: stable branch checksum missmatch for quilt-0.45
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
X-List-Received-Date: Tue, 01 Apr 2008 20:32:43 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 01 April 2008 17:52:56 E Robertson wrote:

>
> Thanks. I created a new TMPDIR and rebuild successfully.
>
> Unless their are any objections, I'll add this to the user manual along
> with a note that the best way to do a _clean_ build is to delete tmp dir
> contents(?).

Sure, this would be appreciated. You might want to attempt to come up with a 
patch to check this condition (of downgrading). 

You might want to backport changes to classes/sanity.bbclass.


take care
	z.


