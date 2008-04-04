Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JhknR-0004Zs-Hn
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 14:13:29 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JhknR-00074P-3y
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 14:13:29 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Apr 2008 14:13:28 +0200
User-Agent: KMail/1.9.9
References: <20080403083605.GG28970@buddha.tw.openmoko.com>
In-Reply-To: <20080403083605.GG28970@buddha.tw.openmoko.com>
MIME-Version: 1.0
Message-Id: <200804041413.28784.zecke@selfish.org>
Subject: Re: cvs date & timezone problem
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
X-List-Received-Date: Fri, 04 Apr 2008 12:13:29 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 03 April 2008 10:36:05 John Lee wrote:
> Hi,
>


> However, if I build the e-wm in Taiwan, `enlightenment.pc.in' does not
> exist yet on 20080328 Taiwan time.  The build will fail.
>
> I would suggest set cvs fetch in bitbake to always use UTC+0 for this
> matter and we set the min and max date according to UTC+0 instead of
> our own timezone.  Enclosed please find the patch to the bitbake 1.8
> branch.

patch looks sane, I will apply it.

thank you

	z.


PS: I always assumed the server's time will be used...


