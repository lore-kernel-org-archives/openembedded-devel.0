Received: from qmta01.westchester.pa.hmc1.comcast.net ([76.96.53.8])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1OHh0T-0001fM-Oy
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 19:36:36 +0200
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta01.westchester.pa.hmc1.comcast.net with comcast
	id Nc8N1e00609Ku2s01hYJzU; Thu, 27 May 2010 17:32:18 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id NhYH1e0064SLwm302hYHQE; Thu, 27 May 2010 17:32:18 +0000
Message-ID: <4BFEAC3C.3060809@soundmetrics.com>
Date: Thu, 27 May 2010 10:30:36 -0700
From: John Faith <jfaith@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4BFE9AD1.6030003@soundmetrics.com>
In-Reply-To: <4BFE9AD1.6030003@soundmetrics.com>
X-SA-Exim-Connect-IP: 76.96.53.8
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Showing build dependencies, boost needs libxt?
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
X-List-Received-Date: Thu, 27 May 2010 17:36:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

John Faith wrote:
> ...  When I use 'bitbake -g 
> boost' I see no libxt or X11 stuff in the generated .dot files,...
>
>   
Never mind.  I found that updated oe source gives expected dependencies.

,
John


