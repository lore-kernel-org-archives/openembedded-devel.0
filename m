Received: from qmta03.westchester.pa.hmc1.comcast.net ([76.96.53.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1Og1Ft-0004ok-Ae
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 22:05:02 +0200
Received: from omta03.westchester.pa.hmc1.comcast.net ([76.96.53.19])
	by qmta03.westchester.pa.hmc1.comcast.net with comcast
	id pRHN1e0050Qry6409Y3Wf3; Mon, 02 Aug 2010 20:03:30 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta03.westchester.pa.hmc1.comcast.net with bizsmtp
	id pY3V1e0034SLwm301Y3VjX; Mon, 02 Aug 2010 20:03:30 +0000
Message-ID: <4C572463.4030009@soundmetrics.com>
Date: Mon, 02 Aug 2010 13:02:43 -0700
From: John Faith <jfaith@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <mailman.396.1280769240.17151.openembedded-devel@lists.openembedded.org>
	<4C571964.2070800@tycoelectronics.com>
In-Reply-To: <4C571964.2070800@tycoelectronics.com>
X-SA-Exim-Connect-IP: 76.96.53.20
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Chinese Fonts needed for xserver-xorg on OpenEmbedded
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
X-List-Received-Date: Mon, 02 Aug 2010 20:05:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jay Snyder wrote:
> I need to display Chinese fonts (unicode 4e00 & higher) on an 
> xserver-xorg based OE system.
> Is there a package(s) to install fonts that include these characters?
>   

Hi Jay,
I use the package ttf-sazanami-mincho in recipes/ttf-fonts/ for Japanese 
(on a non-X11 system) which has kanji glyphs over 4e00, or you might 
have a look at ttf-wqy-zenhei.

,
John



