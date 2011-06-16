Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QX7Ro-0004H0-9I
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 09:57:15 +0200
Received: (qmail invoked by alias); 16 Jun 2011 07:53:33 -0000
Received: from p57963E0B.dip.t-dialin.net (EHLO localhost.localdomain)
	[87.150.62.11]
	by mail.gmx.net (mp020) with SMTP; 16 Jun 2011 09:53:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+epaApQPqexXcdWV2eQzJl3n8S226PJ8OG1/kYG0
	fYpjl6Xexo5D/P
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2011 09:54:58 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-91.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201106160954.59066.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH v2 0/2] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Thu, 16 Jun 2011 07:57:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, June 06, 2011 11:25:43 PM Andreas Mueller wrote:
> Changes to V1:
> 
> * changed commit messages
> * split patch
> 
> Andreas Mueller (2):
>   mx28 SOC: set correct addresses for u-boot
>   mx28evk: set valid console
> 
>  conf/machine/include/imx28.inc |    4 ++--
>  conf/machine/mx28evk.conf      |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
Can somebody please take care for these harmless 3 lines?

Andreas


